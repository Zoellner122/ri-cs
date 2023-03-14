resource "opennebula_virtual_machine" "rics-bastion" {
  name = "braum"
  permissions = "770"
  group = "rics"

  cpu = 1
  memory = 1024
  
  context = {
    NETWORK = "YES"
    SET_HOSTNAME = "$NAME"
    SSH_PUBLIC_KEY = var.rick_ssh_key
    PASSWORD = var.on_rick_pass
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

  graphics {
    type = "VNC"
    listen = "0.0.0.0"
  }

  disk {
    image_id = opennebula_image.almalinux_8.id
    size = 10000
    target = "vda"
    driver = "qcow2"
  }

  nic {
    model = "virtio"
    network_id = opennebula_virtual_network.rics-internal.id
  }
  nic {
    model = "virtio"
    network_id = opennebula_virtual_network.rics-vrack141.id
    security_groups = [ opennebula_security_group.bastion.id ]
  }
}

resource "opennebula_security_group" "bastion" {
  name = "bastion"
  description = "Rules for Bastion Host"

  rule {
    protocol = "ALL"
    rule_type = "OUTBOUND"
  }

  rule {
    protocol = "TCP"
    rule_type = "INBOUND"
    range = "22"
  }
  
}