# ------------------------------------------------------------
# Once the fzf picker is open (after "fuzzy downloads" etc.),
# these two commands operate on the list:
#
# 1. Spell letters to narrow by filename substring.
#      Spoken: "drum odd cap"
#      Calls:  user.fuzzy_letters("doc")
#      Effect: types "doc" into fzf's search box.
#
# 2. Say "take" + letters to jump straight to a hinted line.
#      Spoken: "take air bat"
#      Calls:  user.fuzzy_take("ab")
#      Effect: selects whichever line is hinted "AB" and presses
#              enter -- works with or without narrowing first.
#
# Hints are normally 2 letters, but automatically grow to 3, 4,
# etc. for very large listings (see hint_gen.py). "take" accepts
# however many letters are spoken, so this works unchanged
# regardless of hint length.
# ------------------------------------------------------------
take <user.letter>+:
    user.fuzzy_take(letter_list)

<user.letter>+:
    user.fuzzy_letters(letter_list)