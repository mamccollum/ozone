# Top-level build orchestrator (POSIX sh friendly)
SHELL := /bin/sh
TOP := $(shell pwd)
RECIPES := $(wildcard recipes/*)
.PHONY: all build clean

# Usage:
#   make build             -> build all recipes
#   make build PKG=foo     -> build only recipes/foo
all: build

build:
	@for r in $(RECIPES); do \
		name=$$(basename $$r); \
		if [ -z "$(PKG)" ] || [ "$$name" = "$(PKG)" ]; then \
			echo ">>> building $$name"; \
			( TOP=$(TOP) WORK=$(TOP)/build/$$name STAGING=$(TOP)/build/$$name-staging OUT=$(TOP)/out RECIPEDIR=$(TOP)/recipes/$$name sh $$r/recipe fetch extract apply_patches build package ); \
		fi; \
	done

clean:
	rm -rf build/* out/* src/*


#			( TOP=$(TOP) WORK=$(TOP)/build/$$name STAGING=$(TOP)/build/$$name-staging OUT=$(TOP)/out RECIPEDIR=$(TOP)/recipes/$$name sh $$r/recipe fetch extract apply_patches build package ); \

