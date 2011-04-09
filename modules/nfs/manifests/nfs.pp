### nfs.pp

class nfs {
    ## ensure package is installed
    package { "nfs-utils":
	ensure => installed,
    }

    ## ensure default config is there
    file { "/etc/exports":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/nfs/exports",
	require => Package["nfs-utils"]
    }

    ## ensure default config is there
    file { "/etc/idmapd.conf":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/nfs/idmapd.conf",
	require => Package["nfs-utils"]
    }

    ## ensure default config is there
    file { "/srv/nfs4":
	ensure => directory,
	#recurse => true,
	mode   => 755,
	owner  => root,
	group  => root,
    }

    ## ensure default config is there
    file { "/srv/nfs4/homes":
	ensure => directory,
	#recurse => true,
	mode   => 755,
	owner  => root,
	group  => root,
    }

    ## ensure service is running and restarted when config changes
    service { rpcbind:
              name       => "rpcbind",
              ensure     => running,
              restart    => "/etc/rc.d/rpcbind restart",
              start      => "/etc/rc.d/rpcbind start",
              stop       => "/etc/rc.d/rpcbind stop",
              #subscribe  => File["/etc/exports"],
    }
    ## ensure service is running and restarted when config changes
    service { nfs-common:
              name       => "nfs-common",
              ensure     => running,
              restart    => "/etc/rc.d/nfs-common restart",
              start      => "/etc/rc.d/nfs-common start",
              stop       => "/etc/rc.d/nfs-common stop",
              #status     => "/etc/rc.d/nfs-common status",
              #subscribe  => Service["rpcbind"],
              require  => Service["rpcbind"],
    }

    ## ensure service is running and restarted when config changes
    service { nfs-server:
              name       => "nfs-server",
              ensure     => running,
              restart    => "/etc/rc.d/nfs-server restart",
              start      => "/etc/rc.d/nfs-server start",
              #status     => "/etc/rc.d/nfs-server status",
              stop       => "/etc/rc.d/nfs-server stop",
              #subscribe  => Service["nfs-common"],
              require  => Service["nfs-common"],
    }
}
