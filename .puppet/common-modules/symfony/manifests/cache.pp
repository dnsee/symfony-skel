class symfony::cache {
    file {
        '/vagrant/app/cache':
            ensure => directory,
            recurse => true,
            force => true,
            purge => true;
        '/vagrant/app/cache/dummy':
            ensure => present,
            content => 'Purger placeholder for Puppet'
    }

    file {
        '/vagrant/app/logs':
            ensure => directory,
            recurse => true,
            force => true,
            purge => true;
        '/vagrant/app/logs/dummy':
            ensure => file,
            content => 'Purger placeholder for Puppet'
    }
}
