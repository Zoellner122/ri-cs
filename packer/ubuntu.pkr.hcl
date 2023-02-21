build {
    name = "ubuntu-22.04"
    source "proxmox.iso" {
        #Template definitions
        template_description = "Ubuntu 22.04 made for RI-CS on ${timestamp()}"
        template_name        = "ubuntu-22.04-RICS"
        iso_file             = "local:iso/ubuntu-22.04.1-live-server-amd64.iso"
        
        #Configuration for Template
        boot_command = [
            "c",
            "linux /casper/vmlinuz ip=141.95.79.29::141.95.79.30:255.255.255.224:::off nameserver=1.1.1.1 --- autoinstall ds='nocloud-net;s=http://77.169.152.88:65006/cloud-init/ubuntu/'",
            "<enter><wait>",
            "initrd /casper/initrd<enter><wait>",
            "boot<enter>"
        ]
    }

    provisioner "shell" {
        inline = [
            "rm -fr /root/~*",
            "passwd -d root",
            "passwd -l root",
            "> /var/log/syslog",
            "> /var/log/messages",
            "cloud-init reset"
        ]
    }
    
}