# 系统基本配置
TARGET_BOARD := mediatek
SUBTARGET := mt7986
PROFILE := xiaomi_redmi-router-ax6000

# 包含目标平台配置
include $(TOPDIR)/target/$(TARGET_BOARD)/$(SUBTARGET)/config.mk

# 版本信息
VERSION := 1.0.0
BUILD_DATE := $(shell date +%Y%m%d)

# 编译选项
FEATURES := \
    DEFAULT_luci \
    DEFAULT_luci-app-firewall \
    DEFAULT_luci-app-opkg \
    PACKAGE_dnsmasq-full \
    PACKAGE_ipv6helper \
    PACKAGE_myrouter-web 