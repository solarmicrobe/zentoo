#!/bin/bash

case $1 in
app-admin/syslog-ng)           echo "=$1-3.3.5-r1";;
app-text/docbook-xml-dtd)      echo "=$1-4.1.2-r6"
                               echo "=$1-4.2-r2"
                               echo "=$1-4.3-r1"
                               echo "=$1-4.4-r2"
                               echo "=$1-4.5-r1";;
app-text/openjade)             echo "=$1-1.3.2-r5";;
dev-db/hsqldb)                 echo "=$1-1.8.1.3-r1";;
dev-db/postgresql-*)           echo "=$1-9.1.6";;
dev-java/antlr)                echo "=$1-2.7.7-r2";;
dev-java/asm)                  echo "=$1-2.0-r1";;
dev-java/junit)                echo "=$1-3.8.2-r1";;
dev-java/jzlib)                echo "=$1-1.0.7-r1";;
dev-java/tomcat-servlet-api)   echo "=$1-4.1.36"
                               echo "=$1-6.0.36";;
dev-java/xml-commons-external) echo "=$1-1.3.04"
                               echo "=$1-1.4.01";;
dev-lang/R)                    echo "=$1-2.15.2";;
dev-lang/ghc)                  echo "=$1-7.4.1-r1";;
dev-lang/lua)                  echo "=$1-5.1.5";;
dev-lang/php)                  echo "=$1-5.3.18"
                               echo "=$1-5.4.8";;
dev-lang/python)               echo "=$1-2.7.3-r2";;
dev-libs/openssl)              echo "=$1-0.9.8x"
                               echo "$1";;
dev-libs/boost)                echo "=$1-1.52.0-r5";;
dev-libs/libnl)                echo "=$1-1.1-r3";;
dev-php/pecl-memcache)         echo "=$1-3.0.6-r1";;
dev-php/xdebug)                echo "=$1-2.2.1";;
dev-ruby/activesupport)        echo "=$1-3.2.11";;
dev-ruby/amqp)                 echo "=$1-0.6.7-r1";;
dev-ruby/builder)              echo "=$1-3.0.4";;
dev-ruby/i18n)                 echo "=$1-0.6.1";;
dev-ruby/eventmachine)         echo "=$1-1.0.0";;
dev-ruby/libxml)               echo "=$1-2.3.3";;
dev-ruby/mysql-ruby)           echo "=$1-2.9.0-r1";;
dev-ruby/ohai)                 echo "=$1-0.6.12";;
dev-ruby/tilt)                 echo "=$1-1.3.3";;
dev-util/boost-build)          echo "=$1-1.52.0-r1";;
dev-util/google-perftools)     echo "=$1-2.0";;
dev-vcs/cvs)                   echo "=$1-1.12.13.1";;
java-virtuals/servlet-api)     echo "=$1-2.3"
                               echo "=$1-2.5-r1";;
net-libs/zeromq)               echo "=$1-3.2.2";;
net-misc/dhcp)                 echo "=$1-4.2.4_p2-r1";;
sys-apps/texinfo)              echo "=$1-4.13-r2";;
sys-boot/grub)                 echo "=$1-2.00-r1";;
sys-cluster/ceph)              echo "=$1-0.55.1";;
sys-devel/autoconf)            echo "=$1-2.13"
                               echo "$1";;
sys-devel/automake)            echo "=$1-1.9.6-r3"
                               echo "$1";;
sys-devel/bc)                  echo "=$1-1.06.95-r1";;
sys-fs/lvm2)                   echo "=$1-2.02.97-r1";;
sys-fs/mdadm)                  echo "=$1-3.2.6";;
sys-fs/udev)                   echo "=$1-196-r1";;
sys-kernel/linux-headers)      echo "=$1-3.7";;
virtual/httpd-php)             echo "=$1-5.3"
                               echo "$1";;
virtual/jdk)                   echo "=$1-1.7.0";;
virtual/jre)                   echo "=$1-1.7.0";;
virtual/ruby-*)                echo "=$1-1";;
virtual/udev)                  echo "=$1-196";;
*)                             echo $1;;
esac
