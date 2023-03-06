resource "opennebula_group" "rics" {
    name = "rics"
}

resource "opennebula_group_admins" "rics" {
    group_id = opennebula_group.rics.id
    users_ids = [
        opennebula_user.rick.id
    ]
  
}