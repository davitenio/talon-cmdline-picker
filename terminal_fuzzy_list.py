from talon import Context

ctx = Context()
ctx.lists["user.fuzzy_target"] = {
    "home": "home",
    "downloads": "downloads",
    "documents": "documents",
    "here": "here",
    "up": "up",
    "root": "root",
}

# ------------------------------------------------------------
# To add a new location later:
#
# 1. Add a new entry here, for example:
#       "projects": "projects"
#
# 2. Add a matching case in config.fish:
#       case projects
#           set target ~/projects
#
# No new Talon command or key binding is required.
# ------------------------------------------------------------