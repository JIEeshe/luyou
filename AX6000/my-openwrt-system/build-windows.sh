#!/bin/bash

# 检查是否在WSL环境中
if ! grep -q Microsoft /proc/version; then
    echo "请在WSL环境中运行此脚本"
    exit 1
fi

# 设置编译环境
export FORCE_UNSAFE_CONFIGURE=1

# 启动编译
./scripts/build.sh 