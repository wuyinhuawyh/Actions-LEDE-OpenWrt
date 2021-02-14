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

# 删除默认argon主题，并下载新argon主题
rm -rf ./package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./package/lean/luci-theme-argon/
#添加自定义插件链接（自己想要什么就github里面搜索然后添加）主题-edge-动态登陆界面
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge package/luci-theme-edge  
# 修改openwrt登陆地址,把下面的192.168.21修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
# Modify default host name
sed -i 's/OpenWrt/Kyara/g' package/base-files/files/bin/config_generate
# Modify default wireless name
sed -i 's/OpenWrt/Kyara/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#设置密码为空
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
