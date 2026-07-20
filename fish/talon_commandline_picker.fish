if status is-interactive

    # --------------------------------------------------------
	# Shared variables used by the Talon fuzzy finder workflow.
	#
	# Talon sets these variables before pressing Ctrl-G.
	# The fuzzy_dispatch function then reads them.
	#
	# FUZZY_WHERE = where to search
	#   home, downloads, documents, here, up, root
	#
	# FUZZY_WHAT = what to search for
	#   "f"   = files
	#   "dir" = directories
	#
	# These are UNIVERSAL variables (-U), which means a separate
	# Fish process started by Talon can update them and the
	# interactive shell will see the changes immediately.
	# --------------------------------------------------------
	set -U FUZZY_WHERE ""
	set -U FUZZY_WHAT "f"

    function fuzzy_dispatch
		set -l target $PWD
		switch $FUZZY_WHERE
			case home;      set target $HOME
			case downloads; set target $HOME/Downloads
			case documents; set target $HOME/Documents
			case here;      set target $PWD
			case up;        set target (dirname $PWD)
			case root;      set target /
		end

        set -l ftype f
		if test "$FUZZY_WHAT" = "dir"
			set ftype d
		end

        set -l result (fd . $target --type $ftype 2>/dev/null \
			| awk -F/ '{ print length($NF) "\t" $0 }' \
			| sort -n \
			| cut -f2- \
			| awk -F/ '{ print $0 "\t" $NF }' \
			| python3 ~/.config/fish/scripts/hint_gen.py \
			| fzf --delimiter='\t' --with-nth=1,3 --nth=2 --tiebreak=length \
				--bind 'ctrl-h:change-nth(1)+clear-query' \
			| awk -F'\t' '{ print $2 }')

        if test -n "$result"
			commandline -i "$result "
		end

		set -U FUZZY_WHERE ""
		set -U FUZZY_WHAT "f"
	end

    # --------------------------------------------------------
	# Ctrl-G is the bridge between Talon and Fish.
	#
	# Talon sets FUZZY_WHERE and FUZZY_WHAT, then sends Ctrl-G.
	# This binding causes Ctrl-G to run fuzzy_dispatch inside the
	# active Fish command line session.
	#
	# Without this binding, the voice commands would update the
	# variables but the fuzzy picker would never open.
	# --------------------------------------------------------
	bind -M default ctrl-g fuzzy_dispatch

end