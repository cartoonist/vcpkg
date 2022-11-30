vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/samtools/htslib/releases/download/1.16/htslib-1.16.tar.bz2"
    FILENAME "htslib-1.16.tar.bz2"
    SHA512 9fa0b1f9bba50f889d4542825c9543fb3b34c13b4cc0e18940a66fafd130749574bfa2c2663d8b39f0b4ed2b298bf130367cda1b17b2929093d64b386730cbc5
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

vcpkg_configure_make(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_install_make()
#vcpkg_fixup_pkgconfig()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
