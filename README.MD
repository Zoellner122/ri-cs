# RI-CS

# Introduction:
Welcome!

This is the project page of the next iteration of the Ri-CS sandbox network.
This project will include some new technologies that I've started to pick up either in professional life or that seemed interesting to learn about.

Currently that means that the following projects are included:
- Proxmox
- Terraform
- Packer

Additionally to be implemented are:
- Puppet
- Ansible / AWX

Potential changes might be:
- Changing from Proxmox to a different implemtation (e.g Harvester by Rancher or OpenNebula)

## Diagram:

![RI-CS Network](misc/rics.drawio.png)

## Backstory:
The Ri-CS network, has always been a part where my creativity and eagerness to learn thrived;
It was created during a project called KubeDock (An automated self-managing kubernetes cluster) which failed due to a lack of knowledge and has further evolved to become a sandbox for all my projects.

Ri-CS has hosted, for example a OpenStack Xena cluster before returning to Proxmox for ease of management in times of less time being available.

# To-Do:
## Base infra:
- [x] Implement DHCP to ease provisioning
- [ ] Further implement GlusterFS (maybe) for shared storage (Might not be fully possible due to spit-brain scenario as there are only 2 main Proxmox nodes and a virtual arbiter)
- [ ] Implement selfhosted GitLab (Also for CI/CD)

## Terraform:
- [ ] Finish implementation of Terraform (provider is capable of correctly managing resources)
- [ ] Write the additional base infrastructure as code:
    - [ ] Nameservers
    - [ ] Puppet server

## Packer:
- [ ] Continue testing with image generation
- [ ] Create some base images:
    - [x] AlmaLinux 8
    - [ ] AlmaLinux 9
    - [ ] Ubuntu 22.04
    - [ ] Ubuntu 22.10
    - [ ] Arch


