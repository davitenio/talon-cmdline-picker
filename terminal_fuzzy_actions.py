from talon import Module, Context, actions
import subprocess
import time

mod = Module()
mod.list("fuzzy_target", desc="fuzzy targets")

FISH = "/opt/homebrew/bin/fish"  # use `which fish` to confirm

@mod.action_class
class Actions:
    def fuzzy_find(where: str, what: str):
        """Trigger the fish fuzzy picker inline."""

        # --------------------------------------------------------
        # Core idea: Talon does NOT run the function fuzzy_dispatch in
        # ~/.config/fish/config.fish directly.
        #
        # Instead, Talon sets two shared Fish variables:
        #
        #   FUZZY_WHERE = where to search
        #     examples: home, downloads, documents, here, up, root
        #
        #   FUZZY_WHAT = what to search for
        #     "file" = files
        #     "dir"  = directories
        #
        # These are UNIVERSAL Fish variables (-U), which means a
        # separate Fish process can update them and the interactive
        # shell will see the changes immediately.
        # --------------------------------------------------------
        subprocess.run([
            FISH, "-c",
            f"set -U FUZZY_WHERE {where}; set -U FUZZY_WHAT {what}"
        ])
        # Give fish a moment to register the variable updates
        time.sleep(0.05)

        # --------------------------------------------------------
        # Trigger the fuzzy picker.
        #
        # In config.fish we bind Ctrl-G to the function fuzzy_dispatch:
        #
        #   bind -M default ctrl-g fuzzy_dispatch
        #
        # Pressing Ctrl-G executes fuzzy_dispatch, which causes Fish to:
        #   1. Read FUZZY_WHERE and FUZZY_WHAT
        #   2. Run fd + fzf in the appropriate location
        #   3. Insert the selected path into the current command line
        # --------------------------------------------------------
        actions.key("ctrl-g")

    def fuzzy_letters(letters: list[str]):
        """
        Spell exact characters into fzf's filename search field.

        Example:
            spoken "drum odd cap" -> letters = "doc"
            -> types "doc" into fzf, narrowing the list to paths
               that contain d, o, c in that order.

        Because --nth=2.. is set in the fzf invocation, this only
        ever searches the [real path column, never the hint column,
        so narrowing and hints can never interfere with each other.
        """
        actions.insert("".join(letters))

    def fuzzy_take(letters: list[str]):
        """
        Jump directly to the item whose hint matches these letters.

        Example:
            spoken "take air bat" -> letters = "ab"
            -> switches fzf to search the hint column, types "AB",
               and presses enter.

        Works whether or not you've narrowed the list first, since
        hints are assigned to every line up front, before any
        filtering happens.
        """
        hint = "".join(letters).upper()
        actions.key("ctrl-h")
        actions.insert(hint)
        time.sleep(0.03)
        actions.key("enter")