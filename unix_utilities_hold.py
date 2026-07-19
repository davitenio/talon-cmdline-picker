from talon import Module

mod = Module()

mod.tag(
    "unix_utilities_hold",
    desc="Add unix utilities to the command line without executing",
)

mod.list(
    "unix_utility_hold",
    desc="Unix utilities that are only added to the command line without executing them",
)