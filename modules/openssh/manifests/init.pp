class openssh{
  package { 'openssh':
  	ensure => installed,
  }

  service{'sshd':
    ensure => running,
    enable => true,
    hasrestart => true,
    require => Package['openssh']
  }
}