# Launch a VM using Ansible

This repo is dedicated to using Ansible to launch one or more VMs using Ansible.

## Pre-Reqs

You will need to use a debian based machine with at least 2 CPU and 4 GB RAM to launch VMs on.

## Getting Started

1. Clone the repo

2. Run the setup script.

    `$` `bash setup.sh`

3. Source your bashrc file

    `$` `source ~/.bashrc`

## Launch a single Ubuntu 18.04 VM using Ansible

The playbook called "simple-launch.yml" is a down and dirty way to get a single VM launched quickly. It is a very straightforward, hardcoded method that is excellent for learning the steps that we need to take to launch a VM, but if you are looking for launching multiple VMs, keep scrolling down.

1. Launch the VM with ansible

    `$` `ansible-playbook simple-launch.yml`

0. The VM should be ready to go in 30 seconds or less. So after singing the "Jeapordy" theme song to yourself, attempt to ping the VM you just created.

    `$` `ping 172.16.0.5`
    
0. Now attempt to SSH into the vm. It should work.

    `$` `ssh ubuntu@172.16.0.5`
    
0. When you are done testing this VM out, exit.

    `$` `exit`
 
## Launch Multiple Ubuntu 18.04 VMs using Ansible
1. Open the file called "vars/many_vms.yaml" to see information about each VM you are about to launch. There are three example VMs in there for you now. If you want to change the base image, you will need to keep on scrolling down this page.

0. Run the "advanced-launch.yml" playbook, reading in the variable file "many_vms.yaml".

    `$` `ansible-playbook advanced-launch.yml -e "@vars/many_vms.yaml"`
    
    > You should see some more verbose output being displayed as you are watching this playbook run.

0. You should now be able to ping and SSH to the IPs of `172.16.0.7`, `172.16.0.8` & `172.16.0.9`. Note how they each have different hostnames as well.


## Preparing a Host for VMs

Avoiding the hard-coded nature of the "simple-launch.yaml" would be best, so let's use the role called **host-prep**. This role should only be run **once-per-host**. 

> There are no configuration variables available for this role.

1. To use this role, simply run the "advanced-launch.yml" playbook and use the tag `host-setup`. **Note: This will also call on the _download_imgs_ role**.

    `$` `ansible-playbook advanced-launch.yml --tags host-setup`
    
## Downloading Other VM Base Images

In order to download other VMs for your host, simply add in a var in the following fashion:

1. Edit "vars/images.yaml". An example has been put here for you.

    ```yaml
    vm_cloud_images:
    - url: https://static.alta3.com/projects/kvm/bionic-server-cloudimg-amd64.img
      dest: /var/kvm/images/bionic.img
      src_img_fmt: qcow2
      size: 8
    ```

0. Run the "advanced-launch.yml" playbook while only calling on the tag of `imgs`.

    `ansible-playbook advanced-launch.yml --tags imgs -e "@vars/images.yaml"
