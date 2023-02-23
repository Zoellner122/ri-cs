resource "opennebula_virtual_machine" "resolvers" {
    count = 2

    name = "ns-${count.index+1}"
    description = "Nameserver for Ri-CS"

    cpu = 2
    memory = 2048
    permissions = "660"

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
      network_id = 0
      model = "virtio"
    }
}