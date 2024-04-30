#!/usr/bin/env bash

set -euo pipefail


export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_FROM_API=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

tap_formulas() {
    brew tap dotanuki-labs/tap "/home/linuxbrew/dotanuki-taps"

    echo
    echo "Checking formulae collection"
    echo
    brew tap-info dotanuki-labs/tap

    ls -la /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/dotanuki-labs/homebrew-tap
    echo
}


test_formula() {
    local name="$1"
    local url="$2"

    echo
    echo "Installing $name ($url)"
    brew install "$name" -vd

    echo
    echo "Testing installation ($name)"
    "$name" --help
    echo
}


tap_formulas
# test_formula "gwv" "https://github.com/dotanuki-labs/gradle-wrapper-validator"

echo
echo "🔥 Done!"
echo
