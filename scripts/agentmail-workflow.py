#!/usr/bin/env python3
"""Minimal AgentMail workflow helper for inbox and message automation.

Requires:
  pip install agentmail python-dotenv

Config:
  AGENTMAIL_API_KEY in the environment or a local .env file.
"""

from __future__ import annotations

import argparse
import os
import sys

try:
    from dotenv import load_dotenv
    from agentmail import AgentMail
except Exception as exc:  # pragma: no cover - import guard
    print(
        "Missing AgentMail dependencies. Install with:\n"
        "  pip install agentmail python-dotenv",
        file=sys.stderr,
    )
    raise SystemExit(1) from exc


def client() -> AgentMail:
    load_dotenv()
    api_key = os.getenv("AGENTMAIL_API_KEY")
    if not api_key:
        raise SystemExit("AGENTMAIL_API_KEY is not set.")
    return AgentMail(api_key=api_key)


def cmd_bootstrap(args: argparse.Namespace) -> int:
    am = client()
    inbox = am.inboxes.create(client_id=args.client_id)
    print(inbox)
    return 0


def cmd_send(args: argparse.Namespace) -> int:
    am = client()
    am.inboxes.messages.send(
        args.inbox_id,
        to=args.to,
        subject=args.subject,
        text=args.text,
        html=args.html,
    )
    print("sent")
    return 0


def cmd_list(args: argparse.Namespace) -> int:
    am = client()
    res = am.inboxes.messages.list(args.inbox_id, limit=args.limit)
    for msg in res.messages:
        text = getattr(msg, "extracted_text", None) or getattr(msg, "text", None) or ""
        print(f"{msg.subject}\n{text}\n---")
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="AgentMail workflow helper")
    sub = parser.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("bootstrap-inbox", help="Create a new inbox")
    p.add_argument("--client-id", default="openclaw-agentmail-workflow")
    p.set_defaults(func=cmd_bootstrap)

    p = sub.add_parser("send", help="Send an email")
    p.add_argument("inbox_id")
    p.add_argument("--to", required=True)
    p.add_argument("--subject", required=True)
    p.add_argument("--text", required=True)
    p.add_argument("--html")
    p.set_defaults(func=cmd_send)

    p = sub.add_parser("list", help="List recent inbox messages")
    p.add_argument("inbox_id")
    p.add_argument("--limit", type=int, default=10)
    p.set_defaults(func=cmd_list)

    return parser


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()
    return args.func(args)


if __name__ == "__main__":
    raise SystemExit(main())
