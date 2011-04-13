### gopdc.pp

class gopdc {
    ## ensure package is installed
    package { "gopdc":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/gopdc.xml":
	mode   => 744,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/gopdc/gopdc.xml",
	require => Package["gopdc"]
    }
}
