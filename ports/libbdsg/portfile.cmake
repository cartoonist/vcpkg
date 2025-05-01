vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/libbdsg
    REF dfe53fd2fb8fc9b748b8c24cfc3fb7fbc6e1ee32
    SHA512 8e061b4e4e0a44c011e653ec0cc4118787044df1ab1019699c58391ea34ce8f2d03366c83bfefc712548b6c17b137edb46ec0c7bb24b41fdefe5ed6a4dd9266e
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
