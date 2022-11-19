vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO xxsds/DYNAMIC
    REF 548c6f702b4be0f10ae43b135418a53dfb1c9212
    SHA512 8f5329e97b7c425db85196d06ba48ec6b1c70e43c686dd5e2972b00241e4e6ba885f751cf116f05516237bab954e71d573317b67bfd2166007abd136de47224d
    HEAD_REF master
    PATCHES
        00-fix-cmake-install.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/dynamic" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
