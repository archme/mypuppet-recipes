### sshd.pp

class sshd {
    ## ensure package is installed
    package { "openssh":
	ensure => installed
    }

    ## ensure default config is there
    file { "/etc/ssh/sshd_config":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/sshd/sshd_config",
	require => Package["openssh"]
    }

    ## ensure service is running and restarted when config changes
    service { sshd:
	name       => "sshd",
	ensure     => running,
	restart    => "/etc/rc.d/sshd restart",
	start      => "/etc/rc.d/sshd start",
	stop       => "/etc/rc.d/sshd stop",
	subscribe  => File["/etc/ssh/sshd_config"]
    }

    exec { "allow-sshd":
        command => 'echo "sshd: ALL" >> /etc/hosts.allow',
        unless => "grep ^sshd /etc/hosts.allow",
	require => Package["openssh"]
    }
}
