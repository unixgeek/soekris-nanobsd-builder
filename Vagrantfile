Vagrant.configure("2") do |config|
  config.vm.box = "freebsd/FreeBSD-12.3-RELEASE"

  # The FreeBSD image updates at startup, so allow for more time.
  config.vm.boot_timeout = 600

  config.vm.synced_folder "net5501", "/home/vagrant/net5501"

  config.vm.provision "file", source: "build-nanobsd.sh", destination: "/home/vagrant/build-nanobsd.sh"

  config.vm.provision "shell", path: "setup-environment.sh"

  config.disksize.size = "20GB"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end
end
