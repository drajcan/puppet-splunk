# vim: ts=2 sw=2 et
class splunk::params (
) {
  $type                         = undef
  $splunk_os_user               = 'splunk'
  $splunk_bindip                = undef
  $install_source               = undef
  $privKeyPath                  = undef
  $caCertPath                   = undef
  $lm                           = undef
  $ds                           = undef
  $inputport                    = undef
  $outputs                      = undef
  $webssl                       = true
  $sslcompatibility             = 'modern'
  $sslversions_modern           = 'tls1.1, tls1.2'
  $ciphersuite_modern           = 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK'
  $dhparamsize_modern           = 2048
  $ecdhcurvename_modern         = 'secp521r1'
  $sslversions_intermediate     = 'tls'
  $ciphersuite_intermediate     = 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:ECDHE-RSA-DES-CBC3-SHA:ECDHE-ECDSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA'
  $dhparamsize_intermediate     = 2048
  $httpport                     = undef
  $kvstoreport                  = undef
  $tcpout                       = undef
  # set to some string instead of undef to prevent 'Missing title' errors in Puppet 4.x
  $searchpeers                  = 'empty'
  $admin                        = undef
  $clustering                   = { }
  $shclustering                 = { }
  $service                      = {
    enable                      => true,
    ensure                      => undef,
  }
  $useACK                       = false
  $ds_intermediate              = undef
  $phonehomeintervalinsec       = 60
  $repositorylocation           = undef
  $version                      = undef
  $auth                         = {
    'type'                      => 'Splunk',
    'saml_idptype'              => undef,
    'saml_idpurl'               => undef,
    'ldap_host'                 => undef,
    'ldap_binddn'               => undef,
    'ldap_binddnpassword'       => undef,
    'ldap_sslenabled'           => 1,
    'ldap_userbasedn'           => undef,
    'ldap_groupbasedn'          => undef,
    'ldap_usernameattribute'    => 'sAMAccountName',
    'ldap_realnameattribute'    => 'cn',
    'ldap_groupnameattribute'   => 'cn',
    'ldap_groupmemberattribute' => 'member',
  }
  $rolemap = {
    'admin'     => 'Domain Admins',
    'power'     => 'Power Users',
    'user'      => 'Domain Users',
  }
  $dontruncmds                  = false
  $pass4symmkey                 = 'changeme'

  $install_provider = $::osfamily ? {
    'debian'                    => 'dpkg',
    'redhat'                    => 'yum',
  }
}

