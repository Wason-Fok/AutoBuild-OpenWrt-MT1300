cd /workdir
mkdir -p /workdir/openwrt/package/lean

# Add luci-app-ssr-plus
cd /workdir/openwrt/package/lean
git clone --depth=1 https://github.com/fw876/helloworld

# Copy 指定插件到 GL-inet OpenWrt 中
cd /workdir/lede/package/lean
plist="shadowsocksr-libev pdnsd-alt microsocks dns2socks simple-obfs v2ray-plugin v2ray xray trojan ipt2socks redsocks2 kcptun luci-app-zerotier luci-app-serverchan adbyby luci-app-adbyby-plus"
for dir in $plist
do
    if [ -d $dir ]
    then
        echo "Copying plugin $dir to /workdir/openwrt/package/lean ..."
        cp -rp $dir /workdir/openwrt/package/lean/
    else
        echo "$dir does not exists..."
    fi
done

cd /workdir/openwrt

# 如果 lede 存在 shadowsocks-libev
if [ -d /workdir/lede/feeds/packages/net/shadowsocks-libev ]
then
    # 如果 GL-inet feeds/packages/net 中存在 shadowsocks-libev，则进行重命名
    [ -d /workdir/openwrt/feeds/packages/net/shadowsocks-libev ] && mv /workdir/openwrt/feeds/packages/net/shadowsocks-libev /workdir/openwrt/feeds/packages/net/shadowsocks-libev.bak
    # 如果 GL-inet feeds/gli_pub 中存在 shadowsocks-libev，则进行重命名
    [ -d /workdir/openwrt/feeds/gli_pub/shadowsocks-libev ] && mv /workdir/openwrt/feeds/gli_pub/shadowsocks-libev /workdir/openwrt/feeds/gli_pub/shadowsocks-libev.bak

    # 如果 GL-inet 包含 feeds/gli_pub 目录，则将 lede 中的复制过来
    [ -d /workdir/openwrt/feeds/gli_pub ] && cp -r /workdir/lede/feeds/packages/net/shadowsocks-libev /workdir/openwrt/feeds/gli_pub/shadowsocks-libev
    [ -d /workdir/openwrt/package/lean/helloworld ] && cp -r /workdir/lede/feeds/packages/net/shadowsocks-libev /workdir/openwrt/package/lean/helloworld/
    cp -r /workdir/lede/feeds/packages/net/shadowsocks-libev /workdir/openwrt/feeds/packages/net/shadowsocks-libev
fi

#rm -rf /workdir/openwrt/feeds/packages/net/wget
#cp -rp /workdir/lede/package/lean/wget /workdir/openwrt/feeds/packages/net/wget

# Clone community packages to lean
cd /workdir/openwrt/package/lean

# Add Lienol's Packages
#git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add argon theme
git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon ./luci-theme-argon/


# Add openclash
#cd /workdir/openwrt/package/community
#git clone --depth=1 -b master https://github.com/vernesong/OpenClash
#ARCH=mipsle-softfloat
#cd /workdir/openwrt
#mkdir -p files/etc/openclash/core
#cd files/etc/openclash/core

#clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
#clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
#clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')

#wget $clash_main_url && tar zxvf clash-linux-*.gz && rm -f clash-linux-*.gz
#wget -qO- $clash_main_url | gunzip -c > clash
#wget -qO- $clash_tun_url  | gunzip -c > clash_tun
#wget -qO- $clash_game_url | tar xOvz > clash_game

#chmod +x clash*

