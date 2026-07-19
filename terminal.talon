app: terminal
os: mac
-
tag(): user.git
tag(): user.kubectl
tag(): user.readline
tag(): user.unix_utilities
tag(): user.generic_unix_shell

# The below overrides having to say core before each unix command
{user.unix_utility}: "{unix_utility} "


vim: "vim "
code: "code "
code new: "code -n "
man: "man "
captain: "cp "
captain all: "cp -a "
open dot: "open .\n"
lisa dot dot: "ls ..\n"
lisa triple dot: "ls ../..\n"
lisa li: "ls -l\n"
grab recursive: "grep -R "
brew update: "brew update\n"
brew install: "brew install "
exorcism: "exercism "
Katie exorcism dot git: "cd ~/exercism.git"
pi test: "pytest "


settle casten import: "./import-obsidian-files.sh; ./check-zk-integrity.sh; git st\n"
settle casten export: "git add .; git ci -m 'Import changes from obsidian sync'; git push; git push gitlab; git push bitbucket; date\n"

edge TTS french:
    "edge-tts --voice fr-FR-RemyMultilingualNeural -  --write-media output.mp3"
    key(esc)
    key(b)
    key(esc)
    key(b)
    key(left)

edge TTS list french voices: "edge-tts --list-voices | grep fr\n"
