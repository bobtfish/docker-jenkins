class { 'apt': }
class { 'jenkins':
  service_enable => false,
  service_ensure => undef,
}
jenkins::plugin {
    'git':
}
jenkins::plugin {
    'mesos':
}

