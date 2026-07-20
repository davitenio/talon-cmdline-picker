#!/usr/bin/env bash
set -euo pipefail

PICKER="$HOME/.talon/user/talon-cmdline-picker"

link() {
    local source="$1"
    local target="$2"

    # Create parent directory if needed
    mkdir -p "$(dirname "$target")"

    # Backup existing file if it is not already a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv "$target" "$target.backup.$(date +%Y%m%d-%H%M%S)"
    fi

    # Create/update symlink
    ln -sfn "$source" "$target"
    echo "Linked $target to $source"
}

# Fish shell
link "$PICKER/fish/hint_gen.py" "$HOME/.config/fish/scripts/hint_gen.py"
link "$PICKER/fish/talon_commandline_picker.fish" "$HOME/.config/fish/conf.d/talon_commandline_picker.fish"

echo "All dotfiles linked."