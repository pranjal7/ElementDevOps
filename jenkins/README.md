# Jenkins setup script

Jenkins is an open-source deployment tool.

## Setup Script
1. The script elevates permissions to be a root user
2. Update all packages. 
3. Install the yum-config-manager and add the repo to install docker
4. Configure iptables for Jenkins
5. Add the Jenkins repo needed to find the kubelet, kubeadm and kubectl packages
6. Set SELinux in permissive mode (effectively disabling it)
7. Turn off the swap: Required for Jenkins to work
8. Install Jenkins and Docker
9. Start Docker
10. Start Jenkins

