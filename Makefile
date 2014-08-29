SHELL := /bin/bash
PATH := node_modules/.bin:$(PATH)

JADE_DIR := public/templates
STYLUS_DIR := public/styl
CSS_DIR := public/css
HTML_DIR := .

TEMPLATES := $(shell glob-cli "$(JADE_DIR)/**/*.jade")
STYLUS := $(shell glob-cli "$(STYLUS_DIR)/**/*.styl")


all: build

build: .jade-build public/css/main.min.css

.jade-build: $(TEMPLATES)
	jade $(JADE_DIR) -o $(HTML_DIR)
	touch .jade-build

public/css/main.css: $(STYLUS)
	stylus -u yeticss $(STYLUS_DIR)/main.styl -o $(CSS_DIR)

public/css/main.min.css: public/css/main.css
	cssmin public/css/main.css > public/css/main.min.css
