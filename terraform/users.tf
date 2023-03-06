resource "opennebula_user" "rick" {
  name = "rick"
  password = var.on_rick_pass

  primary_group = 0
  groups = [opennebula_group.rics.id]

}