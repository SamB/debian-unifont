
all: unifont.pcf

unifont.pcf: unifont.bdf
	bdftopcf unifont.bdf > unifont.pcf

unifont.bdf: unifont.hex
	perl hex2bdf.unsplit unifont.hex > unifont.bdf

clean:
	rm -f unifont.pcf unifont.bdf
