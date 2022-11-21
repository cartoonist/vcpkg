vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO simongog/libdivsufsort
    REF 22e6b23e619ff50fd086844b6e618d53ca9d53bd
    SHA512 65a0ca66f641fddf9fd9d015d33ff7d34789a061d076b6e28efb0ba0879ab2ecc849a5c2b09173380a508e7e2b66fa695f1b49ef07203ec69fffc789a87cf5e5
    HEAD_REF master
    PATCHES
        00-fix-cmake.patch
        01-fix-cmake-lib.patch
        02-fix-pkgconfig-paths.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH}
	OPTIONS
		-DBUILD_DIVSUFSORT64=ON
		-DBUILD_EXAMPLES=OFF
	)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/libdivsufsort" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
