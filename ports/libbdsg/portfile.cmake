vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/libbdsg
    REF 704567184a3cfacfcb1d51e58be771b01c25ab15
    SHA512 2e916b30675943dbd72feb9be90b4ac965d2a2b02517d425d35a59d8b76ac4d8135de9d23ca16edf2406ee0f379fb6a19b3fac51a5b723e419c7c9d2bc680869
    HEAD_REF master
    PATCHES
        00-fix-cmake-deps.patch
	01-add-cmake-config.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/libbdsg)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/libbdsg" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
