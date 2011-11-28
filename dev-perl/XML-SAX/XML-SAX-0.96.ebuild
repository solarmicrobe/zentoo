# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=GRANTM
inherit perl-module eutils

DESCRIPTION="Perl module for using and building Perl SAX2 XML parsers, filters, and drivers"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-perl/XML-NamespaceSupport-1.04
	>=dev-libs/libxml2-2.4.1
	dev-lang/perl"
RDEPEND="${DEPEND}"

SRC_TEST="do"

src_unpack() {
	local installvendorlib
	eval $(perl '-V:installvendorlib')
	unpack ${A}
	cd "${S}"
	sed -i \
		-e 's/if (\$write_ini_ok)/if (0 \&\& $write_ini_ok)/' \
		Makefile.PL || die
	epatch "${FILESDIR}"/encodings.patch
}

pkg_postinst() {
	perl-module_pkg_postinst
	pkg_update_parser add XML::SAX::PurePerl
}

pkg_update_parser() {
	# pkg_update_parser [add|remove] $parser_module
	local action=$1
	local parser_module=$2

	if [[ "$ROOT" = "/" ]] ; then
		einfo "Update Parser: $1 $2"
		perl -MXML::SAX -e "XML::SAX->${action}_parser(q(${parser_module}))->save_parsers()" \
			|| ewarn "Update Parser: $1 $2 failed"
	else
		elog "To $1 $2 run:"
		elog "perl -MXML::SAX -e 'XML::SAX->${action}_parser(q(${parser_module}))->save_parsers()'"
	fi
}
