# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.define "app" do |app|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.10.100"
    # config.hostsupdater.aliases = ["development.local"]
    config.vm.synced_folder ".", "/home/vagrant/app"
    config.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
  end

  config.vm.define "db" do |db|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.10.150"
    config.vm.synced_folder ".", "/home/vagrant/db"
    config.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
  end

end
