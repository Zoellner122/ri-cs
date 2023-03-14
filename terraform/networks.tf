resource "opennebula_virtual_network" "rics-vrack141" {
  name = "rics_vrack141"
  description = "Connection through OVH-Vrack"
  type = "ovswitch"
  bridge = "virbr1"
  physical_device = "eno2"
  vlan_id = 0
  dns = "1.1.1.1"
  gateway = "141.95.79.30"

  permissions = "774"

}

resource "opennebula_virtual_network_address_range" "rics-141" {
    virtual_network_id = opennebula_virtual_network.rics-vrack141.id
    ar_type = "IP4"
    size = 29
    ip4 = "141.95.79.1"
}

resource "opennebula_virtual_network" "rics-vrack51" {
  name = "rics_vrack51"
  description = "Connection through OVH-Vrack"
  type = "ovswitch"
  bridge = "virbr1"
  physical_device = "eno2"
  vlan_id = 0
  dns = "1.1.1.1"
  gateway = "51.195.97.206"

  permissions = "774"
}

resource "opennebula_virtual_network_address_range" "rics-51" {
    virtual_network_id = opennebula_virtual_network.rics-vrack51.id
    ar_type = "IP4"
    size = 13
    ip4 = "51.195.97.193"
}

resource "opennebula_virtual_network" "rics-internal" {
  name = "rics_internal"
  description = "Internal network for RI-CS"

  group = opennebula_group.rics.name
  type = "ovswitch"
  physical_device = "eno2"
  bridge = "virbr1"
  automatic_vlan_id = true
 
  permissions = 770
  gateway = "10.101.0.1"

}

resource "opennebula_virtual_network_address_range" "rics-internal" {
    virtual_network_id = opennebula_virtual_network.rics-internal.id
    ar_type = "IP4"
    size = 100
    ip4 = "10.101.0.1"
}

resource "opennebula_virtual_router" "rics-gateway" {
  name = "rics-gateway"
  permissions = "744"

  instance_template_id = opennebula_virtual_router_instance_template.vr-template.id
}

resource "opennebula_virtual_router_nic" "external-rics" {
  virtual_router_id = opennebula_virtual_router.rics-gateway.id
  network_id = opennebula_virtual_network.rics-vrack141.id
}

resource "opennebula_virtual_router_nic" "internal-rics" {
  virtual_router_id = opennebula_virtual_router.rics-gateway.id
  network_id = opennebula_virtual_network.rics-internal.id
}

resource "opennebula_virtual_router_instance" "rics-gateway" {
    name = "rics-gateway"
    permissions = "744"
    group = "rics"

    memory = "1024"
    cpu = "0.5"
    virtual_router_id = opennebula_virtual_router.rics-gateway.id

    context = {
      NETWORK = "YES"
      TOKEN = "YES"
      SSH_PUBLIC_KEY = var.rick_ssh_key
      SET_HOSTNAME = "$NAME"

      # Virtual Router settings
      ONEAPP_VNF_NAT4_ENABLED = "YES"
      ONEAPP_VNF_NAT4_INTERFACES_OUT = "eth0"
      ONEAPP_VNF_ROUTER4_ENABLED = "YES"

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