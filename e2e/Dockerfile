# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

FROM homebrew/brew:4.2.20

COPY . "/home/linuxbrew/dotanuki-taps"
COPY e2e/check-formulas.sh /usr/bin/check-formulas.sh

ENTRYPOINT ["/usr/bin/check-formulas.sh"]
