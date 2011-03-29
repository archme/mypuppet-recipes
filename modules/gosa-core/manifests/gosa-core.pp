### gosa-core.pp

class gosa-core {
    ## ensure package is installed
    package { "gosa-core":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/gosa/gosa.conf":
	mode   => 640,
	owner  => root,
	group  => http,
	source  => "puppet:///modules/gosa-core/gosa.conf",
	require => Package["gosa-core"]
    }
}
