numlockx on &
(sleep 1 && setxkbmap -option caps:swapescape) &
while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &
export XDG_CURRENT_DESKTOP=Dark
feh --bg-scale ~/wallpapers/red_samurai.jpg
exec dwm
