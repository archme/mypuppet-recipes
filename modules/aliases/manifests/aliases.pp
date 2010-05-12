### aliases.pp

class aliases {
    file { "/etc/profile.d/aliases.sh":
	mode   => 755,
        owner  => root,
        group  => root,
	source  => "puppet:///modules/aliases/aliases.sh"
    }
}
