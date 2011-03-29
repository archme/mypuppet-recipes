### ldap.pp

class ldap {
    ## ensure package is installed
    package { "openldap":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/openldap/slapd.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap/slapd.conf",
	require => Package["openldap"]
    }

    ## ensure service is running and restarted when config changes
    service { slapd:
              name       => "slapd",
              ensure     => running,
              restart    => "/etc/rc.d/slapd restart",
              start      => "/etc/rc.d/slapd start",
              stop       => "/etc/rc.d/slapd stop",
              subscribe  => File["/etc/openldap/slapd.conf"],
    }
}
