class symfony::composer {
    
    if ($do_composer_update == "yes") {
        exec { 'composer update':
            command => "su vagrant -c '/usr/bin/php /usr/bin/composer.phar update'",
            cwd => '/vagrant',
            timeout => 0,
            returns => [0, 1],
            require => [ File["/home/vagrant/.ssh/known_hosts"], Package["php5-cli"] ]
        }
    }
    
    file { "/home/vagrant/.ssh/known_hosts":
        ensure => file,
        content => "bitbucket.org,207.223.240.182 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==",
        require => File["/home/vagrant/.ssh/id_rsa.pub"]
    }

    file { "/home/vagrant/.ssh/id_rsa.pub":
        ensure => file,
        content => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEQi/G4bYYYgwVkTXX0aJOm5vZyYXoq/2Ed2MV4PIBBQb45O+ZFW+y7DKa6kCsP451aAmWCukrTlGuTsqxp/nKxFIq/CciHnoABmAQC2ZTm4cQDiBw8+I2PqtpKnbmk290E934CnfZIL8HPXEGrxHO7xp6JZn7CY1ZtWZtAiyVnviW1G6qal7lCIpv3bWvVPkBrFSOuc6C2ZK4JqTVCqOZDTIKMxfeTRexvMxPQQhc9zabwNFA+wDFzkkIQHNllotY3gcQviIRRHBRIEVSvQmoQlyaeF5gjtM7PivgFHh6M25AB837JthBySXHXYbkVUYqo+jlZATTqRGBcCzv0VTF vagrantbox",
        require => File["/home/vagrant/.ssh/id_rsa"],
        owner => "vagrant",
        group => "vagrant",
        mode => "0644"
    }

    file { "/home/vagrant/.ssh/id_rsa":
        ensure => file,
        source => "puppet:///modules/puppet-base/id_rsa",
        owner => "vagrant",
        group => "vagrant",
        mode => "0600"
    }
}
