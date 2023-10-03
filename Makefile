.PHONY: all ${MAKECMDGOALS}

MOLECULE_SCENARIO ?= default
MOLECULE_DOCKER_IMAGE ?= ubuntu2004
GALAXY_API_KEY ?=
GITHUB_ACTION_REPOSITORY ?= $$(git config --get remote.origin.url | cut -d: -f 2 | cut -d. -f 1)
GITHUB_ORGANIZATION = $$(echo ${GITHUB_ACTION_REPOSITORY} | cut -d/ -f 1)
GITHUB_REPOSITORY = $$(echo ${GITHUB_ACTION_REPOSITORY} | cut -d/ -f 2)

all: install version lint test

test: lint
	poetry run molecule test -s ${MOLECULE_SCENARIO}

install:
	@type poetry >/dev/null || pip3 install poetry
	@poetry install

lint: install
	poetry run yamllint .
	poetry run ansible-lint .
	poetry run molecule syntax

dependency create prepare converge idempotence side-effect verify destroy login reset:
	MOLECULE_DOCKER_IMAGE=${MOLECULE_DOCKER_IMAGE} poetry run molecule $@ -s ${MOLECULE_SCENARIO}

clean: destroy reset
	poetry env remove $$(which python)

publish:
	@echo publishing repository ${GITHUB_ORGANIZATION}/${GITHUB_REPOSITORY}
	@poetry run ansible-galaxy role import \
		--api-key ${GALAXY_API_KEY} ${GITHUB_ORGANIZATION} ${GITHUB_REPOSITORY}

version:
	@poetry run molecule --version

debug: version
	@poetry export --dev --without-hashes
