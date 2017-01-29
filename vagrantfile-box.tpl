Vagrant.configure("2") do |config|

  config.ssh.username = "alpine"
  config.ssh.shell = "bash -l"

  config.vm.provider "virtualbox" do |vm, override|

    # Custom VM configuration
    vm.customize ["modifyvm", :id, "--memory", "4096"]
    vm.customize ["modifyvm", :id, "--cpus", "2"]
    vm.customize ["modifyvm", :id, "--cableconnected1", "on"]
    vm.customize ["modifyvm", :id, "--audio", "none"]
    vm.customize ["modifyvm", :id, "--usb", "off"]
    # For secured workstations
    vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    # No FS share to allow any depds to the host
    config.vm.synced_folder ".", "/vagrant", disabled: true
  end

end
