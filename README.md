andrewrothstein.kubevirt
=========
![Build Status](https://github.com/andrewrothstein/ansible-kubevirt/actions/workflows/build.yml/badge.svg)

Installs [kubevirt](https://github.com/kubevirt/kubevirt)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.kubevirt
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
