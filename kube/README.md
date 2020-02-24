# Kubernetes setup script

Kubernetes is an open-source deployment tool.

## Setup Script
1. The script elevates permissions to be a root user
2. Update all packages. 
3. Install the yum-config-manager and add the repo to install docker
4. Configure iptables for Kubernetes
5. Add the kubernetes repo needed to find the kubelet, kubeadm and kubectl packages
6. Set SELinux in permissive mode (effectively disabling it)
7. Turn off the swap: Required for Kubernetes to work
8. Install Kubernetes and Docker
9. Start Docker
10. Start Kubernetes

