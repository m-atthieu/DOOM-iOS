ASSETS=	assets/iphone/fire.tga \
	assets/iphone/map_button.tga \
	assets/iphone/menu_button.tga \
	assets/iphone/directional_2.tga \
	assets/iphone/side_2_side.tga \
	assets/iphone/arialImageLAL.tga \

SOUNDS= assets/sounds/barexp.wav \
	assets/sounds/bdcls.wav \
	assets/sounds/bdopn.wav \
	assets/sounds/bfg.wav \
	assets/sounds/bgact.wav \
	assets/sounds/bgdth1.wav \
	assets/sounds/bgdth2.wav \
	assets/sounds/bgsit1.wav \
	assets/sounds/bgsit2.wav \
	assets/sounds/boscub.wav \
	assets/sounds/bosdth.wav \
	assets/sounds/bossit.wav \
	assets/sounds/brsdth.wav \
	assets/sounds/brssit.wav \
	assets/sounds/cacsit.wav \
	assets/sounds/claw.wav \
	assets/sounds/cybsit.wav \
	assets/sounds/dbcls.wav \
	assets/sounds/dbload.wav \
	assets/sounds/dbopn.wav \
	assets/sounds/dmact.wav \
	assets/sounds/dmpain.wav \
	assets/sounds/dorcls.wav \
	assets/sounds/doropn.wav \
	assets/sounds/dshtgn.wav \
	assets/sounds/firsht.wav \
	assets/sounds/firxpl.wav \
	assets/sounds/getpow.wav \
	assets/sounds/itemup.wav \
	assets/sounds/itmbk.wav \
	assets/sounds/keendt.wav \
	assets/sounds/keenpn.wav \
	assets/sounds/mandth.wav \
	assets/sounds/mansit.wav \
	assets/sounds/metal.wav \
	assets/sounds/mnpain.wav \
	assets/sounds/noway.wav \
	assets/sounds/oof.wav \
	assets/sounds/pdiehi.wav \
	assets/sounds/pesit.wav \
	assets/sounds/pistol.wav \
	assets/sounds/plasma.wav \
	assets/sounds/pldeth.wav \
	assets/sounds/plpain.wav \
	assets/sounds/podth1.wav \
	assets/sounds/podth2.wav \
	assets/sounds/podth3.wav \
	assets/sounds/popain.wav \
	assets/sounds/posact.wav \
	assets/sounds/posit1.wav \
	assets/sounds/posit2.wav \
	assets/sounds/posit3.wav \
	assets/sounds/pstart.wav \
	assets/sounds/pstop.wav \
	assets/sounds/punch.wav \
	assets/sounds/radio.wav \
	assets/sounds/rlaunc.wav \
	assets/sounds/rxplod.wav \
	assets/sounds/sawful.wav \
	assets/sounds/sawhit.wav \
	assets/sounds/sawidl.wav \
	assets/sounds/sawup.wav \
	assets/sounds/sgcock.wav \
	assets/sounds/sgtatk.wav \
	assets/sounds/sgtdth.wav \
	assets/sounds/sgtsit.wav \
	assets/sounds/shotgn.wav \
	assets/sounds/skeatk.wav \
	assets/sounds/sklatk.wav \
	assets/sounds/skldth.wav \
	assets/sounds/slop.wav \
	assets/sounds/ssdth.wav \
	assets/sounds/sssit.wav \
	assets/sounds/stnmov.wav \
	assets/sounds/swtchn.wav \
	assets/sounds/swtchx.wav \
	assets/sounds/telept.wav \
	assets/sounds/tink.wav \
	assets/sounds/vilact.wav \
	assets/sounds/vilatk.wav \
	assets/sounds/vildth.wav \
	assets/sounds/vilsit.wav \
	assets/sounds/vipain.wav \
	assets/sounds/wpnup.wav

MUSICS= music/d_intro.mp3  \
	music/d_adrian.mp3 \
	music/d_ampie.mp3  \
	music/d_betwee.mp3 \
	music/d_count2.mp3 \
	music/d_countd.mp3 \
	music/d_ddtbl2.mp3 \
	music/d_ddtbl3.mp3 \
	music/d_ddtblu.mp3 \
	music/d_dead.mp3   \
	music/d_dead2.mp3  \
	music/d_doom.mp3   \
	music/d_doom2.mp3  \
	music/d_evil.mp3   \
	music/d_in_cit.mp3 \
	music/d_messag.mp3 \
	music/d_messg2.mp3 \
	music/d_openin.mp3 \
	music/d_romer2.mp3 \
	music/d_romero.mp3 \
	music/d_runni2.mp3 \
	music/d_runnin.mp3 \
	music/d_shawn.mp3  \
	music/d_shawn2.mp3 \
	music/d_shawn3.mp3 \
	music/d_stalks.mp3 \
	music/d_stlks2.mp3 \
	music/d_stlks3.mp3 \
	music/d_tense.mp3  \
	music/d_theda2.mp3 \
	music/d_theda3.mp3 \
	music/d_ultima.mp3

all: doom2.wad base.iPack

music/%.mid: freedoom/musics/%.mus
	qmus2mid $< $@

assets/sounds/%.wav: freedoom/sounds/ds%.wav
	cp -L $< $@

LAME=lame -r -b 128
#TIMIDITY_OPTS=-OrUS1 -s 44.1kHz
TIMIDITY_OPTS=-Ow

music/%.mp3: freedoom/musics/%.mid
	timidity $< ${TIMIDITY_OPTS} -o $(subst .mid,.wav,$<) 
	${LAME} $(subst .mid,.wav,$<) $@
	rm -f $(subst .mid,.wav,$<)

music/%.mp3: music/%.mid
	timidity $< ${TIMIDITY_OPTS} -o $(subst .mid,.wav,$<) 
	${LAME} $(subst .mid,.wav,$<) $@
	rm -f $(subst .mid,.wav,$<)

%.mp3: %.mid
	timidity $< ${TIMIDITY_OPTS} -o $(subst .mid,.wav,$<) 
	${LAME} $(subst .mid,.wav,$<) $@
	rm -f $(subst .mid,.wav,$)<

doom2.wad: freedoom/wads/doom2.wad
	cp $< $@

assets: $(ASSETS) $(SOUNDS) $(MUSICS)

base.iPack: assets
	cd ../doomtool && ./doomtool

