vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/libhandlegraph
    REF e477f4d3910e82f5fd07a6571095eecd26963023
    SHA512 cc93a9293a667507e5fa87902016291cb11d4e4fe35cbc32c93dcd1efc1ea6d57378dd42d3c0aa25997175b4c37143a0dde11842fa50ebd629ecb764937e0dac
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
