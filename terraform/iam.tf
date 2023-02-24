resource "opennebula_group" "rics" {
    name = "rics"
}

resource "opennebula_user" "rick" {
  name = "rick"
  password = var.on_pass

  primary_group = 0
  groups = [opennebula_group.rics.id]
}

resource "opennebula_group_admins" "rics" {
    group_id = opennebula_group.rics.id
    users_ids = [
        opennebula_user.rick.id
    ]
  
}