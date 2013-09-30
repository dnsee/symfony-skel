class php::composer {
    exec { 'composer.phar':
        command => 'wget -qO- http://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/bin',
        require => Package['php5-cli']
    }
    file { '/usr/bin/composer':
        ensure => link,
        target => "/usr/bin/composer.phar",
        require => Exec['composer.phar']
    }
        
}
