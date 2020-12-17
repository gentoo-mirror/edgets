# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake-utils git-r3 xdg-utils

PLUGINS_HASH="792f30b3ef1d17ed351b56ec345c828e2f2c0a4a"
PYBIND11_VERSION="2.6.1"

DESCRIPTION="A fast and flexible keyboard launcher"
HOMEPAGE="https://albertlauncher.github.io/"

EGIT_REPO_URI="https://github.com/albertlauncher/albert"

LICENSE="GPL-3+"
SLOT="0"
IUSE="debug"

RDEPEND="
	dev-cpp/muParser
	dev-qt/qtcharts:5
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsql:5[sqlite]
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	sci-libs/libqalculate
	x11-libs/libX11
	x11-libs/libXext
"
DEPEND="${RDEPEND}"

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_DEBUG=$(usex debug)
	)

	cmake-utils_src_configure
}

pkg_postinst() {
  xdg_desktop_database_update
  xdg_icon_cache_update
}

pkg_postrm() {
  xdg_desktop_database_update
}
