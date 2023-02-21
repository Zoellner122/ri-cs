resource "proxmox_vm_qemu" "ns1" {
	name = "ns1"
	clone = "almalinux-8.7-RICS"
    target_node = "prox01"

	memory = 4096
	sockets = 1
	cores = 2
	cpu = "host"

	network {
	  model = "virtio"
	  bridge = "vmbr1"
	}
	network {
      model = "virtio"
      bridge = "vmbr1"
      tag = 1001
    }
	disk {
	  type = "virtio"
	  storage = "ISO"
	  size = "40G"
	}

	os_type = "cloud-init"
	ciuser 		= var.cloud_init_user
	cipassword 	= var.cloud_init_pass
	sshkeys 	= var.cloud_init_ssh
	
	ipconfig0 	= "ip=51.195.97.193/28,gw=51.195.97.206"
	ipconfig1 	= "ip=10.100.0.1/24"
    nameserver 	= "1.1.1.1"
  
}