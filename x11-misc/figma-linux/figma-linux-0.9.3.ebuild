# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# File was automatically generated by automatic-ebuild-maker
# https://github.com/BlueManCZ/automatic-ebuild-maker

EAPI=7
inherit unpacker xdg

DESCRIPTION="Unofficial desktop application for linux"
HOMEPAGE="https://github.com/ChugunovRoman/figma-linux"
SRC_URI="amd64? ( https://github.com/Figma-Linux/figma-linux/releases/download/v${PV}/figma-linux_${PV}_linux_amd64.deb -> ${P}-amd64.deb )
	arm64? ( https://github.com/Figma-Linux/figma-linux/releases/download/v${PV}/figma-linux_${PV}_linux_arm64.deb -> ${P}-arm64.deb )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="bindist mirror"
IUSE="appindicator doc libnotify system-ffmpeg"

RDEPEND="app-accessibility/at-spi2-core
	app-crypt/libsecret
	dev-libs/expat
	dev-libs/libbsd
	dev-libs/nss
	media-libs/freetype
	media-libs/libpng
	sys-apps/dbus
	sys-apps/keyutils
	sys-apps/util-linux
	|| ( >=sys-fs/e2fsprogs-1.46.5 sys-libs/e2fsprogs-libs )
	sys-libs/glibc
	sys-libs/zlib
	x11-libs/gtk+:3
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-misc/xdg-utils
	appindicator? ( dev-libs/libappindicator )
	libnotify? ( x11-libs/libnotify )
	system-ffmpeg? ( media-video/ffmpeg[chromium] )"

QA_PREBUILT="*"

S=${WORKDIR}

src_prepare() {
	default

	if use doc ; then
		unpack "usr/share/doc/figma-linux/changelog.gz" || die "unpack failed"
		rm -f "usr/share/doc/figma-linux/changelog.gz" || die "rm failed"
		mv "changelog" "usr/share/doc/figma-linux" || die "mv failed"
	fi

	if use system-ffmpeg ; then
		rm -f  "opt/figma-linux/libffmpeg.so" || die "rm failed"
	fi

	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libbsd.so.0" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libbsd.so.0.8.7" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libcom_err.so.2" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libcom_err.so.2.1" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libdbus-1.so.3" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libdbus-1.so.3.19.4" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libexpat.so.1" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libexpat.so.1.6.7" || die "rm failed"
	rm -rf "opt/figma-linux/libfreetype.so.6" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libkeyutils.so.1" || die "rm failed"
	rm -rf "opt/figma-linux/lib/x86_64-linux-gnu/libkeyutils.so.1.5" || die "rm failed"
	rm -rf "opt/figma-linux/libm.so.6" || die "rm failed"
	rm -rf "opt/figma-linux/libpng16.so.16" || die "rm failed"
	rm -rf "opt/figma-linux/libz.so.1" || die "rm failed"
}

src_install() {
	cp -a . "${ED}" || die "cp failed"

	rm -r "${ED}/usr/share/doc/figma-linux" || die "rm failed"

	if use doc ; then
		dodoc -r "usr/share/doc/figma-linux/"* || die "dodoc failed"
	fi

	if use system-ffmpeg ; then
		dosym "/usr/"$(get_libdir)"/chromium/libffmpeg.so" "/opt/figma-linux/libffmpeg.so" || die "dosym failed"
	fi

	dosym "/opt/figma-linux/figma-linux" "/usr/bin/figma-linux" || die "dosym failed"
}
