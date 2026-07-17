# talon-cmdline-picker

🚧 **Experimental.** Expect rough edges, breaking changes, and files still being reshuffled.

Voice-driven picker for the command line, built on [Talon](https://talonvoice.com/) and [fzf](https://github.com/junegunn/fzf). Narrow down files, directories, commands, and flags by spelling a few letters, then jump straight to any visible item by speaking its two-letter hint — no need to keep narrowing until only one result is left.

## Why

Talon (with [Cursorless](https://www.cursorless.org/)) already makes voice coding and text editing efficient. But driving the shell by voice is still a pain — this project is my attempt at closing that gap for my own workflow, starting with fuzzy file/directory search + pick by voice, and growing from there.

## How it works

Think code completion in a programming editor, but for the shell and optimized for voice instead of keyboard input.

To input this:

```
> cp "~/Downloads/my-supperAnOyInGlY spelled file.xyzwqrstkvw" "./aNNoYinng-dir-name-++. hsgwga/"
```

You say:

- "captain" (voice command for "cp")
- "file downloads" (pop up list with names of files in ~/Downloads)
- "word super" (narrow down to files containing letters in the word super, i.e., s u p e r)
- "take air bat" (select "~/Downloads/my-supperAnOyInGlY spelled file.xyzwqrstkvw", assuming "ab" is the hint for it)
- "dear here" (pop up list with names of directories in ./)
- "air near near" (narrow down to directories whose name contains a n n)
- "take quench" (select "./aNNoYinng-dir-name-++. hsgwga/", assuming "q" is the hint for it) 

More generally:

1. Say a type (file or dir) + location, e.g. **"file downloads"** (files in `~/Downloads`), **file home** (files in `~/`), **"dear here"** (directories in `./`), or **dear up** (directories in `../`). This opens a fuzzy  search (`fzf`) picker over that location.
2. Spell a few letters of the filename or directory to narrow the list, e.g. **"drum odd cap"** → types `doc`.
3. Once the item you want is visible on screen, say its hint to select it instantly, e.g. **"take air bat"** → jumps to the line hinted `ab` and selects it — no need to narrow further first.

Hints are computed fresh each time you say **"file <location>"** or **"dear <location>"**, sorted shortest-filename (or shortest dirname) first for now, and automatically grow from 2 letters to 3, 4, etc. (if the list is too large for 2-letter hints to stay unique).

## Requirements

- [Talon](https://talonvoice.com/)
- [Talon community repo](https://github.com/talonhub/community)
- [fish](https://fishshell.com/) shell (bash/zsh support planned, not yet implemented)
- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)
- Python 3

## Install (NOT YET IMPLEMENTED)

```bash
git clone https://github.com/davitenio/talon-cmdline-picker.git
cd talon-cmdline-picker
./install.sh
```

`install.sh` symlinks the repo's files into the locations Talon and fish expect (`~/.talon/user/...` and `~/.config/fish/...`) — nothing is copied, so `git pull` in this repo keeps everything up to date. It won't overwrite any existing real files; if something's already there, it'll tell you instead of clobbering it.

## Voice commands

| Say | Effect |
|---|---|
| `file <where>` | Open the picker over files in `<where>` (`home`, `downloads`, `documents`, `here`, `up`, `root`) |
| `dear <where>` | Same, but for directories |
| *(spell letters)* | Narrow the list to items containing those letters, in order |
| `take <letters>` | Jump to and select the item with that hint |

## Repo structure

```
talon/    Talon voice command files and Python actions
fish/     Fish shell integration (auto-loaded via conf.d)
```

## Roadmap

- [ ] `get command` — pick a shell command by voice
- [ ] `get options` — pick flags for the current command, sourced from fish's completion data
- [ ] bash / zsh support
- [ ] sort picker entries by usage (most common file/dir/command/option first)

## License

MIT
