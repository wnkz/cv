.DEFAULT_GOAL := default

# default goal
all: pdf png
default: pdf

## Create PDF
pdf:
	xelatex -interaction=nonstopmode -file-line-error cv.tex

## Create PNG
png: pdf
	convert -background white -alpha remove -units PixelsPerInch -density 300 cv.pdf samples/cv.png

## Cleanup build files
clean:
	rm -rf cv.log cv.out cv.aux cv.bcf cv.run.xml

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
