# nephelaiio.mongodb_repo

[![Build Status](https://github.com/nephelaiio/ansible-role-mongodb-repo/actions/workflows/molecule.yml/badge.svg)](https://github.com/nephelaiio/ansible-role-mongodb-repo/actions/workflows/molecule.yml)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-nephelaiio.mongodb-repo.vim-blue.svg)](https://galaxy.ansible.com/ui/standalone/roles/nephelaiio/mongodb_repo/)

An [ansible role](https://galaxy.ansible.com/ui/standalone/roles/nephelaiio/mongodb_repo/) to install and configure MongoDB repositories

## Role Variables

Please refer to the [defaults file](/defaults/main.yml) for an up to date list of input parameters.

## Example Playbook

- hosts: servers
  roles:
     - role: nephelaiio.mongodb_repo

## Testing

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests.

Role is tested against the following distributions (docker images):

  * Ubuntu Focal
  * Ubuntu Bionic
  * Debian Bullseye
  * Rocky Linux 9

You can test the role directly from sources using command `make test`

## License

This project is licensed under the terms of the [MIT License](/LICENSE)
