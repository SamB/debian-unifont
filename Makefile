
all: unifont.pcf.gz

unifont.pcf.gz: unifont.pcf
	gzip -9 <unifont.pcf >unifont.pcf.gz

unifont.pcf: unifont.bdf
	bdftopcf unifont.bdf > unifont.pcf

unifont.bdf: unifont.hex
	./hex2bdf unifont.hex > unifont.bdf

install: unifont.pcf.gz
	install -m 755 -o root -g root -d ${DESTDIR}/usr/X11R6/lib/X11/fonts/misc
	install -m 644 -o root -g root unifont.pcf.gz ${DESTDIR}/usr/X11R6/lib/X11/fonts/misc

clean:
	rm -f unifont.pcf.gz unifont.pcf unifont.bdf
