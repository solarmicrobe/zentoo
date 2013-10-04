# Zentoo Linux

Zentoo Linux is a variant of [Gentoo Linux](http://www.gentoo.org) with an
emphasis on server deployment on x86_64 platforms.

Just like Gentoo Linux it is a source based Linux distribution with a live
package tree. Zentoo Linux is at the same time more conservative and more
bleeding-edge. Package updates tend to happen in batches that are known to work
and are supported by [ZenOps Chef](https://github.com/zenops/chef). Still
package versions tend to be more up-to-date and new server-related packages
have been added to the tree.

## master vs. next

Zentoo does not have a distinction between stable and unstable packages. All
packages in the tree are always installable (stable).

Instead Zentoo uses two branches: master and next.

The master branch contains the current supported version of Zentoo. The next
branch is used to develop the next supported version of Zentoo.

## Usage

Zentoo provides stages and images that can be used in the same way as Gentoo.
You can simply follow the [Gentoo Handbook](http://www.gentoo.org/doc/en/handbook/handbook-amd64.xml)
or you can use tools like [Quickstart](https://github.com/zentoo/quickstart) to
bootstrap your servers.

## Download

Download Zentoo from the following locations:

* [master](http://mirror.zenops.net/zentoo/amd64)
* [next](http://mirror.zenops.net/zentoo-next/amd64)

The Zentoo rsync and distfiles mirrors are:

* `SYNC="rsync://mirror.zenops.net/zentoo-portage" and SYNC="rsync://mirror.zenops.net/zentoo-portage-next"`
* `GENTOO_MIRRORS="http://mirror.zenops.net/zentoo"`

## Contributing

tbd
