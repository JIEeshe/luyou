include $(TOPDIR)/rules.mk

PKG_NAME:=myrouter-web
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/myrouter-web
  SECTION:=net
  CATEGORY:=Network
  TITLE:=MyRouter Web Interface
  DEPENDS:=+luci +luci-base +uhttpd
endef

define Package/myrouter-web/description
  Web interface for MyRouter system
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Package/myrouter-web/install
	$(INSTALL_DIR) $(1)/www/myrouter
	$(CP) ./files/www/* $(1)/www/myrouter/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/myrouter
	$(CP) ./files/controller/* $(1)/usr/lib/lua/luci/controller/myrouter/
endef

$(eval $(call BuildPackage,myrouter-web)) 