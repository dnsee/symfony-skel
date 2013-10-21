DNSEE Symfony Standard Edition Skeleton
========================

Dnsee Symfony2 skeleton project. Includes:

* config/parameters for dev and prod environments
* capfile with preloaded recipes
* vagrantfile with puppet provisioning
* empty cache and log directories
* ant build
* removes AcmeDemoBundle

Installation
======================
```sh
php composer.phar create-project dnsee/symfony-skel <your-path> -sdev
```

Branches
======================

* `git checkout symfony23` for a __symfony__ 2.3 skel
* `git checkout symfony22` for a __symfony__ 2.2 skel
* `git checkout symfony21` for a __symfony__ 2.1 skel
