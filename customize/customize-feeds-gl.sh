cd /workdir
mkdir -p /workdir/openwrt/package/lean

# Add luci-app-ssr-plus to GL-inet openwrt
cd /workdir/openwrt/package/lean
git clone --depth=1 https://github.com/fw876/helloworld

# Copy Lean 中的 Packages 到 GL-inet OpenWrt 中
cd /workdir/lede/package/lean
plist_lean="\
    pdnsd-alt \
    microsocks \
    dns2socks \
    simple-obfs \
    luci-app-v2ray-server \
    trojan \
    pt2socks \
    redsocks2"
for dir in $plist
do
    if [ -d $dir ]
    then
        echo "Copying plugin $dir to /workdir/openwrt/package/lean ..."
        cp -rp $dir /workdir/openwrt/package/lean/
    else
        echo "Warning! ! ! - $dir does not exists..."
    fi
done

cd /workdir/openwrt
# 如果 lede 的 feeds/packages 存在 shadowsocks-libev
if [ -d /workdir/lede/feeds/packages/net/shadowsocks-libev ]
then
    # 如果 GL-inet 的 feeds/gli_pub 中存在 shadowsocks-libev， 则重命名进行备份
    echo "Backup GL-inet feeds/gli_pub/shadowsocks-libev"
    [ -d /workdir/openwrt/feeds/gli_pub/shadowsocks-libev ] && mv /workdir/openwrt/feeds/gli_pub/shadowsocks-libev /workdir/openwrt/feeds/gli_pub/shadowsocks-libev.bak

    # 如果 GL-inet 的 feeds/packages/net 中存在 shadowsocks-libev， 则重命名进行备份
    echo "Backup GL-inet feeds/packages/net/shadowsocks-libev"
    [ -d /workdir/openwrt/feeds/packages/net/shadowsocks-libev ] && mv /workdir/openwrt/feeds/packages/net/shadowsocks-libev /workdir/openwrt/feeds/packages/net/shadowsocks-libev.bak

    # 如果 GL-inet 存在 feeds/gli_pub 目录，则将 Lede 的 shadowsocks-libev 拷贝其中
    echo "Copy Lede feeds/packages/net/shaodowsocks-libev To GL-inet feeds/gli_pub/"
    [ -d /workdir/openwrt/feeds/gli_pub ] && cp -r /workdir/lede/feeds/packages/net/shadowsocks-libev /workdir/openwrt/feeds/gli_pub/shadowsocks-libev

    # 如果 GL-inet 存在 feeds/packages/net 目录，则将 Lede 的 shadowsocks-libev 拷贝其中
    echo "Copy Lede feeds/packages/net/shaodowsocks-libev To GL-inet feeds/packages/net"
    [ -d /workdir/openwrt/feeds/packages/net ] && cp -r /workdir/lede/feeds/packages/net/shadowsocks-libev /workdir/openwrt/feeds/packages/net/shadowsocks-libev

    # 如果 GL-inet packages 中存在 helloworld 目录，则将 Lede 的 feeds/packages/net/shadowsocks-libev 拷贝其中
    echo "Copy Lede feeds/packages/net/shaodowsocks-libev To GL-inet package/lean/helloworld"
    [ -d /workdir/openwrt/package/lean/helloworld ] && cp -r /workdir/lede/feeds/packages/net/shadowsocks-libev /workdir/openwrt/package/lean/helloworld/
fi

echo "Remove GL-inet feeds/packages/net/wget"
rm -rf /workdir/openwrt/feeds/packages/net/wget
echo "Copy Lean feeds/packages/net/wget To GL-inet feeds/packages/net/wget & package/lean/wget"
cp -rp /workdir/lede/feeds/packages/net/wget /workdir/openwrt/feeds/packages/net/wget
cp -rp /workdir/lede/feeds/packages/net/wget /workdir/openwrt/package/lean/wget

# 以下为添加的自定义 Packages
mkdir package/community
cd /workdir/openwrt/package/community
echo "Begin Add Community Packages ..."

# Add Lienol's Packages
#git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add 微信推送插件
echo "Add Serverchan plugin"
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# # Add PassWall 插件
# echo "Add Passwall plugin"
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add SmartDNS 插件
echo "Add SmartDNS plugin"
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns
git clone --depth=1 -b master https://github.com/pymumu/luci-app-smartdns

# Add 自动关机插件
echo "Add AutoPowerOff plugin"
git clone --depth=1 https://github.com/sirpdboy/luci-app-autopoweroff

# Add Zerotier 内网穿透插件
echo "Add Zerotier plugin"
cp -r /workdir/lede/package/lean/luci-app-zerotier ./

# Add adbyby
echo "Add Adbyby plugin"
cp -r /workdir/lede/package/lean/adbyby ./
cp -r /workdir/lede/package/lean/luci-app-adbyby-plus ./

# Add openclash
# echo "Add OpenClash Plugin"
# git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add argon theme
echo "Add Argon theme"
git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon

# Add Edge theme
echo "Add Edge theme"
git clone --depth=1 -b master https://github.com/garypang13/luci-theme-edge