vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/libhandlegraph
    REF 772d16374e6f46791378c3d9ba87445216b76a08
    SHA512 cccabe6faf8ae3e58290a38c4b3d81b6b648b3f29a773921181a071648843896dbd80f8215c2b0773badb4f99bf401358b5000698bdc54113233abdb51b496a4
    HEAD_REF master
    PATCHES
        00-fix-cmake-targets.patch
        01-add-cmake-config.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/libhandlegraph)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/libhandlegraph" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
