$(call inherit-product, device/mytja/pixelos/device.mk)

PRODUCT_NAME := pixelos_arm64_bgN_ext4

PRODUCT_EXTRA_VNDK_VERSIONS += 28 29
BOARD_EXT4_SHARE_DUP_BLOCKS := true