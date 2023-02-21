resource "proxmox_vm_qemu" "puppet" {
    name        = "puppet"
    clone       = "almalinux-8.7-RICS"
    target_node = "prox02"

    memory  = 8196
    cores   = 4
    cpu     = "host"

    network {
      model     = "virtio"
      bridge    = "vmbr1"
    }

    network {
      model     = "virtio"
      bridge    = "vmbr1"
      tag       = 1001
    }

    disk {
        type    = "virtio"
        storage = "ISO"
        size    = "40G"
    }

    os_type = "cloud-init"
	  ciuser 		= var.cloud_init_user
	  cipassword 	= var.cloud_init_pass
	  sshkeys 	= var.cloud_init_ssh
	
	  ipconfig0   = "ip=141.95.79.2/27,gw=141.95.79.30"
    ipconfig1   = "ip=10.100.0.10/24"
	  nameserver  = "1.1.1.1"
}