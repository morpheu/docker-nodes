DOCKER_INSTANCES = (ENV['DOCKER_INSTANCES'].to_i > 0 && ENV['DOCKER_INSTANCES'].to_i) || 1
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu14.04"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  (1..DOCKER_INSTANCES).each do |id|
    config.vm.define vm_name = "docker-#{id}" do |config|
      config.vm.hostname = vm_name

      config.vm.provider :virtualbox do |vb|
        vb.memory = 512
        vb.cpus = 1
      end

      ip = "192.168.50.#{id+5}"
      config.vm.network :private_network, ip: ip
      config.vm.provision :shell, :path => "docker-provision.sh", :privileged => true
    end
  end
end
