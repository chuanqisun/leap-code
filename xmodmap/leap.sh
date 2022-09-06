# This file can be loaded via leap.desktop file
# TODO: figure out how to get xmodmap ~/.Xmodmap execute on startup for Pop OS

# Right Alt as Mode switch
xmodmap -e "keycode 108 = Mode_switch" 


# I = Up
xmodmap -e "keycode 31 = i I Up Up" 
# J = Left
xmodmap -e "keycode 44 = j J Left Left"
# K = Down
xmodmap -e "keycode 45 = k K Down Down" 
# L = Right
xmodmap -e "keycode 46 = l L Right Right" 

# U = Home
xmodmap -e "keycode 30 = u U Home Home"
# O = End
xmodmap -e "keycode 32 = o O End End"

# A = -
xmodmap -e "keycode 38 = a A minus A"
# Z = _
xmodmap -e "keycode 52 = z Z underscore Z"

# E = (
xmodmap -e "keycode 26 = e E parenleft E"
# R = )
xmodmap -e "keycode 27 = r R parenright R"


# Y = Page Up
xmodmap -e "keycode 29 = y Y Prior Y"
# H = Page Dn
xmodmap -e "keycode 43 = h H Next H"
# S = $
xmodmap -e "keycode 39 = s S dollar S"
# D = {
xmodmap -e "keycode 40 = d D braceleft D"
# F = }
xmodmap -e "keycode 41 = f F braceright F"
# G = =
xmodmap -e "keycode 42 = g G equal G"
# X = [
xmodmap -e "keycode 53 = x X bracketleft X"
# C = ]
xmodmap -e "keycode 54 = c C bracketright C"
# T = >
xmodmap -e "keycode 28 = t T greater T"