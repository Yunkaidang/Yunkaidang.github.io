#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
RUBY_ENV_ROOT="/data1/dangyunkai/conda_envs/jekyll_site"
GEM_ROOT="$RUBY_ENV_ROOT/share/rubygems"
PORT="${1:-8080}"

if [[ ! -x "$RUBY_ENV_ROOT/bin/ruby" ]]; then
  echo "Ruby runtime not found: $RUBY_ENV_ROOT/bin/ruby"
  exit 1
fi

cd "$PROJECT_DIR"

export GEM_HOME="$GEM_ROOT"
export GEM_PATH="$GEM_ROOT"

if ss -ltn "( sport = :$PORT )" | tail -n +2 | grep -q .; then
  echo "Port $PORT is already in use."
  echo "Open: http://127.0.0.1:$PORT"
  echo "Or start on another port: ./bin/serve_local.sh 8081"
  exit 1
fi

exec "$RUBY_ENV_ROOT/bin/ruby" \
  "$GEM_ROOT/bin/bundle" \
  _2.5.23_ exec jekyll serve --watch --host 0.0.0.0 --port "$PORT"
