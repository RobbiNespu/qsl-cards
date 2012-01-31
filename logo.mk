SHELL = /bin/bash

SVG = $(wildcard *.svg)
PNG = $(SVG:.svg=.png)
THUMB = $(SVG:.svg=.thumb.png)
PDF = $(SVG:.svg=.pdf)
GIF = $(SVG:.svg=.gif)
JPG = $(SVG:.svg=.jpg)

GENERATED_FILES = $(PNG) $(THUMB) $(PDF) $(GIF) $(JPG)

.PHONY : all
all : $(GENERATED_FILES)

.PHONY : png
png : $(PNG)

.PHONY : thumb
thumb : $(THUMB)

.PHONY : pdf
pdf : $(PDF)

.PHONY : gif
gif : $(JPG)

.PHONY : jpg
jpg : $(JPG)

%.png : %.svg
	@inkscape -e $@ $<

%.thumb.png : %.svg
	@inkscape -w125 -h125 -e $@ $<

%.pdf : %.svg
	@inkscape -T -A $@ $<

%.gif : %.png
	@convert $< $@

%.jpg : %.png
	@convert $< $@

.PHONY : clean
clean :
	@rm -f $(GENERATED_FILES)