
url --url http://almalinux.mirror.wearetriple.com/9.1/BaseOS/x86_64/kickstart/
repo --name=BaseOS --baseurl=http://almalinux.mirror.wearetriple.com/9.1/BaseOS/x86_64/os/
repo --name=AppStream --baseurl=http://almalinux.mirror.wearetriple.com/9.1/AppStream/x86_64/os/    

text
skipx
eula --agreed
firstboot --disabled

rootpw --iscrypt $6$F2BZt.gc95Ik3ftg$oruGymfRnaRMbzNkJSLEQnMPpTZeLHi5f927rzr3OQG6.LWQYoqn6mmAMF5RW0IJQ91IQikuTogCgHlXvefyO0

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