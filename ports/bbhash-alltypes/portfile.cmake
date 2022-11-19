vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO rizkg/BBHash
    REF c3250ae1ed70e8656b5f497b1fd63c82b6fb2dc6
    SHA512 a13da64692e46c9dec7ff822f44b6cc917cdbd3e23941074e56b2601ff192ce3460f825d17956df1c24588b784861e5afb2092ccab87add7193347b14c0b7b2d
    HEAD_REF alltypes
    PATCHES
        00-add-cmake-install.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/bbhash-alltypes" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
