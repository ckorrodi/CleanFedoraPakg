#!/bin/bash
# Removes old revisions of snaps
# Close all SNAP APPS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

# Remove unused flatpak apps
# Close all flatpaks apps
flatpak uninstall --unused 
