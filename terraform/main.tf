terraform {
    required_providers {
     proxmox  = {
      source  = "Telmate/proxmox"
      version = "2.9.13"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.prox_node
  pm_api_token_id     = var.prox_token_user
  pm_api_token_secret = var.prox_token_secret
  pm_tls_insecure     = true
}

