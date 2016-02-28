vagrant-boxes
=============

Requirements
------------

 * [Packer](https://www.packer.io/)
 * [Vagrant](https://www.vagrantup.com/)
 * [VirtualBox](https://www.virtualbox.org/)
 * [VMware ESXi](http://www.vmware.com/uk/products/esxi-and-esx/overview) (optional)

Testing
-------

```bash
$ make build test OS=ubuntu VER=14.04 TYPE=docker
```

TODO
----

 * Make localisation options part of preseeding process
 * Build VMware-based boxes
