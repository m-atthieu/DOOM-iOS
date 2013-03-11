ASSETS=	assets/iphone/fire.tga \
	assets/iphone/map_button.tga \
	assets/iphone/menu_button.tga \
	assets/iphone/directional_2.tga \
	assets/iphone/side_2_side.tga \
	assets/iphone/arialImageLAL.tga \
	assets/sounds/pistol.wav

all: doom2.wad base.iPack

doom2.wad: freedoom/wads/doom2.wad
	cp $< $@

../doomtool/doomtool: ../doomtool/main.c ../doomtool.h
	gcc $< -o $@

base.iPack: $(ASSETS)
	cd ../doomtool && ./doomtool
