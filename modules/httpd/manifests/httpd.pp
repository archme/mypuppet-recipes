### httpd.pp

class httpd {
    ## ensure package is installed
    package { "apache":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/httpd/conf/httpd.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/httpd/httpd.conf",
	require => Package["apache"]
    }

    ## ensure default config is there
    file { "/etc/httpd/conf/extra/httpd-gosa.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/httpd/extra/httpd-gosa.conf",
	require => Package["apache"]
    }

    ## ensure service is running and restarted when config changes
    service { httpd:
	name       => "httpd",
	ensure     => running,
	restart    => "/etc/rc.d/httpd restart",
	start      => "/etc/rc.d/httpd start",
	stop       => "/etc/rc.d/httpd stop",
	subscribe  => File["/etc/httpd/conf/httpd.conf"],
    }
}
