# Invoke fish's complete and search.
pick:
    key(shift-tab)


# ------------------------------------------------------------
# Voice command: "fuzzy home", "fuzzy downloads", etc.
#
# {user.fuzzy_target} is a spoken list defined in
# terminal_fuzzy_list.py. It can match values such as:
#
#   home
#   downloads
#   documents
#   here
#   up
#   root
#
# When the command is recognized, Talon calls the Python action
# fuzzy_find() with two arguments:
#
#   where = the spoken target (e.g. "downloads")
#   what  = "file"
#
# Example:
#   Spoken: "fuzzy downloads"
#   Calls:  user.fuzzy_find("downloads", "file")
# ------------------------------------------------------------
fuzzy {user.fuzzy_target}: user.fuzzy_find(fuzzy_target, "file")

# ------------------------------------------------------------
# Voice command: "dear home", "dear here", etc.
#
# This uses the same fuzzy_find() action but passes "dir"
# instead of "file".
#
# Example:
#   Spoken: "dear home"
#   Calls:  user.fuzzy_find("home", "dir")
#
# In config.fish, FUZZY_WHAT="dir" causes fd to search for
# directories only (--type d).
# ------------------------------------------------------------
dear {user.fuzzy_target}: user.fuzzy_find(fuzzy_target, "dir") 