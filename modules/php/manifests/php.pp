### php.pp

class php {
    ## ensure package is installed
    package { "php-apache":
	ensure => installed,
    }

    ## ensure package is installed
    package { "php-gd":
	ensure => installed,
    }

    ## ensure package is installed
    package { "php-ldap":
	ensure => installed,
    }

    ## ensure package is installed
    package { "php-memcache":
	ensure => installed,
    }

    ## ensure package is installed
    package { "php-snmp":
	ensure => installed,
    }

    ## ensure package is installed
    package { "php-pgsql":
	ensure => installed,
    }

    ## ensure package is installed
    package { "php-curl":
	ensure => installed,
    }

    ## ensure package is installed
    package { "perl-crypt-smbhash":
	ensure => installed,
    }

    ## ensure package is installed
    package { "imagemagick":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/php/php.ini":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/php/php.ini",
	require => Package["php-apache"]
    }
    ## ensure default config is there
    file { "/srv/http/test.php":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/php/test.php",
	require => Package["php-apache"]
    }
    ## ensure default config is there
    file { "/etc/httpd/conf/extra/php5_module.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/php/php5_module.conf",
	require => Package["php-apache"]
    }
}
