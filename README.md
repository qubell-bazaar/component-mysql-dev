MySQL
=====

![](http://www.mysql.com/common/logos/logo-mysql-110x57.png)

Installs and configures MySQL 5.

[![Install](https://raw.github.com/qubell-bazaar/component-skeleton/master/img/install.png)](https://express.qubell.com/applications/upload?metadataUrl=https://github.com/qubell-bazaar/component-mysql/raw/master/meta.yml)

Features
--------

 - Install and configure MySQL
 - Create databases
 - Manage grants
 - Execute arbitrary SQL on a database

Configurations
--------------
[![Build Status](https://travis-ci.org/qubell-bazaar/component-mysql.png?branch=master)](https://travis-ci.org/qubell-bazaar/component-mysql)

 - MySQL 5.x (latest), CentOS 6.3 (us-east-1/ami-eb6b0182), AWS EC2 m1.small, root
 - MySQL 5.x (latest), CentOS 5.3 (us-east-1/ami-beda31d7), AWS EC2 m1.small, root
 - MySQL 5.x (latest), Ubuntu 12.04 (us-east-1/ami-d0f89fb9), AWS EC2 m1.small, root
 - MySQL 5.x (latest), Ubuntu 10.04 (us-east-1/ami-0fac7566), AWS EC2 m1.small, root

Pre-requisites
--------------
 - Configured Cloud Account a in chosen environment
 - Either installed Chef on target compute OR launch under root
 - Internet access from target compute:
  - MySQL distribution: ** (CentOS), ** (Ubuntu)
  - S3 bucket with Chef recipes: ** (TBD)
  - If Chef is not installed: ** (TBD)

Implementation notes
--------------------
 - Installation is based on Chef recipes from http://community.opscode.com/cookbooks/mysql

Example usage
-------------
**
