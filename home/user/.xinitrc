numlockx on &
(sleep 1 && setxkbmap -option caps:swapescape) &
while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &
exec dwm
