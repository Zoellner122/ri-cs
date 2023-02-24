# RI-CS

# Introduction:
Welcome!

This is the project page of the next iteration of the Ri-CS sandbox network.
This project will include some new technologies that I've started to pick up either in professional life or that seemed interesting to learn about.

Currently that means that the following projects are included:
- OpenNebula 
- Terraform
~~ - Packer ~~ See below

Additionally to be implemented are:
- Puppet
- Ansible / AWX


## Diagram:

![RI-CS Network](misc/rics.drawio.png)

## Backstory:
The Ri-CS network, has always been a part where my creativity and eagerness to learn thrived;
It was created during a project called KubeDock (An automated self-managing kubernetes cluster) which failed due to a lack of knowledge and has further evolved to become a sandbox for all my projects.

Ri-CS has hosted, for example a OpenStack Xena cluster before returning to Proxmox for ease of management in times of less time being available.

# To-Do:
## Base infra:
- ~~ [x] Implement DHCP to ease provisioning ~~ Handled by OpenNebula
- ~~ [ ] Further implement GlusterFS (maybe) for shared storage (Might not be fully possible due to spit-brain scenario as there are only 2 main Proxmox nodes and a virtual arbiter) ~~ OpenNebula does not use Gluster and as a result this is also handled by OpenNebula
- [ ] Implement selfhosted GitLab (Also for CI/CD)

## Terraform:
- [x] Finish implementation of Terraform (provider is capable of correctly managing resources)
- [ ] Write the additional base infrastructure as code:
    - [x] Nameservers
    - [ ] Puppet server

## Packer:
OpenNebula has a marketplace for images that are custom made for use by OpenNebula.
As a result at this moment there is no need for generation of custom images; however, this might still be done for fine tuning images.

~~ - [ ] Continue testing with image generation ~~
~~ - [ ] Create some base images: ~~
~~    - [x] AlmaLinux 8 ~~
~~    - [ ] AlmaLinux 9 ~~
~~    - [ ] Ubuntu 22.04 ~~
~~    - [ ] Ubuntu 22.10 ~~
~~    - [ ] Arch ~~


