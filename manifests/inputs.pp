# vim: ts=2 sw=2 et
class splunk::inputs (
  $inputport                 = $splunk::inputport,
  $ciphersuite               = $splunk::ciphersuite,
  $sslversions               = $splunk::sslversions,
  $ecdhcurvename             = $splunk::ecdhcurvename,
  $splunk_home               = $splunk::splunk_home,
  $splunk_app_precedence_dir = $splunk::splunk_app_precedence_dir,
  $splunk_app_replace        = $splunk::splunk_app_replace,
  $splunk_os_user            = $splunk::splunk_os_user
){
  $splunk_app_name = 'puppet_common_ssl_inputs'
  if $inputport == undef {
    file {"${splunk_home}/etc/apps/${splunk_app_name}":
      ensure  => absent,
      recurse => true,
      purge   => true,
      force   => true,
    }
  } else {
    file { ["${splunk_home}/etc/apps/${splunk_app_name}",
            "${splunk_home}/etc/apps/${splunk_app_name}/${splunk_app_precedence_dir}",
            "${splunk_home}/etc/apps/${splunk_app_name}/metadata",]:
      ensure => directory,
      owner  => $splunk_os_user,
      group  => $splunk_os_user,
      mode   => '0700',
    } ->
    file { "${splunk_home}/etc/apps/${splunk_app_name}/${splunk_app_precedence_dir}/inputs.conf":
      ensure  => present,
      owner   => $splunk_os_user,
      group   => $splunk_os_user,
      replace => $splunk_app_replace,
      content => template("splunk/${splunk_app_name}/local/inputs.conf"),
    }
  }
}

