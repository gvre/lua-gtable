.DEFAULT_GOAL := all
.PHONY: default all lint test

default: all ;
all: lint test
lint:
	luacheck src/*
test:
	lua spec/* -v

