# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# File was automatically generated by automatic-ebuild-maker
# https://github.com/BlueManCZ/automatic-ebuild-maker

EAPI=7
inherit unpacker xdg

DESCRIPTION="Viber for Desktop."
HOMEPAGE="https://viber.com"
SRC_URI="http://webly3d.net/static/edgets-overlay/net-im/viber-bin/viber-bin-${PV}.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="bindist mirror"
IUSE="alsa pulseaudio"

RDEPEND="dev-libs/nss
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good
	media-libs/gst-plugins-ugly
	media-libs/gstreamer
	media-libs/libpng
	media-plugins/gst-plugins-libav
	x11-libs/libxcb
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )"

QA_PREBUILT="*"

PATCHES=(
	"${FILESDIR}/${PN}-desktop-file.patch"
)

S=${WORKDIR}

src_prepare() {
	default

	rm -rf "opt/viber/lib/libpng16.so.16" || die "rm failed"
}

src_install() {
	cp -a . "${ED}" || die "cp failed"

	dosym "/opt/viber/Viber" "/usr/bin/viber" || die "dosym failed"
}
