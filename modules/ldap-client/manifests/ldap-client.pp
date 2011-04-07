### ldap-client.pp

class ldap-client {
    ## ensure package is installed
    package { "nss_ldap":
	ensure => installed,
    }
    package { "pam_ldap":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/ldap.secret":
	mode   => 600,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/ldap.secret",
	require => Package["nss_ldap"]
    }

    ## ensure default config is there
    file { "/etc/nsswitch.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/nsswitch.conf",
	require => Package["nss_ldap"]
    }

    ## ensure default config is there
    file { "/etc/nss_ldap.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/nss_ldap.conf",
	require => Package["nss_ldap"]
    }

    ## ensure default config is there
    file { "/etc/pam_ldap.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/pam_ldap.conf",
	require => Package["pam_ldap"]
    }

    ## ensure default config is there
    file { "/etc/pam.d/login":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/login",
	require => Package["pam_ldap"]
    }

    ## ensure default config is there
    file { "/etc/pam.d/passwd":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/passwd",
	require => Package["pam_ldap"]
    }

    ## ensure default config is there
    file { "/etc/pam.d/shadow":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/shadow",
	require => Package["pam_ldap"]
    }

    ## ensure default config is there
    file { "/etc/pam.d/su":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/su",
	require => Package["pam_ldap"]
    }

    ## ensure default config is there
    file { "/etc/pam.d/sshd":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/sshd",
	require => Package["pam_ldap"]
    }

    ## ensure default config is there
    file { "/etc/pam.d/other":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ldap-client/other",
	require => Package["pam_ldap"]
    }

    ## ensure service is running and restarted when config changes
    service { nscd:
              name       => "nscd",
              ensure     => running,
              restart    => "/etc/rc.d/nscd restart",
              start      => "/etc/rc.d/nscd start",
              stop       => "/etc/rc.d/nscd stop",
              #subscribe  => File["/etc/nss_ldap.conf"],
    }
}
