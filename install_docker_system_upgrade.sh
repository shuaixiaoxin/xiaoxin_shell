#!/bin/bash


# 阿里yum源
yum install lrzsz wget -y
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
yum makecache
echo "yum源安装成功！"

# docker源
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sed -i 's+download.docker.com+mirrors.aliyun.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
yum makecache fast
echo "docker源安装成功！"


# 系统升级
wget https://elrepo.org/linux/kernel/el7/x86_64/RPMS/kernel-lt-5.4.261-1.el7.elrepo.x86_64.rpm
wget https://elrepo.org/linux/kernel/el7/x86_64/RPMS/kernel-lt-devel-5.4.261-1.el7.elrepo.x86_64.rpm
yum install -y *.rpm 
sed -i 's/^GRUB_DEFAULT=.*/GRUB_DEFAULT=0/' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
echo "系统升级成功, 请重启系统！安装相应版本docker（经过验证的docker为 docker-ce-20.10.20-3.el7）"
