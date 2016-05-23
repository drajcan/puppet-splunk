# vim: ts=2 sw=2 et
define splunk::addsearchpeers {
  if $title != 'empty' {
    $package     = $splunk::package
    $splunk_home = $splunk::splunk_home
    $admin       = $splunk::admin
    $adminpass   = $admin[pass]
    $dontruncmds = $splunk::dontruncmds
  
    if $adminpass == undef {
      err('Plaintext admin password not set, skipping addition of search peers to search head')
    } elsif $dontruncmds == true {
      notice('Skipping splunk add search-server due to $dontruncmds=true')
    } else {
      exec { "splunk add search-server ${title}":
        command     => "splunk add search-server -host ${title} -auth admin:${adminpass} -remoteUsername admin -remotePassword ${adminpass} && touch ${splunk_home}/etc/auth/distServerKeys/${title}.done",
        path        => ["${splunk_home}/bin", '/bin', '/sbin', '/usr/bin', '/usr/sbin'],
        environment => ["SPLUNK_HOME=${splunk_home}"],
        creates     => [
          "${splunk_home}/etc/auth/distServerKeys/${title}.done",
        ],
        logoutput   => true,
      }
    }
  }
}

