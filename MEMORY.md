# MEMORY.md

## Current Baseline
- Workspace identity and operating rules were reconciled on 2026-06-17.
- The agent should use the repo-local self-improving and proactivity files as working state.

## Benchmarks
- On 2026-06-18, the raw Ollama API benchmark for `hf.co/Qwen/Qwen3-8B-GGUF:Q5_K_M` on the CPU VM took 27.86s total, with 17.14s load, 2.29s prompt eval, and 8.36s eval; the pre-reboot `qwen3.5:4b` baseline from 2026-06-14 took 14.08s total, with 9.39s load, 3.68s prompt eval, and 0.93s eval on the same prompt.
- On 2026-06-18, rerunning the exact `qwen3.5:4b` raw Ollama API benchmark on the CPU VM took 10.67s total, with 7.91s load, 1.54s prompt eval, and 1.13s eval; that is faster overall than the pre-reboot run on the same prompt.
- On 2026-06-18, the local OpenClaw agent was set to use `ollama/qwen3.5:4b` as its default model; verify that lane with `openclaw models status --agent local`.
