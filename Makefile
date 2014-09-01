# This allows us to run "jade" and it'll find the one from our package.json
SHELL := /bin/bash
PATH := node_modules/.bin:$(PATH)

# Where to find and output stuff
JADE_DIR := public/templates
STYLUS_DIR := public/styl
CSS_DIR := public/css
HTML_DIR := .

# glob all the jade/stylus files
TEMPLATES := $(shell glob-cli "$(JADE_DIR)/**/*.jade")
STYLUS := $(shell glob-cli "$(STYLUS_DIR)/**/*.styl")


all: build

build: .jade-build public/css/main.min.css

# Build the jade
# Since there are multiple files. we touch .jade-build to ensure we don't unnecessarily rebuild jade
.jade-build: $(TEMPLATES)
	jade $(JADE_DIR) -o $(HTML_DIR)
	touch .jade-build

# Build main css file, incuding the yeticss plugin
public/css/main.css: $(STYLUS)
	stylus -u yeticss $(STYLUS_DIR)/main.styl -o $(CSS_DIR)

# Minify
public/css/main.min.css: public/css/main.css
	cssmin public/css/main.css > public/css/main.min.css