class { 'apt': }
class { 'jenkins': }
jenkins::plugin {
    'git':
}
jenkins::plugin {
    'mesos':
}

