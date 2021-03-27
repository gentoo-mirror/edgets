# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson udev xdg

DESCRIPTION="Steering Wheel Manager for Linux"
HOMEPAGE="https://github.com/berarma/oversteer"

LICENSE="GPL-3"
RESTRICT="mirror"
SLOT="0"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="${HOMEPAGE}.git"
	inherit git-r3
else
	SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
fi

DEPEND="dev-python/python-evdev
	dev-python/pyudev
	virtual/libudev"

RDEPEND="${DEPEND}"

src_install() {
	meson_src_install

	udev_dorules "data/udev/99-logitech-wheel-perms.rules"
}
