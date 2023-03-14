

resource "opennebula_virtual_router_instance_template" "vr-template" {
  name = "virtual-router-template"
  permissions = "744"
  
  cpu = "0.5"
  memory = "1024"

  context = {
    dns_hostname = "YES"
    network      = "YES"
  }

  graphics {
    keymap = "en-us"
    listen = "0.0.0.0"
    type   = "VNC"
  }

  os {
    arch = "x86_64"
    boot = " "
  }


}

resource "opennebula_template" "vnf" {
  name = "Service VNF"
  description = "Template for the router appliace"

  cpu = 1
  memory = 512

  context = {
    NETWORK = "YES"
    SET_HOSTNAME = "$NAME"
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

  disk {
    size = 2048
    image_id = opennebula_image.virtual-router.id
  }
}