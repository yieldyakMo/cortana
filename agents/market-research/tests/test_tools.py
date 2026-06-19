import importlib.util
import json
import math
from pathlib import Path
import subprocess
import sys
import unittest


ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / "tools"


def load_module(name):
    spec = importlib.util.spec_from_file_location(name, TOOLS / f"{name}.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class ToolTests(unittest.TestCase):
    def test_macd_has_real_signal_and_histogram(self):
        ta = load_module("technical_analysis")
        prices = [100 + i * 0.4 + math.sin(i / 3) for i in range(80)]
        line, signal, histogram = ta.calculate_macd(prices)
        self.assertIsNotNone(line)
        self.assertIsNotNone(signal)
        self.assertAlmostEqual(histogram, line - signal)
        self.assertNotEqual(histogram, 0)

    def test_long_and_short_profit_percent_are_positive(self):
        ps = load_module("position_sizer")
        long_levels, is_long = ps.calculate_take_profit_levels(100, 90, [2])
        self.assertTrue(is_long)
        self.assertEqual(long_levels[0]["price"], 120)
        self.assertEqual(long_levels[0]["profit_percent"], 20)

        short_levels, is_long = ps.calculate_take_profit_levels(100, 110, [2])
        self.assertFalse(is_long)
        self.assertEqual(short_levels[0]["price"], 80)
        self.assertEqual(short_levels[0]["profit_percent"], 20)

    def test_dca_rejects_non_positive_values(self):
        dca = load_module("dca_calculator")
        with self.assertRaises(ValueError):
            dca.calculate_dca_schedule(0, "weekly", 30)
        with self.assertRaises(ValueError):
            dca.calculate_dca_schedule(100, "weekly", 0)

    def test_symbol_validation_blocks_query_injection(self):
        market = load_module("binance_market")
        with self.assertRaises(ValueError):
            market.validate_symbol("BTCUSDT&limit=5000")
        self.assertEqual(market.validate_symbol("btcusdt"), "BTCUSDT")

    def test_technical_analysis_json_is_parseable(self):
        klines = []
        for i in range(80):
            close = 100 + i * 0.2 + math.sin(i / 4)
            klines.append(
                {
                    "open_time": i,
                    "open": close - 0.1,
                    "high": close + 0.5,
                    "low": close - 0.5,
                    "close": close,
                    "volume": 1000 + i,
                    "close_time": i + 1,
                    "quote_volume": (1000 + i) * close,
                }
            )

        fixture = ROOT / "tests" / "klines-fixture.json"
        fixture.write_text(json.dumps(klines))
        try:
            result = subprocess.run(
                [
                    sys.executable,
                    str(TOOLS / "technical_analysis.py"),
                    "--input",
                    str(fixture),
                    "--json",
                ],
                check=True,
                capture_output=True,
                text=True,
            )
            parsed = json.loads(result.stdout)
            self.assertIn("macd", parsed)
        finally:
            fixture.unlink(missing_ok=True)


if __name__ == "__main__":
    unittest.main()

