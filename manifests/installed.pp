# vim: ts=2 sw=2 et
class splunk::installed (
  $package          = $splunk::package,
  $install_source   = $splunk::install_source,
  $splunk_home      = $splunk::splunk_home,
  $splunk_os_user   = $splunk::splunk_os_user,
  $version          = $splunk::version
) {

  if $install_source {
    package { $package:
      source   => $install_source,
      provider => $splunk::params::install_provider,
      ensure   => installed,
    }
  } else {
    if $version == undef {
      package { $package:
        ensure => installed,
      }
    } else {
      package { $package:
        ensure => $version,
      }
    }
  }

  exec { 'splunk enable boot-start etcetera':
    command => "${splunk_home}/bin/splunk enable boot-start -user ${splunk_os_user} --accept-license --answer-yes --no-prompt",
    path    => ["${splunk_home}/bin", '/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    require => Package[$package],
    creates => "${splunk_home}/etc/system/local/server.conf",
  }

}