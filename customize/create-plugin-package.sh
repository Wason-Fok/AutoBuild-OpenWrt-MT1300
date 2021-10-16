cd openwrt/bin/targets/*/*
mkdir plugin

# plugin list in ../../../packages/mipsel_24kc
pkglist="\
    gli_pub/shadowsocks-libev-ss-*.ipk \
    base/shadowsocks-rust-*.ipk \
    base/shadowsocksr-libev-*.ipk \
    base/dns2socks_*.ipk \
    base/ipt2socks_*.ipk \
    packages/kcptun-*.ipk \
    base/microsocks_*.ipk \
    base/naiveproxy_*.ipk \
    base/pdnsd-alt_*.ipk \
    base/redsocks2_*.ipk \
    base/simple-obfs*.ipk \
    base/tcping_*.ipk \
    base/trojan*.ipk \
    base/v2ray-plugin_*.ipk \
    base/xray-core_*.ipk \
    base/luci-*-ssr-plus*.ipk \
    base/luci-*-ssrserver*.ipk \
    base/luci-*-serverchan*.ipk \
    base/luci-*-autotimeset*.ipk \
    base/luci-*-UUGameAcc*.ipk \
    base/luci-*-bearDropper*.ipk \
    base/ddnsto_*.ipk \
    base/luci-*-ddnsto*.ipk \
    base/luci-*-zerotier*.ipk \
    base/adbyby_*.ipk \
    base/luci-*-adbyby-plus*.ipk \
    base/luci-*-autoreboot*.ipk \
    base/luci-*-ramfree*.ipk \
    base/luci-*-webadmin*.ipk \
    base/parted_*.ipk \
    base/luci-*-diskman*.ipk \
    base/luci-lib-fs_*.ipk \
    base/luci-*-filetransfer*.ipk \
    base/UnblockNeteaseMusic-Go_*.ipk \
    base/luci-*-unblockmusic*.ipk \
    base/vlmcsd_*.ipk \
    base/luci-*-vlmcsd*.ipk \
    base/luci-*-arpbind*.ipk \
    base/dnsproxy_*.ipk \
    base/dnsforwarder_*.ipk \
    base/luci-*-turboacc*.ipk \
    packages/netdata_*.ipk \
    base/luci-*-netdata*.ipk \
    base/luci-theme-argon_*.ipk \
    base/luci-*-argon-config*.ipk"

for pkg in $pkglist
do
    file=../../../packages/mipsel_24kc/$pkg
    ls=`ls $file 2>/dev/null`
    if [ -z $ls ]
    then
        echo "Warning ! ! ! - $pkg does not exists."
    else
        echo "Copying $pkg to plugin folder..."
        cp -f $file ./plugin/
    fi
done

#
#   SSR Plus
#

echo "Creating installation script for ssr plus"
cat << EOF > ./plugin/install-ssrp.sh
opkg update
opkg install luci luci-i18n-base-zh-cn luci-i18n-opkg-zh-cn ttyd luci-app-ttyd luci-i18n-ttyd-zh-cn luci-compat luci-lib-ipkg wget htop
opkg install ./shadowsocks-libev-ss-local_*.ipk
opkg install ./shadowsocks-libev-ss-redir_*.ipk
opkg install ./shadowsocks-libev-ss-server_*.ipk
# opkg install ./shadowsocks-rust-sslocal_*.ipk
# opkg install ./shadowsocks-rust-ssserver_*.ipk
opkg install ./shadowsocksr-libev-ssr-check_*.ipk
opkg install ./shadowsocksr-libev-ssr-local_*.ipk
opkg install ./shadowsocksr-libev-ssr-redir_*.ipk
opkg install ./shadowsocksr-libev-ssr-server_*.ipk
opkg install ./dns2socks_*.ipk
opkg install ./ipt2socks_*.ipk
# opkg install ./kcptun-*.ipk
opkg install ./microsocks_*.ipk
# opkg install ./naiveproxy_*.ipk
opkg install ./pdnsd-alt_*.ipk
opkg install ./redsocks2_*.ipk
opkg install ./simple-obfs*.ipk
opkg install ./tcping_*.ipk
# opkg install ./trojan_*.ipk
opkg install ./v2ray-plugin_*.ipk
opkg install ./xray-core_*.ipk
opkg install ./luci-app-ssrserver-python_*.ipk
opkg install ./luci-app-ssr-plus_*.ipk
opkg install ./luci-i18n-ssr-plus-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-ssrp.sh

#
#   ServerChan 微信推送插件
#

echo "Creating installation script for Serverchan plugin"
cat << EOF > ./plugin/install-serverchan.sh
opkg update
opkg install ./luci-app-serverchan_*.ipk
opkg install ./luci-i18n-serverchan-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-serverchan.sh

#
#   Auto Timeset 计划关机重启
#

echo "Creating installation script for AutoTimeset plugin"
cat << EOF > ./plugin/install-autotimeset.sh
opkg update
opkg install ./luci-app-autotimeset_*.ipk
opkg install ./luci-i18n-autotimeset-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-autotimeset.sh

#
#   UUGameAcc 网易UU加速器插件
#

echo "Creating installation script for UUGameAcc plugin"
cat << EOF > ./plugin/install-UUGameAcc.sh
opkg update
opkg install ./luci-app-UUGameAcc_*.ipk
opkg install ./luci-i18n-UUGameAcc-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-UUGameAcc.sh

#
#   BearDropper SSH 防攻击插件
#
echo "Creating installation script for BearDropper plugin"
cat << EOF > ./plugin/install-bearDropper.sh
opkg update
opkg install ./luci-app-bearDroppe_*.ipk
opkg install ./luci-i18n-bearDropper-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-bearDropper.sh

#
#   DDNSTO
#
echo "Creating installation script for DDNSTO plugin"
cat << EOF > ./plugin/install-ddnsto.sh
opkg update
opkg install ./ddnsto_*.ipk
opkg install ./luci-app-ddnsto_*.ipk
opkg install ./luci-i18n-ddnsto-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-ddnsto.sh

#
#   Zerotier
#
echo "Creating installation script for Zerotier plugin"
cat << EOF > ./plugin/install-zerotier.sh
opkg update
opkg install ./luci-app-zerotier_*.ipk
opkg install ./luci-i18n-zerotier_*.ipk
EOF
chmod +x ./plugin/install-zerotier.sh

#
#   Adbyby
#

echo "Creating installation script for Adbyby Plus plugin"
cat << EOF > ./plugin/install-adbyby.sh
opkg update
opkg install ./adbyby_*.ipk
opkg install ./luci-app-adbyby-plus_*.ipk
opkg install ./luci-i18n-adbyby-plus_*.ipk
EOF
chmod +x ./plugin/install-adbyby.sh

#
#   AutoReboot 计划重启
#
echo "Creating installation script for AutoReboot plugin"
cat << EOF > ./plugin/install-autoreboot.sh
opkg update
opkg install ./luci-app-autoreboot_*.ipk
opkg install ./luci-i18n-autoreboot_*.ipk
EOF
chmod +x ./plugin/install-autoreboot.sh

#
#   RamFree 内存释放
#
echo "Creating installation script for RamFree plugin"
cat << EOF > ./plugin/install-ramfree.sh
opkg update
opkg install ./luci-app-ramfree_*.ipk
opkg install ./luci-i18n-ramfree_*.ipk
EOF
chmod +x ./plugin/install-ramfree.sh

#
#   WebAdmin
#
echo "Creating installation script for WebAdmin plugin"
cat << EOF > ./plugin/install-webadmin.sh
opkg update
opkg install ./luci-app-webadmin_*.ipk
opkg install ./luci-i18n-webadmin_*.ipk
EOF
chmod +x ./plugin/install-webadmin.sh

#
#   DiskManager 磁盘管理
#
echo "Creating installation script for DiskManager plugin"
cat << EOF > ./plugin/install-diskman.sh
opkg update
opkg install ./parted_*.ipk
opkg install ./luci-app-diskman_*.ipk
opkg install ./luci-i18n-diskman_*.ipk
EOF
chmod +x ./plugin/install-diskman.sh

#
#   FileTransfer
#
echo "Creating installation script for FileTransfer plugin"
cat << EOF > ./plugin/install-filetransfer.sh
opkg update
opkg install luci luci-i18n-base-zh-cn luci-i18n-opkg-zh-cn ttyd luci-app-ttyd luci-i18n-ttyd-zh-cn luci-compat luci-lib-ipkg wget htop
opkg install ./luci-lib-fs_*.ipk
opkg install ./luci-app-filetransfer_*.ipk
opkg install ./luci-i18n-filetransfer_*.ipk
EOF
chmod +x ./plugin/install-filetransfer.sh

#
#   UnblockNeteaseMusic plugin
#
echo "Creating installation script for NeteaseMusic plugin"
cat << EOF > ./plugin/install-neteaseMusic.sh
opkg update
opkg install ./UnblockNeteaseMusic-Go_*.ipk
opkg install ./luci-app-unblockmusic_*.ipk
opkg install ./luci-i18n-unblockmusic_*.ipk
EOF
chmod +x ./plugin/install-neteaseMusic.sh

#
#   KMS
#
echo "Creating installation script for KMS plugin"
cat << EOF > ./plugin/install-kms.sh
opkg update
opkg install ./vlmcsd_*.ipk
opkg install ./luci-app-vlmcsd_*.ipk
opkg install ./luci-i18n-vlmcsd_*.ipk
EOF
chmod +x ./plugin/install-kms.sh

#
#   ArpBind
#
echo "Creating installation script for ArpBind plugin"
cat << EOF > ./plugin/install-arpbind.sh
opkg update
opkg install ./luci-app-arpbind_*.ipk
opkg install ./luci-i18n-arpbind_*.ipk
EOF
chmod +x ./plugin/install-arpbind.sh

#
#   Turbo Acc
#
echo "Creating installation script for TurboAcc plugin"
cat << EOF > ./plugin/install-turboacc.sh
opkg update
opkg install ./dnsproxy_*.ipk
opkg install ./dnsforwarder_*.ipk
opkg install ./luci-app-turboacc_*.ipk
opkg install ./luci-i18n-turboacc_*.ipk
EOF
chmod +x ./plugin/install-turboacc.sh

#
#   NetData
#
echo "Creating installation script for NetData plugin"
cat << EOF > ./plugin/install-netdata.sh
opkg update
opkg install ./netdata_*.ipk
opkg install ./luci-app-netdata_*.ipk
opkg install ./luci-i18n-netdata_*.ipk
EOF
chmod +x ./plugin/install-netdata.sh

#
#   Argon Theme & Config
#
echo "Creating installation script for Argon Theme"
cat << EOF > ./plugin/install-argon.sh
opkg update
opkg install ./luci-theme-argon_*.ipk
opkg install ./luci-app-argon-config_*.ipk
opkg install ./luci-i18n-argon-config_*.ipk
EOF
chmod +x ./plugin/install-argon.sh

#
#   Finish
#

tar -czvf mt1300-plugin.tar.gz ./plugin && mv mt1300-plugin.tar.gz /workdir/
rm -rf ./plugin
