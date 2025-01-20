#!/bin/bash

# 构建脚本
OPENWRT_DIR="openwrt"
BUILD_DIR="build"
FEEDS_CONF="feeds.conf.default"

# 设置编译环境
export FORCE_UNSAFE_CONFIGURE=1

# 修复Windows下的权限问题
fix_permissions() {
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    find . -name "*.sh" -type f -exec chmod +x {} \;
    find scripts -type f -exec chmod +x {} \;
}

# 克隆OpenWrt源码
if [ ! -d "$OPENWRT_DIR" ]; then
    git clone https://github.com/openwrt/openwrt.git
fi

# 复制feeds配置
cp $FEEDS_CONF $OPENWRT_DIR/feeds.conf

# 更新源码
cd $OPENWRT_DIR
git pull

# 修复权限
fix_permissions

./scripts/feeds update -a
./scripts/feeds install -a

# 添加自定义包
cp -r ../package/* package/
echo "CONFIG_PACKAGE_myrouter-web=y" >> .config

# 复制配置文件
cp ../config/.config .config

# 复制目标平台配置
cp -r ../target/* target/

# 设置make参数
MAKE_OPTS="-j$(($(nproc) + 1)) V=s"

# 开始编译
make defconfig
make download -j8
make $MAKE_OPTS 