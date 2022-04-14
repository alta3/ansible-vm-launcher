# Launch a VM using Ansible

This repo is dedicated to using Ansible to launch a Bionic Beaver 18.04 image, on an existing Focal Fossa VM (20.04).

1. Clone the repo

2. Run the setup script.

    `$` `bash setup.sh`

3. Source your bashrc file

    `$` `source ~/.bashrc`

4. Launch the VM with ansible

    `$` `ansible-playbook launch.yml`
