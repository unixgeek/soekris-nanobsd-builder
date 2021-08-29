Vagrant.configure("2") do |config|
  config.vm.box = "freebsd/FreeBSD-12.2-RELEASE"

  # The FreeBSD image updates at startup, so allow for more time.
  config.vm.boot_timeout = 600

  config.vm.provision "file", source: "net5501", destination: "/home/vagrant/net5501"

  config.vm.provision "shell", path: "build-nanobsd.sh"

  config.disksize.size = "20GB"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end
end
