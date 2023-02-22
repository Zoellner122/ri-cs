packer {
    required_plugins {
        proxmox = {
            version = ">= 1.0.6"
            source = "github.com/hashicorp/proxmox"
        }
    }
}

source "proxmox" "iso" {
    username                    = var.proxmox_user
    token                       = var.proxmox_token
    proxmox_url                 = var.proxmox_api
    node                        = "prox01"        
    iso_storage_pool            = "ISO"
    ssh_username                = "root"
    ssh_password                = "packer"
    ssh_timeout                 = "3600s"
    ssh_clear_authorized_keys   = true
    ssh_host                    = "141.95.79.29"
    insecure_skip_tls_verify    = true
    http_directory              = "http"
    http_port_min               = 65006
    http_port_max               = 65006
    cloud_init                  = true
    cloud_init_storage_pool     = "ISO"
    
    network_adapters {
        bridge  = "vmbr1"
        model   = "virtio"
    }
    disks {
        disk_size         = "20G"
        storage_pool      = "ISO"
        storage_pool_type = "lvm"
        type              = "virtio"
    }
    cpu_type    = "host"
    cores       = 2
    memory      = 4096
    os          = "l26"
}