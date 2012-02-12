#node types. EG: Web server, Cassandra server, index server, etc

node basenode {
  include user_account::sysadmins

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