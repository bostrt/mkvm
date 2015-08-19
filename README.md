## mkvm
wrapper around virt-builder for quickly spinning up a VM

Prerequisites
---

There are some prerequisites before using `mkvm`. 

1. Install libguestfs-tools: `yum install libguestfs-tools`
2. **Optional:** Setup an external repository of base images for virt-builder: http://libguestfs.org/virt-builder.1.html#sources-of-templates
3. Create a `.rhn` file in your `$HOME` and add your username and password to it. See **RHN** section below.
4. Create a static Virtual Network. http://wiki.libvirt.org/page/VirtualNetworking
5. Update the `mkvm.network` and `mkvm.resolv.conf` files to reflect your network configuration.
6. **Optional:** Update `mkvm.ifcfg-eth0` if you need to fine tune some stuff.
7. **Optional:** Customize `mkvm.firstboot.sh` as needed.

RHN
---
```
touch ~/.rhn
echo my_rhn_username > ~/.rhn
echo my_rhn_password >> ~/.rhn
```
