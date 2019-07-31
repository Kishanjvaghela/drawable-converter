if [ $# -eq 0 ]; then
	echo "No arguments supplied"
else if [ -f "$1" ]; then
	echo " Creating different dimensions (dips) of "$1" ..."
	mkdir -p drawable-xxhdpi
	mkdir -p drawable-xhdpi
	mkdir -p drawable-hdpi
	mkdir -p drawable-mdpi

	if [ $1 = "ic_launcher.png" ]; then
	    	echo "  App icon detected"
		convert ic_launcher.png -resize 144x144 drawable-xxhdpi/ic_launcher.png
		convert ic_launcher.png -resize 96x96 drawable-xhdpi/ic_launcher.png
		convert ic_launcher.png -resize 72x72 drawable-hdpi/ic_launcher.png
		convert ic_launcher.png -resize 48x48 drawable-mdpi/ic_launcher.png
		rm -i ic_launcher.png
	else
		convert $1 -resize 67% drawable-xhdpi/$1
		convert $1 -resize 50% drawable-hdpi/$1
		convert $1 -resize 33% drawable-mdpi/$1
		mv $1 drawable-xxhdpi/$1
	fi
	echo " Done"
else
	echo "$1 not found."
fi
fi
