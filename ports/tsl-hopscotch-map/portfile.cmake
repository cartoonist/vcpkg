vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Tessil/hopscotch-map
    REF 799f43600f9ca65a3045decbc7571b5522fa21b7
    SHA512 bcf65e05dc42019aef0be09a6c93ae05d55a958337561021106668fd9a05b577b6699ee3bf163f88d08f320b6993b776dac8a91b23f2fb92e330ab7cf9aabe81
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(INSTALL "${SOURCE_PATH}/LICENSE"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright
)
