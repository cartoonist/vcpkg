vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/sdsl-lite
    REF caa2e60f7dcc2c85578eb85a89b88b485462eee4
    SHA512 e0e9b023acb642f5960a44af21c1951e3f29bbe78a1603b89394116d8a33582d3f3beedae2eea897cf63692c9287508b241cb75d0f5c626cb41fac89363062b7
    HEAD_REF master
    PATCHES
        00-fix-cmake.patch
        01-fix-cmake-deps.patch
        02-fix-cmake-lib.patch
        03-fix-cmake-test.patch
)

vcpkg_cmake_configure(
	SOURCE_PATH ${SOURCE_PATH}
	DISABLE_PARALLEL_CONFIGURE) # Its build script generates some files in the source directory which cannot be parallelised
vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/sdsl-lite-vgteam" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
