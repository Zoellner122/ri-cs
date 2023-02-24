resource "opennebula_virtual_network" "rics-internal" {
  name = "RI-CS Internal"
  description = "Internal network for RI-CS"

  group = opennebula_group.rics.name
  bridge = "virbr1"
  type = "ovswitch"
  vlan_id = 101

  gateway = "10.100.0.1"
  dns = "10.100.0.1"
  
}

resource "opennebula_virtual_network_address_range" "rics-internal" {
    virtual_network_id = opennebula_virtual_network.rics-internal.id
    ar_type = "IP4"
    size = 100
    ip4 = "10.100.0.2"
}

resource "opennebula_virtual_router" "rics-gateway" {
  name = "rics-gateway"
  permissions = "642"

  instance_template_id = opennebula_virtual_router_instance_template.vr-template.id
}

resource "opennebula_virtual_router_instance" "rics-gateway" {
    name = "rics-gateway"
    permissions = "642"

    memory = "1024"
    cpu = "0.5"

    virtual_router_id = opennebula_virtual_router.rics-gateway.id

  
}