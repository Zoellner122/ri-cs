terraform {
  required_providers {
	proxmox = {
		source = "Telmate/proxmox"
		version = "2.9.13"
	}
  }
}

provider "proxmox" {
	pm_api_url = "https://141.95.85.197:8006/api2/json"
	pm_api_token_id="terraform-prov@pve!terraform"
	pm_api_token_secret="3a73b546-8c7e-483d-b3c5-ca508ff65340"
	pm_tls_insecure = true
	pm_debug = true
	pm_log_enable = true
}

