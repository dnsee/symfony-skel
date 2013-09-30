
### CONFIGURATION ###

$host = "vagrantbox.local"                      # must match hosts file
$php_ext = ["intl", "curl", "mysql"]            # php extensions to enable

## DO NOT EDIT BELOW THIS LINE (UNLESS YOU KNOW WHAT YOU'RE DOING) ##

# Base
class req_stage {
    include puppet-base
}

# Apache
class apache_stage {
    include apache
    apache::vhost { $host:
        port            => '80',
        docroot         => '/vagrant/web',
        logroot         => '/var/log/apache2',
        serveradmin     => 'webmaster@example.com',
    }
}

# Php
class php_stage {
    include php
    include php::apache2
    include php::pear
    include php::composer

    php::module { $php_ext:
        require => Package["php-pear"]
    }

    php::conf { "date":
        source => 'puppet:///modules/php/date.ini',
    }

    php::conf { ["pdo", "pdo_mysql"]:
        require => Package["php-mysql"],
    }

    php::conf { "global":
        source => "puppet:///modules/php/extra.ini"
    }
}

# Mysql
class mysql_stage {
    include mysql
    include mysql::server

    database_grant { "hudson@127.0.0.1/*":
        privileges => "all",
        require => Database_user["hudson@127.0.0.1"]
    }

    database_user { "hudson@127.0.0.1":
        password_hash => "*8D98748618FBE0E1101AF688601FF00FB7F60E6B"
    }
}

# Symfony
class symfony_stage {
    include symfony
    include symfony::cache
}

# Env
if $virtual == "virtualbox" and $fqdn == "" {
    $fqdn = "localhost"
}

# Timeline
Exec["apt-get update"] -> Package <| |>
Class["apache_stage"] -> Class["php_stage"] -> Class["mysql_stage"] -> Class["symfony_stage"]

# Path
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

# Main flow
include req_stage
include apache_stage
include php_stage
include mysql_stage 
include symfony_stage
