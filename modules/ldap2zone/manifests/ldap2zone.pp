### ldap2zone.pp

class ldap2zone {
    ## ensure package is installed
    package { "ldap2zone":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/default/ldap2zone":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap2zone/ldap2zone",
	require => Package["ldap2zone"]
    }

    ## ensure default config is there
    file { "/var/named/named.conf.ldap2zone":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap2zone/named.conf.ldap2zone",
	require => Package["ldap2zone"]
    }

    ## ensure service is running and restarted when config changes
    #service { named:
    #          name       => "named",
    #          ensure     => running,
    #          restart    => "/etc/rc.d/named restart",
    #          start      => "/etc/rc.d/named start",
    #          stop       => "/etc/rc.d/named stop",
    #          subscribe  => File["/etc/default/lapd2zone"],
    #}
}
