resource "opennebula_virtual_network" "rics-vrack141" {
  name = "rics_vrack141"
  description = "Connection through OVH-Vrack"
  bridge = "virbr1"
  type = "ovswitch"
  vlan_id = 0
  dns = "1.1.1.1"
  gateway = "141.95.79.30"

  permissions = "664"

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
  bridge = "virbr1"
  type = "ovswitch"
  vlan_id = 0
  dns = "1.1.1.1"
  gateway = "51.195.97.206"

  permissions = "664"
}

resource "opennebula_virtual_network_address_range" "rics-51" {
    virtual_network_id = opennebula_virtual_network.rics-vrack51.id
    ar_type = "IP4"
    size = 13
    ip4 = "51.195.97.193"
}