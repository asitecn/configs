#escape "``"

# Set the last line of the terminal to have a useful, pretty status line kinda like the GNOME panel
caption always "%{WK}%?%-Lw%?%{mw}%n*%f %t%?(%u)%?%{WK}%?%+Lw %= %{cK}%u@%H %{yK}%D %{cK}%M%{wK} %{cK}%d %{gK}%c"
#caption always "%{WK}%?%-Lw%?%{mw}%n*%f %t%?(%u)%?%{WK}%?%+Lw %= %u%{cK}$USER@%H"

# Use ALT-, and ALT-. to switch to previous and next window, respectively.
bindkey "^[," prev
bindkey "^[." next

# Use ALT-= and ALT-- to resize the screen sizes.
bindkey "^[=" resize +1
bindkey "^[-" resize -1

# binding the F1 - F8 keys to the first 8 screens, F11 = previous | F12 = next
bindkey -k k1 select 11
bindkey -k k2 select 12
bindkey -k k3 select 13
bindkey -k k4 select 14
bindkey -k k5 select 15
bindkey -k k6 select 16
bindkey -k k7 select 17
bindkey -k k8 select 18
bindkey -k F2 next
bindkey -k F1 prev

# syntax: screen -t label order command

#0, 1: kw
#2, 3: lexical
#4, 5, 6: pr
#7:    pb
#8, 9: jb
#10:   ui - search out of budget


screen -t kw 0
screen -t kw 1
screen -t lexical 2
screen -t lexical 3
screen -t pr 4
screen -t pr 5
screen -t pr 6
screen -t pb 7
screen -t jb 8
screen -t jb 9
screen -t ui 10


shell -$SHELL

