node basenode {

  group{'puppet':
    ensure => present,
  }
  
  package{'vim':
    ensure => installed,
  }

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