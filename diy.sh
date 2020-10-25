#!/bin/bash
cd openwrt
rm -rf package/lean/luci-theme-argon
# 修改openwrt登陆地址,把下面的192.168.123.1修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

#取消掉feeds.conf.default文件里面的helloworld的#注释
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用源码自带ShadowSocksR Plus+出国软件

# Add a feed source增加默认源地址
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/K2P/g' ./package/base-files/files/bin/config_generate

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings 


#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan  #微信推送
git clone https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/luci-app-smartdns  #smartdns DNS加速
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/trojan-plus
rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #新的argon主题
