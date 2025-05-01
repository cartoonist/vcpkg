vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO xxsds/DYNAMIC
    REF 0540076fcffb642c2a5d485b077cc1e4f7eb92de
    SHA512 23cadf7adfeca6a74a6922a1fc60a505bf6a49f057c1c0d842e597db3aed32ddef7664d6ccfc21dc750755b9210a22bae2053d53eac7f84abaa86261c6dbfc01
    HEAD_REF master
    PATCHES
        00-fix-cmake-install.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/dynamic" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
