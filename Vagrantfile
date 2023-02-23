# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.private_key_path = ["~/.ssh/id_rsa"]
  config.ssh.username = 'root'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.allow_fstab_modification = false
  config.ssh.sudo_command = "%c" # sudo is not available and we are already root

  config.vm.provider :docker do |d|
     d.build_dir = "."
     d.has_ssh = true
  end

  config.vm.define "nginx_build" do |nginx_build|
    nginx_build.vm.hostname = "nginx.build"
    nginx_build.vm.network :private_network, ip: "192.17.172.200"

    nginx_build.vm.provision "ansible" do |configuration_ansible|
      configuration_ansible.playbook = "build.yml"
      configuration_ansible.inventory_path = "inventories/vagrant"
      configuration_ansible.limit = "all"
      configuration_ansible.become = true
      configuration_ansible.force_remote_user = false
      configuration_ansible.extra_vars = {
        ansible_ssh_user: "root",
        ansible_ssh_private_key_file: "~/.ssh/id_rsa"
      }
      configuration_ansible.verbose = 'v'
    end

  end

end

