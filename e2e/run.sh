#!/usr/bin/env bash
# Copyright 2025 Dotanuki Labs
# SPDX-License-Identifier: MIT

set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${dir%/*}"

echo
echo "🔥 Building Docker image for tests!"
echo

docker build . -t dotanuki-labs/homebrew-taps -f e2e/Dockerfile

echo
echo "🔥 Running tests"
echo

docker run --rm dotanuki-labs/homebrew-taps

echo
echo "✅ Done!"
echo
