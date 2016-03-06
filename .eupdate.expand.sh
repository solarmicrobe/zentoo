#!/bin/bash

case $1 in

# docbook slots
app-text/docbook-sgml-dtd)               echo "=$1-3.0-r3"
                                         echo "=$1-3.1-r3"
                                         echo "=$1-4.0-r3"
                                         echo "=$1-4.1-r3";;
app-text/docbook-xml-dtd)                echo "=$1-4.1.2-r6"
                                         echo "=$1-4.2-r2"
                                         echo "=$1-4.3-r1"
                                         echo "=$1-4.4-r2"
                                         echo "=$1-4.5-r1";;
app-text/docbook-xml-simple-dtd)         echo "=$1-1.0-r1"
                                         echo "=$1-4.1.2.4-r2";;

# autoconf/make slots
sys-devel/autoconf)                      echo "$1";;
sys-devel/automake)                      echo "=$1-1.14.1"
                                         echo "$1";;

# ncurses slots
sys-libs/ncurses)                        echo "=$1-5.9-r5"
                                         echo "$1";;

# python
dev-lang/python)                         echo "=$1-2.7.10-r1";;

# ruby
dev-lang/ruby)                           echo "=$1-2.2.4";;
app-eselect/eselect-ruby)                echo "=$1-20151229";;
virtual/rubygems)                        echo "=$1-11";;
dev-ruby/activesupport)                  echo "=$1-3.2.22.1";;
dev-ruby/minitest)                       echo "=$1-5.8.4";;
dev-ruby/multi_json)                     echo "=$1-1.9.3";;
dev-ruby/net-scp)                        echo "=$1-1.2.1";;
dev-ruby/net-ssh)                        echo "=$1-2.9.2";;
dev-ruby/power_assert)                   echo "=$1-0.2.7";;
dev-ruby/test-unit)                      echo "=$1-3.1.7";;
dev-ruby/json) echo "=$1-1.8.3";;
dev-ruby/rake) echo "=$1-10.5.0";;

# java
dev-java/oracle-jdk-bin)                 echo "=$1-1.8.0.47";;
virtual/jdk)                             echo "=$1-1.8.0-r1";;
virtual/jre)                             echo "=$1-1.8.0";;

# kernel
sys-kernel/gentoo-sources)               echo "=$1-4.4.2";;
sys-kernel/linux-headers)                echo "=$1-4.4";;

# vim
app-editors/vim)                         echo "=$1-7.4.1342";;
app-editors/vim-core)                    echo "=$1-7.4.1342";;

# postgres
dev-db/postgresql)                       echo "=$1-9.4.6"
                                         echo "=$1-9.5.1";;

dev-vcs/bzr)                             echo "=$1-2.6.0";;
virtual/jpeg)                            echo "=$1-0-r2";;
www-client/phantomjs)                    echo "=$1-2.0.0-r1";;
dev-libs/libgcrypt)                      echo "=$1-1.5.4-r101"
                                         echo "$1";;

*)                                       echo $1;;
esac
