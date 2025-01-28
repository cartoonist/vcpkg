vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/sdsl-lite
    REF cf1c355981d0ee91bdca4b1882f997863d0fda16
    SHA512 14612dcdb4045bcf98f1e05fa016f401eb83382c38d9018bde382e76f34d72f1f844257af9201b1e88ccdb14d28b9ca7dc3b6ff2fc514dbebbe57217555cf18a
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
