.DEFAULT_GOAL := pdf

XELATEX ?= xelatex
CONVERT ?= convert

# default goal
all: pdf png

## Create PDF
pdf: cv.pdf

## Create PNG
png: samples/cv.png

cv.pdf: cv.tex cv-a4.cls $(wildcard images/*)
	$(XELATEX) -interaction=nonstopmode -file-line-error $<

samples/cv.png: cv.pdf
	$(CONVERT) -background white -alpha remove -units PixelsPerInch -density 300 $< $@

## Cleanup build files
clean:
	$(RM) cv.log cv.out cv.aux cv.bcf cv.run.xml

## Show this help screen
help:
	@printf "Available targets\n\n"
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "%-30s %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
