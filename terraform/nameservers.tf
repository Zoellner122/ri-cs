resource "opennebula_virtual_machine" "ns01" {
    count = 1

    name = "ns01"
    description = "Nameserver for Ri-CS"
    
    cpu = 2
    memory = 2048
    permissions = "660"

    context = {
      TOKEN = "YES"
      NETWORK = "YES"
      HOSTNAME = "$NAME"
      SSH_PUBLIC_KEY = var.rick_ssh_key
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
      size = 30000
      target = "vda"
      driver = "qcow2"
    }

    nic {
      network_id = opennebula_virtual_network.rics-vrack51.id
      model = "virtio"
      security_groups = [opennebula_security_group.resolvers.id]
    }
}


resource "opennebula_virtual_machine" "ns02" {
    count = 1

    name = "ns02"
    description = "Nameserver for Ri-CS"

    cpu = 2
    memory = 2048
    permissions = "660"

    context = {
      TOKEN = "YES"
      NETWORK = "YES"
      HOSTNAME = "$NAME"
      SSH_PUBLIC_KEY = var.rick_ssh_key
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
      size = 30000
      target = "vda"
      driver = "qcow2"
    }

    nic {
      network_id = opennebula_virtual_network.rics-vrack141.id
      model = "virtio"
      security_groups = [opennebula_security_group.resolvers.id]
    }
}

resource "opennebula_security_group" "resolvers" {
  name = "resolver-sg"
  description = "Security group specific for DNS resolvers"

  rule {
    protocol = "ALL"
    rule_type = "OUTBOUND"
  }

  rule {
    protocol = "TCP"
    rule_type = "INBOUND"
    range = "22"
  }

  rule {
    protocol = "TCP"
    rule_type = "INBOUND"
    range = "53"
  }
  
  rule {
    protocol = "ICMP"
    rule_type = "INBOUND"
  }
}