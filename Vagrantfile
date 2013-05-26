Vagrant::Config.run do |config|
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "precise64"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Assign this VM to a host only network IP, allowing you to access it
    # via the IP.
    config.vm.network :hostonly, "192.168.50.2"
    config.vm.customize ["modifyvm", :id, "--memory", "768"]
    config.vm.host_name = "devbox.dev"

    # Provisioning settings.
    config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "."
      puppet.manifest_file = "manifests/manifest.pp"
      puppet.module_path = "manifests/modules"
    end
    # The path to the platform
    config.vm.share_folder("v-root", "/var/www", "./web", :nfs => true)
end
