include $(TOPDIR)/rules.mk

PKG_NAME:=custom-package
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/custom-package
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Custom Package
  DEPENDS:=+libuci
endef

define Package/custom-package/description
  This is a custom package for my OpenWrt system.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/custom-package/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/custom-package.config $(1)/etc/config/custom-package
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/custom-package.init $(1)/etc/init.d/custom-package
endef

$(eval $(call BuildPackage,custom-package)) 