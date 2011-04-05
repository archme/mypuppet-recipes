### named.pp

class named {
    ## ensure package is installed
    package { "bind":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/named.conf":
	mode   => 640,
	owner  => root,
	group  => named,
	source  => "puppet:///modules/named/named.conf",
	require => Package["bind"]
    }

    ## ensure service is running and restarted when config changes
    service { named:
              name       => "named",
              ensure     => running,
              restart    => "/etc/rc.d/named restart",
              start      => "/etc/rc.d/named start",
              stop       => "/etc/rc.d/named stop",
              subscribe  => File["/etc/named.conf"],
    }
}
