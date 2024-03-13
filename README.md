# Arch package backup

A simple wrapper script for the pacman package manager in Arch Linux. It installs packages and records them for future reference.

### Features

-   Adds installed packages to a record.
-   Prompts before adding packages to the record.
-   Preserves pacman flags.

### Usage

Run the script like pacman. For example:


`./pac.sh -S package_name`

### Record

Installed packages are added to ~/.config/my_tools/installed_packages.sh.

