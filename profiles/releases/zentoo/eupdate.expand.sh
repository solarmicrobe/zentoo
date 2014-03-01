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
sys-devel/autoconf)                      echo "=$1-2.13"
                                         echo "$1";;
sys-devel/automake)                      echo "=$1-1.11.6"
                                         echo "=$1-1.12.6"
                                         echo "$1";;

# python
dev-lang/python)                         echo "=$1-2.7.5-r3";;
dev-lang/python-exec)                    echo "=$1-0.3.1"
                                         echo "=$1-2.0.1";;
dev-python/python-exec)                  echo "=$1-10000.1"
                                         echo "=$1-10000.2";;
dev-python/gdata)                        echo "=$1-2.0.18";;
dev-python/pychart)                      echo "=$1-1.39-r1";;
dev-python/python-ldap)                  echo "=$1-2.4.10-r1";;
dev-python/python-openid)                echo "=$1-2.2.5-r1";;
dev-python/pyyaml)                       echo "=$1-3.10-r1";;
dev-python/suds)                         echo "=$1-0.4-r1";;

# ruby
dev-lang/ruby)                           echo "=$1-1.9.3_p484"
                                         echo "=$1-2.0.0_p353";;
dev-ruby/activesupport)                  echo "=$1-3.2.16";;
dev-ruby/bson)                           echo "=$1-1.6.2-r1";;
dev-ruby/diff-lcs)                       echo "=$1-1.2.5";;
dev-ruby/eventmachine)                   echo "=$1-1.0.3-r1";;
dev-ruby/net-scp)                        echo "=$1-1.1.2-r1";;
dev-ruby/net-ssh)                        echo "=$1-2.7.0-r1";;
dev-ruby/net-ssh-multi)                  echo "=$1-1.1";;
dev-ruby/rubygems)                       echo "=$1-1.8.25"
                                         echo "$1";;
virtual/rubygems)                        echo "=$1-4"
                                         echo "=$1-6";;
virtual/ruby-ssl)                        echo "=$1-1"
                                         echo "=$1-3";;
virtual/ruby-threads)                    echo "=$1-1"
                                         echo "=$1-4";;

# php
dev-lang/php)                            echo "=$1-5.3.28-r1"
                                         echo "=$1-5.4.23";;
virtual/httpd-php)                       echo "=$1-5.3"
                                         echo "=$1-5.4-r1";;

# kernel
sys-kernel/gentoo-sources)               echo "=$1-3.10.32";;
sys-kernel/linux-headers)                echo "=$1-3.10";;

# virtualbox
app-emulation/virtualbox*)               echo "=$1-4.3.6";;
dev-util/kbuild)                         echo "=$1-0.1.9998_pre20131130";;

# just because we support firefox for headless testing
x11-libs/gtk+)                           echo "=$1-2.24.17";;

# multilib
virtual/libiconv)                        echo "=$1-0-r1";;
virtual/libffi)                          echo "=$1-3.0.13-r1";;
dev-libs/libffi)                         echo "=$1-3.0.13-r1";;
sys-apps/attr)                           echo "=$1-2.4.47-r1";;
media-libs/freetype)                     echo "=$1-2.4.12";;
app-arch/bzip2)                          echo "=$1-1.0.6-r6";;

app-editors/vim*)                        echo "=$1-7.4.155";;
dev-db/postgresql-*)                     echo "=$1-9.1.11";;
dev-util/systemtap)                      echo "=$1-2.4";;
sys-devel/bc)                            echo "=$1-1.06.95-r1";;
sys-libs/openipmi)                       echo "=$1-2.0.18";;
virtual/jdk)                             echo "=$1-1.7.0";;
virtual/jre)                             echo "=$1-1.7.0";;
virtual/jpeg)                            echo "=$1-0-r2";;
sys-fs/ncdu)                             echo "=$1-1.10";;
*)                                       echo $1;;
esac
