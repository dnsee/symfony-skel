Facter.add("vagrant_nfs_group") do
  setcode do
    Facter::Util::Resolution.exec("echo $(stat -c %g /vagrant)")
  end
end
