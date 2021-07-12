andrewrothstein.k3d
=========
![Build Status](https://github.com/andrewrothstein/ansible-k3d/actions/workflows/build.yml/badge.svg)

Installs [k3d](https://github.com/rancher/k3d).

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
    - andrewrothstein.k3d
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
