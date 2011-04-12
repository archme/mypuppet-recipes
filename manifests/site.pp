node default {
        include vim
        include mc
        include screen
        include aliases
        include ntpd
        include sshd
}

node robtest01 {
	include httpd
	include php
	include ldap
	include ldap-client
	include gosa-core
	include nfs
}

node gosa {
	include httpd
	include php
	include ldap
	include ldap-client
	include gosa-core
	include dhcp
	include named
	include ldap2zone
	include samba
	include smbldap
	#include gopdc
}
