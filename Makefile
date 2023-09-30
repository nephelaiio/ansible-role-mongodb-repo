.PHONY: install lint test create prepare converge idempotence side-effect verify destroy reset login clean

MOLECULE_SCENARIO ?= default
MOLECULE_DOCKER_IMAGE ?= ubuntu2004
GALAXY_API_KEY ?= $${GALAXY_API_KEY}
GITHUB_REPOSITORY_OWNER ?= $$(git remote get-url --push origin | cut -d/ -f 2 | cut -d. -f 1)
GITHUB_REPOSITORY_NAME ?= $$(git remote get-url --push origin | cut -d: -f2 | cut -d/ -f1)

install:
	@type poetry >/dev/null || pip3 install poetry
	@poetry install

lint: install
	poetry run yamllint .
	poetry run ansible-lint .
	poetry run molecule syntax

test: lint
	poetry run molecule test -s ${MOLECULE_SCENARIO}

create prepare converge idempotence side-effect verify destroy login reset:
	MOLECULE_DOCKER_IMAGE=${MOLECULE_DOCKER_IMAGE} poetry run molecule $@ -s ${MOLECULE_SCENARIO}

clean: destroy reset

publish:
	@[ -z "${GALAXY_API_KEY}" ] && echo "GALAXY_API_KEY is not set" && exit 1 || \
	poetry run ansible-galaxy role import \
		--api-key ${GALAXY_API_KEY} ${GITHUB_REPOSITORY_OWNER} ${GITHUB_REPOSITORY_NAME}
