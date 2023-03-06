resource "opennebula_virtual_network" "rics-internal" {
  name = "RI-CS Internal"
  description = "Internal network for RI-CS"

  group = opennebula_group.rics.name
  type = "ovswitch"
  physical_device = "eno2"
  bridge = "virbr1"
  automatic_vlan_id = true

  gateway = "10.101.0.1"
  dns = "10.101.0.1"
  
  permissions = 770
}

resource "opennebula_virtual_network_address_range" "rics-internal" {
    virtual_network_id = opennebula_virtual_network.rics-internal.id
    ar_type = "IP4"
    size = 100
    ip4 = "10.101.0.2"
}

resource "opennebula_virtual_router" "rics-gateway" {
  name = "rics-gateway"
  permissions = "744"

  instance_template_id = opennebula_virtual_router_instance_template.vr-template.id
}

resource "opennebula_virtual_router_instance" "rics-gateway" {
    name = "rics-gateway"
    permissions = "744"

    memory = "1024"
    cpu = "0.5"
    virtual_router_id = opennebula_virtual_router.rics-gateway.id

    context = {
      NETWORK = "YES"
      TOKEN = "YES"
      SSH_PUBLIC_KEY = var.rick_ssh_key
      HOSTNAME = "$NAME"
      ONEAPP_VNF_NAT4_ENABLED = "YES"
      ONEAPP_VNF_NAT4_INTERFACES_OUT = "eth0"
    }

    disk {
      size = 2048 
      image_id = opennebula_image.virtual-router.id
    }
}

resource "opennebula_virtual_router_nic" "external-rics" {
  virtual_router_id = opennebula_virtual_router.rics-gateway.id
  network_id = opennebula_virtual_network.rics-vrack141.id
}

resource "opennebula_virtual_router_nic" "internal-rics" {
  virtual_router_id = opennebula_virtual_router.rics-gateway.id
  network_id = opennebula_virtual_network.rics-internal.id
}

resource "opennebula_virtual_machine" "rics-bastion" {
  name = "teemo"
  permissions = "770"
  group = "rics"

  cpu = 1
  memory = 1024
  
  context = {
    NETWORK = "YES"
    HOSTNAME = "$NAME"
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


}

resource "opennebula_virtual_machine" "test" {
  name = "lulu"
  permissions = "770"
  group = "rics"

  cpu = 1
  memory = 1024
  
  context = {
    NETWORK = "YES"
    HOSTNAME = "$NAME"
    SSH_PUBLIC_KEY = "$USER[SSH_PUBLIC_KEY]"
    PASSWORD = "$var.on_rick_pass"
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
}