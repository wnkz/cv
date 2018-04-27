# CV

## About

forked from https://github.com/depressiveRobot/friggeri-cv-a4

![](samples/cv.png?raw=true)

## Usage

Run `make pdf` to create the PDF (`cv.pdf`).
See `make help` for an overview of available targets.

This template needs the following dependencies installed:

* TikZ (header)
* XeTex and fontspec (custom fonts)
* biblatex/biber (publications)
* textpos (aside)

## Options

* `print`: renders in black and white, and reverts the header to dark on light
* `nocolors`: no colors in section headers (but still use dark header)
