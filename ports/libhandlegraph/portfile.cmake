vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vgteam/libhandlegraph
    REF 0e70dadb5054568d8071e280b3b7b11b5658937f
    SHA512 f7e068749ce68c596020905392eb4b486458ba00f78ff3e233d2d037ed51afc54475419105743929f13198f6656cae571a68b348ae7e37abddf21b2bcc38158d
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
