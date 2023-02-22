build {
    name = "almalinux-8.7"
    source "proxmox.iso" {
        template_description = "AlmaLinux 8.7 made for RI-CS on ${timestamp()}"
        template_name        = "almalinux-8.7-RICS"
        iso_file             = "ISO:iso/AlmaLinux-8.7-x86_64-boot.iso"
        vm_id = 10001


        boot_command = [
            "<tab> ip=141.95.79.29::141.95.79.30:255.255.255.224:::off nameserver=1.1.1.1 inst.text inst.ks=http://77.169.152.88:65006/kickstart/almalinux8.ks<enter><wait>"
        ]
    }

    provisioner "shell" {
        inline = [
            "dnf config-manager --set-enabled powertools -y",
            "dnf install epel-release -y",
            "systemctl enable cloud-init",
            "rm -fr /root/~*",
            "passwd -d root",
            "passwd -l root",
            "> /etc/sysconfig/network-scripts/ifcfg-ens18",
            "> /var/log/syslog",
            "> /var/log/messages"
        ]
    }
}

build {
    name = "almalinux-9.1"
    source "proxmox.iso" {
        template_description = "AlmaLinux 9.1 made for RI-CS on ${timestamp()}"
        template_name        = "almalinux-9.1-RICS"
        iso_file             = "ISO:iso/AlmaLinux-9.1-x86_64-boot.iso"
        vm_id = 10002


        boot_command = [
            "<tab> ip=141.95.79.29::141.95.79.30:255.255.255.224:::off nameserver=1.1.1.1 inst.text inst.ks=http://77.169.152.88:65006/kickstart/almalinux9.ks<enter><wait>"
        ]
    }

    provisioner "shell" {
        inline = [
            "dnf config-manager --set-enabled powertools -y",
            "dnf install epel-release -y",
            "systemctl enable cloud-init",
            "rm -fr /root/~*",
            "passwd -d root",
            "passwd -l root",
            "> /var/log/syslog",
            "> /var/log/messages"
        ]
    }
}