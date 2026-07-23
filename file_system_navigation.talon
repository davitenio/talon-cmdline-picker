app: terminal
os: mac
-

##########################
# File system navigation #
##########################

# Don't specify destination folder.
zip:
    insert("z ")

# Go one folder up.
zip up | zip up one | zip dot dot:
    insert("z ..\n")

# Go two folders up.
zip up two | zip double up:
    insert("z ../..\n")

# Go three folders up.
zip up three | zip triple up:
    insert("z ../../..\n")

# Go to home folder.
zip home:
    insert("z ~\n")

# Go to Documents folder.
zip documents:
    insert("z ~/Documents\n")

# Go to Downloads folder.
zip downloads:
    insert("z ~/Downloads\n")

# Go to dotfiles folder.
zip dotfiles:
    insert("z ~/dotfiles/\n")

# Go to the talon community repository under ./talon/user
zip talon community:
    insert("z ~/.talon/user/community/\n")

zip talon my config:
    insert("z ~/.talon/user/my-config/\n")

# Go to the talon commandline picker repository under ./talon/user
zip talon command line picker:
    insert("z ~/.talon/user/talon-cmdline-picker/\n")

zip config fish:
    insert("z ~/.config/fish/\n")

zip Zettelkasten:
    insert("z ~/zettelkasten-sync\n")

zip Zettelkasten git | zip Zettelkasten dot git:
    insert("z ~/zettelkasten.git\n")

zip exorcism | zip exorcism git | zip exorcism dot git:
    insert("z ~/exercism.git\n")

# Go back to previous folder
zip back:
    insert("z -\n")

# Open zoxide in interactive mode.
zippy:
    insert("zi ")