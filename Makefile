# This makefile handles the cookbook validation stuff.

MAIN = lint

lint: foodcritic rubocop
.PHONY: lint

foodcritic:
	foodcritic .
.PHONY: foodcritic

rubocop:
	rubocop -D .
.PHONY: rubocop
