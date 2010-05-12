### screen.pp

class screen {
    ## ensure package is installed
    package { "screen":
	ensure => installed
    }

    ## ensure default config is there
    file { "/etc/screenrc":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/screen/screenrc",
	require => Package["screen"]
    }
}
