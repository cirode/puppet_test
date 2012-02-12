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
    home       => "/home/${username}",
    managehome => true
  }
  
  ssh_authorized_key{"${username}_public_key":
    ensure => present,
    key => $key,
    user => $username,
    type => $key_type
  }
}