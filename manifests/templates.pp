#node types. EG: Web server, Cassandra server, index server, etc

node basenode {
  include user_account::sysadmins
  include vim
  include openssh
  
  group{'puppet':
    ensure => present,
  }
}