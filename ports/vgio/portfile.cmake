vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/libvgio
    REF 205b81751d46604aa6f9189d26c098b511c5e402
    SHA512 dc93cd01883de3ad0d6fb9bc48fc21960da8ca13092dc2e681625ffaf630df5336dab8a022a7933910355edd44db51414ae3cfd67d37a8e0b97a6522089bb023
    HEAD_REF master
    PATCHES
        00-link-handlegraph.patch
        01-fix-cmake-config.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/VGio)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vgio" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
