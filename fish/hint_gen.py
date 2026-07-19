#!/usr/bin/env python3
"""
Reads paths on stdin (already sorted shortest-first by the fish
pipeline) and prefixes each line with a voice-friendly hint,
e.g.:

    AB	/Users/david/Downloads/file.pdf
    AC	/Users/david/Downloads/other.txt

Hint length starts at 2 letters and automatically grows to 3, 4,
etc. if the list is too large for the current length to cover
every line uniquely. This means:

    up to     676 items -> 2-letter hints (AA..ZZ)
    up to  17,576 items -> 3-letter hints (AAA..ZZZ)
    up to 456,976 items -> 4-letter hints
    ...and so on.

Talon's "take <letters>" command captures however many letters
are spoken, so no changes are needed on the Talon side when the
hint length grows -- it just works.
"""
import sys
import string

LETTERS = string.ascii_uppercase


def hint_length_for(n: int) -> int:
	length = 2
	while 26 ** length < n:
		length += 1
	return length


def to_hint(i: int, length: int) -> str:
	hint = ""
	for _ in range(length):
		hint = LETTERS[i % 26] + hint
		i //= 26
	return hint


def main() -> None:
	lines = [line.rstrip("\n") for line in sys.stdin]
	length = hint_length_for(len(lines)) if lines else 2

	out = sys.stdout
	for i, line in enumerate(lines):
		out.write(f"{to_hint(i, length)}\t{line}\n")


if __name__ == "__main__":
	main()