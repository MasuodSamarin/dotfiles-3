# [Boseji's](https://github.com/boseji) dotfiles - Linux configuration files

This repository contains various scripts and configuration files -
for the Linux distribution used by [@boseji](https://github.com/boseji) .

Note: The artifact are highly opinionated and specific to 
[@boseji's](https://boseji.com) liking.

## Installation

> **Warning:** If you are not sure about what these files
> might do to your system - DO NOT Proceed !
>
> **Use them at your own risk !**

```shell
# Clone and Initialize
cd && git clone https://github.com/boseji/dotfiles.git && \
    cd dotfiles && ./install-packages \
    && ./install-bin && ./install-profile
...
# Optionally run other install scripts
...

# Install other packages
./install-hugo

```

## License

All the files in this repository conform to 
[**GNU General Public License v2.0**](LICENSE)
unless otherwise specified.

SPDX-License-Identifier: GPL-2.0-only
