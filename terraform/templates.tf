resource "opennebula_virtual_router_instance_template" "vr-template" {
  name = "virtual-router-template"
  permissions = "744"
  
  cpu = "0.5"
  memory = "1024"

  context = {
    dns_hostname = "yes"
    network      = "YES"
  }

  graphics {
    keymap = "en-us"
    listen = "0.0.0.0"
    type   = "VNC"
  }

  os {
    arch = "x86_64"
    boot = "disk0"
  }

}