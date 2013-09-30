class puppet-base {

    exec { 'apt-get update':
        command => '/usr/bin/apt-get update',
    }

    package { 'vim':
        ensure  => installed,
        require => Exec['apt-get update'],
    }

    package { 'nano':
        ensure  => purged,
        require => Exec['apt-get update'],
    }

    package { 'git':
        ensure  => installed,
        require => Exec['apt-get update'],
    }

    file { '/home/vagrant/workspace':
        ensure => link,
        target => '/vagrant',
        owner  => 'vagrant',
    }

    package { 'capistrano':
        name => 'capifony',
        ensure => installed,
        provider => gem
    }
}

