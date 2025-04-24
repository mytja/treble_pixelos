$(call inherit-product, device/mytja/pixelos/device.mk)

PRODUCT_NAME := pixelos_arm64_bgN_erofs

GSI_FILE_SYSTEM_TYPE := erofs
BOARD_EROFS_COMPRESSOR := lz4hc,9
TARGET_PRODUCT_PROP += device/phh/treble/product.prop
