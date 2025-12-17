#!/data/data/com.termux/files/usr/bin/env bash

#neofetch --logo
#colors=(31 33 32 36 34 35)
#n=${#colors[@]}
for i in $(seq 1 $(tput cols)); do
  hue=$(((i-1)*15 % 360))
  if (( hue >= 0 && hue < 60 )); then
    r=255
    g=$((hue*255/60))
    b=0
  elif (( hue >= 60 && hue < 120 )); then
    r=$((255 - (hue - 60)*255/60))
    g=255
    b=0
  elif (( hue >= 120 && hue < 180 )); then
    r=0
    g=255
    b=$(((hue - 120)*255/60))
  elif (( hue >= 180 && hue < 240 )); then
    r=0
    g=$((255 - (hue - 180)*255/60))
    b=255
  elif (( hue >= 240 && hue < 300 )); then
    r=$(((hue - 240)*255/60))
    g=0
    b=255
  else
    r=255
    g=0
    b=$((255 - (hue - 300)*255/60))
  fi
  color="38;2;$r;$g;${b}m"
  echo -en "\x1b[${color}\u2588"
done
echo -e "\x1b[0m\n"
