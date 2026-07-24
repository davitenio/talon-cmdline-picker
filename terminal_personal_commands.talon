app: terminal
os: mac
-

Zettelkasten import:
    "./import-obsidian-files.sh; ./check-zk-integrity.sh; git st \n"

Zettelkasten export:
    "git add .; git commit --message 'chore: backup latest version'; git push ; git push gitlab; git push bitbucket\n"

zip settle casten:
    insert("z ~/zettelkasten-sync\n")

zip settle casten git | zip settle casten dot git:
    insert("z ~/zettelkasten.git\n")