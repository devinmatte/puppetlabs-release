component 'gpg_key' do |pkg, settings, platform|
  pkg.version '2016.08.19'

  if platform.is_deb?
    pkg.add_source("file://files/pl-build-tools-keyring.gpg")
    pkg.install_file 'pl-build-tools-keyring.gpg', '/etc/apt/trusted.gpg.d/pl-build-tools-keyring.gpg'
  else
    pkg.add_source("file://files/RPM-GPG-KEY-pl-build-tools.asc")
    pkg.add_source("file://files/RPM-GPG-KEY-puppet.asc")
    pkg.install_file 'RPM-GPG-KEY-pl-build-tools.asc', '/etc/pki/rpm-gpg/RPM-GPG-KEY-pl-build-tools'
    pkg.install_file 'RPM-GPG-KEY-puppet.asc', '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppet'
  end
end