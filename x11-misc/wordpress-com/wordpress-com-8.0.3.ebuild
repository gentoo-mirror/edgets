# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# File was automatically generated by automatic-ebuild-maker
# https://github.com/BlueManCZ/automatic-ebuild-maker

EAPI=7
inherit unpacker xdg

DESCRIPTION="WordPress.com Desktop Client"
HOMEPAGE="https://desktop.wordpress.com/"
SRC_URI="https://github.com/Automattic/wp-desktop/releases/download/v${PV}/wordpress.com-linux-deb-${PV}.deb -> ${P}.deb"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="bindist mirror"
IUSE="doc libnotify"

RDEPEND="dev-libs/nss
	x11-libs/libXtst
	libnotify? ( x11-libs/libnotify )"

QA_PREBUILT="*"

S=${WORKDIR}

src_prepare() {
	default

	if use doc ; then
		unpack "usr/share/doc/wordpress.com/changelog.gz" || die "unpack failed"
		rm -f "usr/share/doc/wordpress.com/changelog.gz" || die "rm failed"
		mv "changelog" "usr/share/doc/wordpress.com" || die "mv failed"
	fi

	sed -i "/^StartupWMClass=/{h;s/=.*/=wordpressdesktop/}" "usr/share/applications/wpcom.desktop" || die "sed failed"
}

src_install() {
	cp -a . "${ED}" || die "cp failed"

	rm -r "${ED}/usr/share/doc/wordpress.com" || die "rm failed"

	if use doc ; then
		dodoc -r "usr/share/doc/wordpress.com/"* || die "dodoc failed"
	fi

	dosym "/opt/WordPress.com/wpcom" "/usr/bin/wordpress.com" || die "dosym failed"
}