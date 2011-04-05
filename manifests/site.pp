node default {
        include vim
        include mc
        include screen
        include aliases
        include ntpd
        include sshd
}

node gosa {
	include httpd
	include php
	include ldap
	include gosa-core
	include dhcp
	include named
	include ldap2zone
}
