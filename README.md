vagrant-boxes
=============

```bash
rm -rf ./box/virtualbox/ubuntu-*
packer build \
    -var version=$(date +%Y%m%d).0.0 \
    -var-file=ubuntu-docker.json \
    ubuntu.json
```
