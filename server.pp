group{'puppet':
  ensure => present,
}

define user_account (
    $uid,
    $key,
    $username = $title,
    $gid = 'users',
    $groups = ['wheel', 'rvm'],
    $shell = '/bin/bash',
    $key_type = 'ssh-rsa'
    ){
    
  user { $username:
    ensure     => present,
    uid        => $uid,
    gid        => $gid,
    groups     => $groups,
    shell      => $shell,
    home       => '/home/${username}',
    managehome => true
  }
  
  ssh_authorized_key{'${username}_public_key':
    ensure => present,
    key => $key,
    user => $username,
    type => $key_type
  }
}


user_account{'cirode':
  uid => '100',
  key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDoYvJZ55HhTPlfglAay/p3q0JDyGEcVbfVzoG5Knx+Vt6N/rq8lacsxnlP/IzlaZZIucvUhq8OK/hsqKztegZRbESCcX526brKqq1JTmpC+OdG7j1Le2FkFIv42d9qolWhEizyGmCQLSSil6Ij65etAnZnLP98HNk7dDOxF1kWjHm7kmGqLUtRtMrH+m5lAEcCZ2RvRw6Treqn8L6QX5EWql97e1Mr+5geObPQ63hfBIMGZ/G+LWiygNy4vwKfL1OmSoQaQXZ7Q7AdSCVyRDQJNCHlJdkrHbcEACJBWZmpGymdhONGmQ2m442Q6R2fzMXbbIgAu/RNt4lz6Vo5kET/'
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

