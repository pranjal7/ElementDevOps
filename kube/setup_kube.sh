#/bin/bash

# Become root
sudo -i

# Update all packages
sudo yum update -y

# Install the yum-config-manager and add the repo to install docker
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
 
# Configure iptables for Kubernetes
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
 
# Add the kubernetes repo needed to find the kubelet, kubeadm and kubectl packages
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF
 
# Set SELinux in permissive mode (effectively disabling it)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
 
# Turn off the swap: Required for Kubernetes to work
sudo swapoff -a
 
# Install Kubernetes and Docker
sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes docker-ce docker-ce-cli containerd.io
 
# Start Docker
sudo systemctl enable --now docker
 
# Start Kubernetes
systemctl enable --now kubelet