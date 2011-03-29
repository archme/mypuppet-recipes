### dhcp.pp

class dhcp {
    ## ensure package is installed
    package { "dhcp-ldap":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/dhcpd.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/dhcp/dhcpd.conf",
	require => Package["dhcp-ldap"]
    }

    ## ensure service is running and restarted when config changes
    service { dhcpd:
              name       => "dhcpd",
              ensure     => running,
              restart    => "/etc/rc.d/dhcpd restart",
              start      => "/etc/rc.d/dhcpd start",
              stop       => "/etc/rc.d/dhcpd stop",
              subscribe  => File["/etc/dhcpd.conf"],
    }
}
