### mc.pp

class mc {
  ## ensure package is installed
  package { "mc":
	ensure => installed
  }
}
