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
	ensure => file,
	mode   => 644,
	owner  => root,
	group  => root,
	#source  => "puppet:///modules/ldap2zone/named.conf.ldap2zone",
	#require => Package["ldap2zone"]
    }
}
