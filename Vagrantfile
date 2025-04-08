Vagrant.configure("2") do |config|
  config.vm.box = "freebsd/FreeBSD-13.3-RELEASE"
  config.vm.box_version = "2024.03.02"

  # The FreeBSD image updates at startup, so allow for more time.
  config.vm.boot_timeout = 600

  # Does not work reliably.
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "file", source: "net5501", destination: "/home/vagrant/net5501"
  config.vm.provision "file", source: "build-nanobsd.sh", destination: "/home/vagrant/build-nanobsd.sh"

  config.vm.provision "shell", path: "setup-environment.sh"

  config.disksize.size = "20GB"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end
end
