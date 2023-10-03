# nephelaiio.mongodb_repo

[![Build Status](https://github.com/nephelaiio/ansible-role-mongodb-repo/actions/workflows/molecule.yml/badge.svg)](https://github.com/nephelaiio/ansible-role-mongodb-repo/actions/workflows/molecule.yml)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-nephelaiio.mongodb-repo.vim-blue.svg)](https://galaxy.ansible.com/nephelaiio/mongodb-repo/)

An [ansible role](https://galaxy.ansible.com/nephelaiio/mongodb_repo) to install and configure MongoDB repositories

## Role Variables

Please refer to the [defaults file](/defaults/main.yml) for an up to date list of input parameters.

## Dependencies

By default this role does not depend on any external roles. If any such dependency is required please [add them](/meta/main.yml) according to [the documentation](http://docs.ansible.com/ansible/playbooks_roles.html#role-dependencies)

## Example Playbook

- hosts: servers
  roles:
     - role: nephelaiio.mongodb_repo
       mongodb_repo_package_state: latest

## Testing

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests. Additional python dependencies are listed in the [requirements file](https://github.com/nephelaiio/ansible-role-requirements/blob/master/requirements.txt)

Role is tested against the following distributions (docker images):

  * Ubuntu Focal
  * Ubuntu Bionic
  * Debian Bookworm
  * Debian Buster
  * Rocky Linux 9

You can test the role directly from sources using command ` molecule test `

## License

This project is licensed under the terms of the [MIT License](/LICENSE)
