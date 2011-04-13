### samba.pp

class samba {
    ## ensure package is installed
    package { "samba":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/samba/smb.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/samba/smb.conf",
	require => Package["samba"]
    }

    ## ensure service is running and restarted when config changes
    service { samba:
              name       => "samba",
              ensure     => running,
              restart    => "/etc/rc.d/samba restart",
              start      => "/etc/rc.d/samba start",
              stop       => "/etc/rc.d/samba stop",
              subscribe  => File["/etc/samba/smb.conf"],
    }
}
