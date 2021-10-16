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
    luci-app-ssrserver-python \
    trojan \
    ipt2socks \
    redsocks2"
for dir in $plist_lean
do
    if [ -d $dir ]
    then
        echo "Copying plugin $dir to /workdir/openwrt/package/lean ..."
        cp -rp $dir /workdir/openwrt/package/lean/
    else
        echo "Warning! ! ! - $dir does not exists..."
    fi
done

# if [ -d /workdir/lede/feeds/packages/net/kcptun ]
# then
#     echo "Copy Lede feeds/packages/net/kcptun To GL-inet feeds/packages/net/kcptun"
#     rm -rf /workdir/openwrt/feeds/packages/net/kcptun
#     cp -r /workdir/lede/feeds/packages/net/kcptun /workdir/openwrt/feeds/packages/net/
#     cp -r /workdir/lede/feeds/packages/net/kcptun /workdir/openwrt/package/lean/
# fi

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

#
# 其他插件部分
#

# Add 微信推送插件
echo "Add Serverchan plugin"
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add 自动关机插件
echo "Add AutoPowerOff plugin"
git clone --depth=1 https://github.com/sirpdboy/luci-app-autotimeset
ln -s ./luci-app-autotimeset/po/zh-cn ./luci-app-autotimeset/po/zh_Hans

# Add 网易UU加速器插件
echo "Add Netease UUGameAcc plugin"
git clone --depth=1 https://github.com/BCYDTZ/luci-app-UUGameAcc
ln -s ./luci-app-UUGameAcc/po/zh-cn ./luci-app-UUGameAcc/po/zh_Hans

# Add SSH 防攻击插件
echo "Add BearDropper plugin"
git clone --depth=1 https://github.com/NateLol/luci-app-bearDropper

# Add DDNSTO 插件
echo "Add DDNSTO plugin"
git clone --depth=1 -b master https://github.com/linkease/nas-packages
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci

mv nas-packages/network/services/ddnsto ./
mv nas-packages-luci/luci/luci-app-ddnsto ./
ln -s ./luci-app-ddnsto/po/zh-cn ./luci-app-ddnsto/po/zh_Hans

# Add DDNSTO易有云 plugin
echo "Add Linkease plugin"
mv nas-packages/network/services/linkease ./
mv nas-packages-luci/luci/luci-app-linkease ./
ln -s ./luci-app-linkease/po/zh-cn ./luci-app-linkease/po/zh_Hans

rm -rf nas-packages && rm -rf nas-packages-luci

#
# 主题部分
#

# Add argon theme
echo "Add Argon theme"
git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon

# Argon 主题设置插件
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
ln -s ./luci-app-argon-config/po/zh-cn ./luci-app-argon-config/po/zh_Hans

# Add Edge theme
echo "Add Edge theme"
git clone --depth=1 -b master https://github.com/garypang13/luci-theme-edge

#
# Lean Package 部分
#

# Add Zerotier 内网穿透插件
echo "Add Zerotier plugin"
cp -r /workdir/lede/package/lean/luci-app-zerotier /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-zerotier/po/zh-cn /workdir/openwrt/package/lean/luci-app-zerotier/po/zh_Hans

# Add 广告屏蔽大师Plus
echo "Add Adbyby plugin"
cp -r /workdir/lede/package/lean/adbyby /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/luci-app-adbyby-plus /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-adbyby-plus/po/zh-cn /workdir/openwrt/package/lean/luci-app-adbyby-plus/po/zh_Hans

# Add 计划重启插件
echo "Add AutoReboot plugin"
cp -r /workdir/lede/package/lean/luci-app-autoreboot /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-autoreboot/po/zh-cn /workdir/openwrt/package/lean/luci-app-autoreboot/po/zh_Hans


# Add 内存释放插件
echo "Add RamFree plugin"
cp -r /workdir/lede/package/lean/luci-app-ramfree /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-ramfree/po/zh-cn /workdir/openwrt/package/lean/luci-app-ramfree/po/zh_Hans


# Add Web 管理插件
echo "Add WebAdmin plugin"
cp -r /workdir/lede/package/lean/luci-app-webadmin /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-webadmin/po/zh-cn /workdir/openwrt/package/lean/luci-app-webadmin/po/zh_Hans

# Add 磁盘管理插件
echo "Add DiskManager plugin"
cp -r /workdir/lede/feeds/packages/utils/parted /workdir/openwrt/package/utils/
cp -r /workdir/lede/package/lean/luci-app-diskman /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-diskman/po/zh-cn /workdir/openwrt/package/lean/luci-app-diskman/po/zh_Hans

# Add 文件传输插件
echo "Add FileTransfer plugin"
cp -r /workdir/lede/package/lean/luci-lib-fs /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/luci-app-filetransfer /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-filetransfer/po/zh-cn /workdir/openwrt/package/lean/luci-app-filetransfer/po/zh_Hans

# Add 网易云音乐解锁插件
echo "Add NeteaseMusic plugin"
cp -r /workdir/lede/package/lean/UnblockNeteaseMusic /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/UnblockNeteaseMusic-Go /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/luci-app-unblockmusic /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-unblockmusic/po/zh-cn /workdir/openwrt/package/lean/luci-app-unblockmusic/po/zh_Hans

# Add KMS 激活服务器插件
echo "Add KMS plugin"
cp -r /workdir/lede/package/lean/vlmcsd /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/luci-app-vlmcsd /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-vlmcsd/po/zh-cn /workdir/openwrt/package/lean/luci-app-vlmcsd/po/zh_Hans

# Add IP/MAC 绑定
echo "Add ArpBind plugin"
cp -r /workdir/lede/package/lean/luci-app-arpbind /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-arpbind/po/zh-cn /workdir/openwrt/package/lean/luci-app-arpbind/po/zh_Hans

# Add Turbo ACC 网络加速
echo "Add TurboACC plugin"
# rm -rf /workdir/openwrt/feeds/packages/utils/kmod
# cp -r /workdir/lede/feeds/packages/utils/kmod /workdir/openwrt/feeds/packages/utils/
# cp -r /workdir/lede/feeds/packages/utils/kmod /workdir/openwrt/package/lean/

cp -r /workdir/lede/package/lean/shortcut-fe /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/dnsproxy /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/dnsforwarder /workdir/openwrt/package/lean/
cp -r /workdir/lede/package/lean/luci-app-turboacc /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-turboacc/po/zh-cn /workdir/openwrt/package/lean/luci-app-turboacc/po/zh_Hans

# Add NetData 图形化实时监控
echo "Add Netdata plugin"
rm -rf /workdir/openwrt/feeds/packages/admin/netdata
cp -r /workdir/lede/feeds/packages/admin/netdata /workdir/openwrt/feeds/packages/admin/
cp -r /workdir/lede/feeds/packages/admin/netdata /workdir/openwrt/package/lean/

cp -r /workdir/lede/package/lean/luci-app-netdata /workdir/openwrt/package/lean/
ln -s /workdir/openwrt/package/lean/luci-app-netdata/po/zh-cn /workdir/openwrt/package/lean/luci-app-netdata/po/zh_Hans