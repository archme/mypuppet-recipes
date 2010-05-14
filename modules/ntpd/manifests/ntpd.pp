### ntpd.pp

class ntpd {
    ## ensure package is installed
    package { "ntp":
	ensure => installed,
	notify => Exec["ntpdate"]
    }

    ## run only once after package installation
    exec { "ntpdate":
        command => '/usr/bin/ntpdate pool.ntp.org',
        require => Package["ntp"],
        refreshonly => true
    }

    ## ensure default config is there
    file { "/etc/ntp.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/ntpd/ntp.conf",
	require => Package["ntp"]
    }

    ## ensure service is running and restarted when config changes
    service { ntpd:
	name       => "ntpd",
	ensure     => running,
	restart    => "/etc/rc.d/ntpd restart",
	start      => "/etc/rc.d/ntpd start",
	stop       => "/etc/rc.d/ntpd stop",
	subscribe  => File["/etc/ntp.conf"],
	require => Exec["ntpdate"]
    }
}
