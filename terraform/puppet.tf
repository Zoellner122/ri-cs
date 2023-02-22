resource "proxmox_vm_qemu" "puppet" {
    name        = "puppet"
    clone       = "almalinux-8.7-RICS"
    target_node = "prox02"

    memory = 8196
    cores  = 4
    cpu    = "host"

    network {
     model  = "virtio"
     bridge = "vmbr1"
    }

    network {
     model  = "virtio"
     bridge = "vmbr1"
     tag    = 1001
    }

    disk {
     type    = "virtio"
     storage = "ISO"
     size    = "40G"
    }

    disk {
     type    = "virtio"
     storage = "ISO"
     size    = "100G"
    }

    os_type      = "cloud-init"
    ciuser       = var.cloud_init_user
    cipassword   = var.cloud_init_pass
    sshkeys      = var.cloud_init_ssh

}