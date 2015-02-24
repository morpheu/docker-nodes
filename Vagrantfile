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
      config.vm.provision :shell, :inline => "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && echo deb https://get.docker.io/ubuntu docker main\ > /etc/apt/sources.list.d/docker.list && apt-get update && apt-get install lxc-docker -y && sed -i -e '/^DOCKER_OPTS/d' /etc/default/docker && echo DOCKER_OPTS=\'-H tcp://0.0.0.0:2375\' >> /etc/default/docker && stop docker || start docker", :privileged => true
    end
  end
end
