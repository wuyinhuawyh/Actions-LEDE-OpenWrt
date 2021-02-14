#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用源码自带ShadowSocksR Plus+出国软件

#Clone OpenAppFilter source code
#git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter

# Add a feed source增加默认源地址
sed -i '$a src-git wwz09 https://github.com/wwz09/wwz09-packages.git' feeds.conf.default
