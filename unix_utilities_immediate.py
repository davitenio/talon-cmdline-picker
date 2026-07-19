from talon import Module

mod = Module()

mod.tag(
    "unix_utilities_immediate",
    desc="Run unix utilities immediately",
)

mod.list(
    "unix_utility_immediate",
    desc="Unix utilities that execute immediately",
)