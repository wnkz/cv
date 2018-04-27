.DEFAULT_GOAL := default

# default goal
default: pdf

## Create PDF
pdf:
	xelatex -interaction=nonstopmode -file-line-error cv.tex

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
