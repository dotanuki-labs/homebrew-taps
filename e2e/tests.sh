#!/usr/bin/env bash
# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

set -euo pipefail


export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

tap_formulas() {
    brew tap dotanuki-labs/tap "/home/linuxbrew/dotanuki-taps"

    echo
    echo "Checking formulae collection"
    echo
    brew tap-info dotanuki-labs/tap
    echo
}


test_formula() {
    local name="$1"
    local url="$2"

    echo
    echo "Installing $name ($url)"
    brew install "$name"

    echo
    echo "Testing installation ($name) --help"
    echo
    "$name" --help

    echo
}


tap_formulas
test_formula "gwv" "https://github.com/dotanuki-labs/gradle-wrapper-validator"

echo
echo "🔥 Done!"
echo
