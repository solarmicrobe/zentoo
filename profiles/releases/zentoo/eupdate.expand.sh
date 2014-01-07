#!/bin/bash

case $1 in
app-arch/xz-utils)                       echo "=$1-5.0.5-r1";;
app-editors/vim*)                        echo "=$1-7.4.131";;
app-emulation/vagrant)                   echo "=$1-1.3.5";;
app-emulation/virtualbox*)               echo "=$1-4.3.2";;
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
app-text/openjade)                       echo "=$1-1.3.2-r5";;
dev-db/hsqldb)                           echo "=$1-1.8.1.3-r1";;
dev-db/postgresql-*)                     echo "=$1-9.1.9";;
dev-java/antlr)                          echo "=$1-2.7.7-r2";;
dev-java/asm)                            echo "=$1-2.0-r1";;
dev-java/junit)                          echo "=$1-3.8.2-r1";;
dev-java/jzlib)                          echo "=$1-1.0.7-r1";;
dev-java/tomcat-servlet-api)             echo "=$1-4.1.36"
                                         echo "=$1-6.0.36";;
dev-java/xml-commons-external)           echo "=$1-1.3.04"
                                         echo "=$1-1.4.01";;
dev-lang/R)                              echo "=$1-2.15.3";;
dev-lang/php)                            echo "=$1-5.3.27"
                                         echo "=$1-5.4.17";;
dev-lang/python)                         echo "=$1-2.7.5-r2";;
dev-lang/ruby)                           echo "=$1-1.9.3_p448"
                                         echo "=$1-2.0.0_p247";;
dev-lang/v8)                             echo "=$1-3.18.5.14";;
dev-libs/openssl)                        echo "=$1-0.9.8x"
                                         echo "$1";;
dev-libs/boost)                          echo "=$1-1.52.0-r6";;
dev-libs/libnl)                          echo "=$1-1.1.4"
                                         echo "=$1-3.2.22";;
dev-python/Babel)                        echo "=$1-0.9.6-r1";;
dev-python/beaker)                       echo "=$1-1.6.4-r1";;
dev-python/cython)                       echo "=$1-0.18-r1";;
dev-python/feedparser)                   echo "=$1-5.1.3-r1";;
dev-python/gdata)                        echo "=$1-2.0.18";;
dev-python/mako)                         echo "=$1-0.7.3-r1";;
dev-python/pyasn1)                       echo "=$1-0.1.6";;
dev-python/pyopenssl)                    echo "=$1-0.13-r1";;
dev-python/python-dateutil)              echo "=$1-2.1-r1";;
dev-python/python-ldap)                  echo "=$1-2.4.10-r1";;
dev-python/python-openid)                echo "=$1-2.2.5-r1";;
dev-python/pytz)                         echo "=$1-2012j";;
dev-python/pywebdav)                     echo "=$1-0.9.8";;
dev-python/pyyaml)                       echo "=$1-3.10-r1";;
dev-python/reportlab)                    echo "=$1-2.6";;
dev-python/six)                          echo "=$1-1.2.0-r1";;
dev-python/unittest2)                    echo "=$1-0.5.1-r1";;
dev-python/werkzeug)                     echo "=$1-0.9.1";;
dev-python/xlwt)                         echo "=$1-0.7.4-r1";;
dev-ruby/activesupport)                  echo "=$1-3.2.13";;
dev-ruby/amqp)                           echo "=$1-0.6.7-r1";;
dev-ruby/builder)                        echo "=$1-3.0.4";;
dev-ruby/diff-lcs)                       echo "=$1-1.2.5";;
dev-ruby/eventmachine)                   echo "=$1-1.0.0";;
dev-ruby/ffi)                            echo "=$1-1.4.0";;
dev-ruby/i18n)                           echo "=$1-0.6.4";;
dev-ruby/json)                           echo "=$1-1.8.0";;
dev-ruby/mysql-ruby)                     echo "=$1-2.9.0-r1";;
dev-ruby/net-scp)                        echo "=$1-1.1.0";;
dev-ruby/net-ssh)                        echo "=$1-2.6.7";;
dev-ruby/net-ssh-multi)                  echo "=$1-1.1";;
dev-ruby/ohai)                           echo "=$1-0.6.12";;
dev-ruby/racc)                           echo "=$1-1.4.9";;
dev-ruby/rake)                           echo "=$1-0.9.6";;
dev-ruby/rdoc)                           echo "=$1-4.0.1-r1";;
dev-ruby/rubygems)                       echo "=$1-1.8.25"
                                         echo "=$1-2.0.3";;
dev-ruby/tilt)                           echo "=$1-1.4.1";;
dev-util/boost-build)                    echo "=$1-1.52.0-r1";;
dev-util/systemtap)                      echo "=$1-2.2";;
java-virtuals/servlet-api)               echo "=$1-2.3"
                                         echo "=$1-2.5-r1";;
media-gfx/pydot)                         echo "=$1-1.0.28-r1";;
net-dns/openresolv)                      echo "=$1-3.5.4-r3";;
net-libs/zeromq)                         echo "=$1-3.2.3";;
net-misc/dhcp)                           echo "=$1-4.2.4_p2-r1";;
net-misc/dhcpcd)                         echo "=$1-6.0.3";;
net-nds/openldap)                        echo "=$1-2.4.33-r1";;
sys-apps/openrc)                         echo "=$1-0.12";;
sys-apps/systemd)                        echo "=$1-201";;
sys-apps/watchdog)                       echo "=$1-5.13-r1";;
sys-boot/grub)                           echo "=$1-2.00-r1";;
sys-devel/autoconf)                      echo "=$1-2.13"
                                         echo "$1";;
sys-devel/automake)                      echo "=$1-1.11.6"
                                         echo "$1";;
sys-devel/bc)                            echo "=$1-1.06.95-r1";;
sys-firmware/seabios)                    echo "=$1-1.7.2.1";;
sys-fs/mdadm)                            echo "=$1-3.2.6-r1";;
sys-kernel/dracut)                       echo "=$1-031-r1";;
sys-kernel/gentoo-sources)               echo "=$1-3.10.17";;
sys-libs/openipmi)                       echo "=$1-2.0.18";;
virtual/httpd-php)                       echo "=$1-5.3"
                                         echo "=$1-5.4-r1";;
virtual/jdk)                             echo "=$1-1.7.0";;
virtual/jre)                             echo "=$1-1.7.0";;
virtual/perl-Attribute-Handlers)         echo "=$1-0.930.0-r1";;
virtual/perl-digest-base)                echo "=$1-1.160.0-r1";;
virtual/perl-ExtUtils-CBuilder)          echo "=$1-0.280.205";;
virtual/pyparsing)                       echo "=$1-3";;
virtual/ruby-*)                          echo "=$1-1";;
virtual/rubygems)                        echo "=$1-4"
                                         echo "=$1-6";;
www-servers/nginx)                       echo "=$1-1.4.1-r5";;
x11-libs/gtk+)                           echo "=$1-2.24.17";;
*)                                       echo $1;;
esac
