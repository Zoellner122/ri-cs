
url --url http://almalinux.mirror.wearetriple.com/8.7/BaseOS/x86_64/kickstart/
repo --name=BaseOS --baseurl=http://almalinux.mirror.wearetriple.com/8.7/BaseOS/x86_64/os/
repo --name=AppStream --baseurl=http://almalinux.mirror.wearetriple.com/8.7/AppStream/x86_64/os/    

text
skipx
eula --agreed
firstboot --disabled

rootpw --iscrypt $6$sbwSXry4/OWHWmea$okvtnF9m7io0lqbOKnBqSoxSgUnajoLOhuchU1aoNZVKgVnTj3k.r0EpfQlmJc0IdIS.wgkEPccq7PtnEi/qG/

lang en_US.utf8
keyboard us
timezone --utc Europe/Amsterdam

zerombr
clearpart --all --initlabel
autopart

%packages
@^minimal-environment
net-tools
git
wget
qemu-guest-agent
cloud-init
%end

%post
# import GPG keys
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
%end
reboot