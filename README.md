## Introduction

A virtual machine for testing the [LOCKSS-O-Matic](https://github.com/mjordan/lockss-o-matic). It should work on any operating system that supports VirtualBox and Vagrant.

This virtual machine **should not** be used in production.

## Prerequisites

Install the following prerequisites on your laptop or desktop:

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](http://www.vagrantup.com/)

## Setting up your virtual machine

1. `git clone https://github.com/mjordan/lockssomatic_vagrant`
2. `cd lockssomatic_vagrant`
3. `vagrant up`

When all the scripts have finished running, the [LOCKSS daemon](https://github.com/lockss/lockss-daemon) will be installed, as will LOCKSS-O-Matic.

## Running the test Private LOCKSS Network (PLN)

This VM can run the "test framework" PLN described at https://plnwiki.lockss.org/index.php?title=Testing_Frameworks. To run this PLN:

1. ssh into the VM as the vagrant user (see below)
1. `cd ~/lockss-daemon/test/frameworks/run_multiple_daemons`
1. run `./start` (to shutdown the daemons later, run `./stop`)
1. after the daemons have started (which can take a minute, so be patient), you will be able to access their admin user interfaces at `http://localhost:8081`, `http://localhost:8082`, `http://localhost:8083`, and `http://localhost:8084`. Log into you boxes with `lockss-u` and `lockss-p`.

If you get an error indicating that access to the admin UI is not allowed from your IP address, add the following line to `~/lockss-daemon/test/frameworks/run_multiple_daemons/lockss.txt`, specifying the IP address indicated in the error message:

```
org.lockss.ui.access.ip.include = 10.0.2.2
```

## Accessing LOCKSS-O-Matic

Go to http://localhost:8000/lom/web/app.php and log in as `admin@example.com` / `admin'.

## Other details you might find useful

You can connect to the machine via ssh: `ssh -p 2222 vagrant@localhost` and log in with:
  - username: vagrant
  - password: vagrant

or from within the lockssomatic_vagrant directory, you can use `vagrant ssh`.

## Thanks

This Vagrant virtual machine is inspired by the [Islandora Vagrant](https://github.com/Islandora-Labs/islandora_vagrant).
