### vim.pp

class vim {
  ## ensure package is installed
  package { "vim":
	ensure => installed
  }

  ## ensure default config is there
  file { "/etc/vimrc":
	mode   => 644,
	owner  => root,
	group  => root,
	source  => "puppet:///modules/vim/vimrc",
	require => Package["vim"]
  }
}
