class symfony {
    file { 'app_dev.php':
        source => 'puppet:///modules/symfony/app_dev.php',
        path => '/vagrant/web/app_dev.php',
        ensure => present,
        owner => $vagrant_nfs_user,
        group => $vagrant_nfs_group
    }
}
