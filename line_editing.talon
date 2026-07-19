app: terminal
os: mac
-

# --- line editing (zsh's default emacs-style bindings) ---
# NOTE: on macOS the alt-based ones require your terminal to send
# "Meta" for Option.

# Jump to start of line.
head:
    key(ctrl-a)

# Jump to end of line.
tail:
    key(ctrl-e)

# Jump one token (i.e. word or symbol) to the left.
left:
    key(alt-b)

# Jump one token (i.e. word or symbol) to the right.
right:
    key(alt-f)

# Accept fish shell's autocomplete suggestion.
yes:
    key(right)


# Delete tokens to the left of the cursor.
chuck one token | chuck token:
    key(ctrl-w)
chuck two tokens:
    key(ctrl-w)
    key(ctrl-w)
chuck three tokens:
    key(ctrl-w)
    key(ctrl-w)
    key(ctrl-w)
chuck four tokens:
    key(ctrl-w)
    key(ctrl-w)
    key(ctrl-w)
    key(ctrl-w)
chuck five tokens:
    key(ctrl-w)
    key(ctrl-w)
    key(ctrl-w)
    key(ctrl-w)
    key(ctrl-w)

# Delete tokens to the right of the cursor.
chuck next one token | chuck next token:
    key(alt-d)
chuck next two tokens:
    key(alt-d)
    key(alt-d)
chuck next three tokens:
    key(alt-d)
    key(alt-d)
    key(alt-d)
chuck next four tokens:
    key(alt-d)
    key(alt-d)
    key(alt-d)
    key(alt-d)
chuck next five tokens:
    key(alt-d)
    key(alt-d)
    key(alt-d)
    key(alt-d)
    key(alt-d)

# Delete current line.
chuck line:
    key(ctrl-u)

# Delete until end of line.
chuck tail:
    key(ctrl-k)

# Paste what's been deleted using chuck commands.
paste:
    key(ctrl-y)

# Cancel the currently typed command.
cancel:
    key(ctrl-c)

# Get the last argument from the previous command.
bring last:
    key(alt-.)