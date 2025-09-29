# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

FROM homebrew/ubuntu24.04:4.6.15

COPY . "/home/linuxbrew/dotanuki-taps"
COPY e2e/tests.sh /usr/bin/tests.sh

ENTRYPOINT ["/usr/bin/tests.sh"]
