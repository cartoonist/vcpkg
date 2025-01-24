vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/sdsl-lite
    REF ef23c5fe9899f2b0afa53a32162ed0b06aff0e89
    SHA512 b1c67eda5f784006c0d372c7cb02a21d996b294770c102617af38ef964662a266b64e9fb7e91815efadc1e2dbec17bd1b615a57b2eaa2c9b3bebaee681c21173
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
