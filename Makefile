.PHONY: install lint test create prepare converge side-effect verify destroy reset clean

MOLECULE_SCENARIO ?= default

install:
	@type poetry >/dev/null || pip3 install poetry
	@poetry install

lint:
	poetry run yamllint .
	poetry run ansible-lint .
	poetry run molecule syntax

test: install lint
	poetry run molecule test -s ${MOLECULE_SCENARIO}

create prepare converge side-effect verify destroy reset:
	poetry run molecule $@ -s ${MOLECULE_SCENARIO}

clean: destroy reset
