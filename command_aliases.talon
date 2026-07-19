app: terminal
os: mac
-

##########################
# File system navigation #
##########################

# Don't specify destination folder.
zip:
    insert("z ")

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

# Go to the talon commandline picker repository under ./talon/user
zip talon command line picker: 
    insert("z ~/.talon/user/talon-cmdline-picker/\n")

# Go back to previous folder.
zip back:
    insert("z -\n")

# Open zoxide in interactive mode.
zippy:
    insert("zi ")