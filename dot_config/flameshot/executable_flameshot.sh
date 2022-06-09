#!/bin/sh -e

# Get the picture from maim
flameshot gui -r > $HOME/.cache/src.png &
wait $!

# add shadow, round corner, border and watermark
convert $HOME/.cache/src.png \
	\( +clone -alpha extract \
	-draw 'fill black polygon 0,0 0,8 8,0 fill white circle 8,8 8,0' \
	\( +clone -flip \) -compose Multiply -composite \
	\( +clone -flop \) -compose Multiply -composite \
	\) -alpha off -compose CopyOpacity -composite $HOME/.cache/output.png

convert $HOME/.cache/output.png -bordercolor none -border 20 \( +clone -background black -shadow 80x8+15+15 \) \
	+swap -background transparent -layers merge +repage $HOME/.cache/des.png

composite -gravity Southeast ~/.config/flameshot/watermark.png $HOME/.cache/des.png $HOME/.cache/des.png

# Send the Picture to clipboard
xclip -selection clipboard -t image/png -i $HOME/.cache/des.png

# remove the other pictures
rm $HOME/.cache/src.png $HOME/.cache/output.png
