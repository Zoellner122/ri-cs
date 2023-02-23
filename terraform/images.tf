resource "opennebula_image" "almalinux_8" {
  name = "AlmaLinux 8"
  description = "Image for AlmaLinux 8"
  datastore_id = 1
  persistent = false
  path = "https://marketplace.opennebula.io/appliance/6ae0a5e8-21a0-47e7-ad18-707af04eed60"

  permissions = "644"
}

resource "opennebula_image" "ubuntu_20_04" {
  name = "Ubuntu 20.04 LTS"
  description = "Image for Ubuntu 20.04 LTS"
  datastore_id = 1
  persistent = false
  path = "https://marketplace.opennebula.io/appliance/f15ff51e-d3eb-42e7-96e6-a7088da1b877"

  permissions = "644"
}

