Facter.add("vagrant_nfs_user") do
  setcode do
    Facter::Util::Resolution.exec("echo $(stat -c %u /vagrant)")
  end
end
