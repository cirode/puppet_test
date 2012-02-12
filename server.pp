group{'puppet':
  ensure => present,
}

user { "cirode":
	ensure     => present,
	uid        => '100',
	gid        => 'users',
	groups     => ['wheel','rvm'],
	shell      => '/bin/bash',
	home       => '/home/cirode',
	managehome => true,
}

ssh_authorised_key{'cirode_public_key':
  ensure => present,
  key => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEHr7keRZxIqrnl/H9euyyNyN/jTYZc7u25qyCOd6bzbm8T0lUNdtlfgz7piCRqrcwLbKIFltmqZAT6MribPsMbY1DqnYMRo4eWSoSGycUyK6X65O1inIPCz+Xus5FL6m1AIpQBVNoNfpTTBGuF8UwKkwt0yG2PaPB3OCsNKhzVHtnINk9y7EbaRkX4QtbG/vI0UbenxnXu2E/CO0rlXllO1p/OGqTLSsrXNyI5elkb//5NXwVQ44yh5RwWab7AeVKJ+41qxBZwzU88t0wwkvl7eJtcFULWNYbz6qpki/X1Z4GGoS0jhkGi8+k/1LyUhI6Rr5FQTjFhfswfsSiA0Bb cirode@Charon.local',
  user => 'cirode',
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
}

