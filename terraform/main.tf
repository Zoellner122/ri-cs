terraform {
  cloud {
    organization = "ri-cs"

    workspaces {
      name = "ri-cs"
    }
  }
  required_providers {
    opennebula = {
      source = "OpenNebula/opennebula"
      version = "1.1.1"
    }
  }
}

provider "opennebula" {
  endpoint      = var.on_endpoint
  flow_endpoint = var.on_flowendpoint
  username      = var.on_user
  password      = var.on_pass
}

data "terraform_remote_state" "rics" {
  backend = "remote"

  config = {
    organization = "ri-cs"
    workspaces = {
      name = "ri-cs"
    }

   }
}
