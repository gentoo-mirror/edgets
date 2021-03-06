# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# File was automatically generated by automatic-ebuild-maker
# https://github.com/BlueManCZ/automatic-ebuild-maker

EAPI=7
inherit desktop unpacker xdg-utils

DESCRIPTION="The next generation music client"
HOMEPAGE="https://github.com/EragonJ/Kaku"
SRC_URI="amd64? ( https://github.com/EragonJ/Kaku/releases/download/${PV}/Kaku_${PV}_amd64.deb -> kaku-${PV}-amd64.deb )
	x86? ( https://github.com/EragonJ/Kaku/releases/download/${PV}/Kaku_${PV}_i386.deb -> kaku-${PV}-i386.deb )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="appindicator doc libnotify"

RDEPEND="dev-libs/nss
	gnome-base/gconf:2
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	appindicator? ( dev-libs/libappindicator )
	libnotify? ( x11-libs/libnotify )"

QA_PREBUILT="*"

S="${WORKDIR}"

src_prepare() {
	unpack "usr/share/doc/kaku/changelog.gz" || die "unpack failed"
	rm -f "usr/share/doc/kaku/changelog.gz" || die "rm failed"
	mv "changelog" "usr/share/doc/kaku" || die "mv failed"

	default
}

src_install() {
	cp -a . "${ED}" || die "cp failed"

	rm -r "${ED}/usr/share/doc/kaku" || die "rm failed"

	if use doc ; then
		dodoc -r "usr/share/doc/kaku" || die "dodoc failed"
	fi

	dosym "/opt/Kaku/kaku" "/usr/bin/kaku" || die "dosym failed"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
