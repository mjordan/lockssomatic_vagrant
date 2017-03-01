# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "lockssomatic"

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 80, host: 8000 # Apache
  config.vm.network :forwarded_port, guest: 3306, host: 3307 # MySQL
  config.vm.network :forwarded_port, guest: 8081, host: 8081 # LOCKSS box 1
  config.vm.network :forwarded_port, guest: 8082, host: 8082 # LOCKSS box 2
  config.vm.network :forwarded_port, guest: 8083, host: 8083 # LOCKSS box 3
  config.vm.network :forwarded_port, guest: 8084, host: 8084 # LOCKSS box 4

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", '3000']
    vb.customize ["modifyvm", :id, "--cpus", "2"]   
  end

  shared_dir = "/vagrant"

  config.vm.provision :shell, path: "./scripts/setup.sh"
  config.vm.provision :shell, path: "./scripts/lockss.sh"
end
