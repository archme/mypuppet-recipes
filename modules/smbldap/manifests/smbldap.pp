### smbldap.pp

class smbldap {
    ## ensure package is installed
    package { "smbldap-tools":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/smbldap-tools/smbldap.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/smbldap/smbldap.conf",
	require => Package["smbldap-tools"]
    }
    ## ensure default config is there
    file { "/etc/smbldap-tools/smbldap_bind.conf":
	mode   => 600,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/smbldap/smbldap_bind.conf",
	require => Package["smbldap-tools"]
    }
}
