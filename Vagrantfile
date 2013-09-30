# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # Box name
  config.vm.define :vagrant_box do |web_config|
  end

  # hostname - don not use underscores!
  config.vm.host_name = "vagrant-box"

  # Base VM
  config.vm.box = "precise64"
  # Base VM location - Dnsee intranet
  config.vm.box_url = "http://vagrant.dnsee.int/precise64.box"
  # Base VM location - Official
  # config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Shared Document Root
      # OSX (requires case sensitive partition), Linux (requires nfsd, nfs-common, root credentials):
      config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  # Windows (experimental)
      # config.vm.share_folder("v-root", "/vagrant", ".", { :group => "www-data", :extra => 'dmode=6775,fmode=6664' } )
      # config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

  # Apache port forwarding
  # config.vm.forward_port 80, 8000, { :auto => true }
  config.vm.network :hostonly, "172.16.0.100"

  # Memory
  config.vm.customize ["modifyvm", :id, "--memory", 2048]

  # Puppet
  config.vm.provision :puppet, :module_path => [".puppet/common-modules", ".puppet/custom-modules"]  do |puppet|
    puppet.manifests_path = ".puppet/manifests"
    puppet.manifest_file  = "main.pp"
  end

end
