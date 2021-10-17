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
    base/luci-*-v2ray-server*.ipk \
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
    base/luci-*-argon-config*.ipk \
    base/uugamebooster*.ipk \
    base/luci-*-uugamebooster*.ipk \
    base/luci-*-socat*.ipk"

for pkg in $pkglist
do
    file=../../../packages/mipsel_24kc/$pkg
    ls=`ls $file 2>/dev/null`
    if [[ -z $ls ]]
    then
        echo "Warning ! ! ! - $pkg does not exists."
    else
        echo "Copying $pkg to plugin folder..."
        cp -f $file ./plugin/
    fi
done

#
#   SSR Plus OK i18n OK
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
opkg install ./luci-app-ssr-plus_*.ipk
opkg install ./luci-i18n-ssr-plus-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-ssrp.sh

#
#   Openwrt 原生应用
#
echo "Creating installation script for Openwrt plugin"
cat << EOF > ./plugin/install-openwrtplugin.sh
opkg update
opkg install hd-idle luci-app-hd-idle luci-i18n-hd-idle-zh-cn luci-compat luci-i18n-firewall-zh-cn luci-i18n-opkg-zh-cn luci-app-upnp luci-i18n-upnp-zh-cn luci-app-wol luci-i18n-wol-zh-cn
EOF
chmod +x ./plugin/install-openwrtplugin.sh

#
#   SSR Server Python SSR 服务器插件
#
echo "Creating installation script for SSR Server Python plugin"
cat << EOF > ./plugin/install-ssrserver_python.sh
opkg update
opkg install ./luci-app-ssrserver-python_*.ipk
opkg install ./luci-i18n-ssrserver-python-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-ssrserver_python.sh

#
#   v2ray 服务端插件
#
echo "Creating installation script for V2Ray Server plugin"
cat << EOF > ./plugin/install-v2rayserver.sh
opkg update
opkg install ./luci-app-v2ray-server_*.ipk
opkg install ./luci-i18n-v2ray-server-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-v2rayserver.sh


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
#   UUGameAcc 网易 UU 加速器插件
#

echo "Creating installation script for UUGameAcc plugin"
cat << EOF > ./plugin/install-UUGameAcc.sh
opkg update
opkg install ./luci-app-UUGameAcc_*.ipk
opkg install ./luci-i18n-UUGameAcc-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-UUGameAcc.sh

#
#   BearDropper SSH 防攻击插件 OK i18n OK
#
echo "Creating installation script for BearDropper plugin"
cat << EOF > ./plugin/install-bearDropper.sh
opkg update
opkg install ./luci-app-bearDroppe_*.ipk
opkg install ./luci-i18n-bearDropper-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-bearDropper.sh

#
#   DDNSTO OK
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
#   Zerotier OK i18n OK
#
echo "Creating installation script for Zerotier plugin"
cat << EOF > ./plugin/install-zerotier.sh
opkg update
opkg install ./luci-app-zerotier_*.ipk
opkg install ./luci-i18n-zerotier-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-zerotier.sh

#
#   Adbyby OK i18n OK
#

echo "Creating installation script for Adbyby Plus plugin"
cat << EOF > ./plugin/install-adbyby.sh
opkg update
opkg install ./adbyby_*.ipk
opkg install ./luci-app-adbyby-plus_*.ipk
opkg install ./luci-i18n-adbyby-plus-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-adbyby.sh

#
#   AutoReboot 定时重启 OK i18n OK
#
echo "Creating installation script for AutoReboot plugin"
cat << EOF > ./plugin/install-autoreboot.sh
opkg update
opkg install ./luci-app-autoreboot_*.ipk
opkg install ./luci-i18n-autoreboot-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-autoreboot.sh

#
#   RamFree 内存释放 OK i18n OK
#
echo "Creating installation script for RamFree plugin"
cat << EOF > ./plugin/install-ramfree.sh
opkg update
opkg install ./luci-app-ramfree_*.ipk
opkg install ./luci-i18n-ramfree-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-ramfree.sh

#
#   WebAdmin Not used
#
echo "Creating installation script for WebAdmin plugin"
cat << EOF > ./plugin/install-webadmin.sh
opkg update
opkg install ./luci-app-webadmin_*.ipk
opkg install ./luci-i18n-webadmin-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-webadmin.sh

#
#   DiskManager 磁盘管理 OK i18n OK
#
echo "Creating installation script for DiskManager plugin"
cat << EOF > ./plugin/install-diskman.sh
opkg update
opkg install ./parted_*.ipk
opkg install ./luci-app-diskman_*.ipk
opkg install ./luci-i18n-diskman-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-diskman.sh

#
#   FileTransfer OK i18n OK
#
echo "Creating installation script for FileTransfer plugin"
cat << EOF > ./plugin/install-filetransfer.sh
opkg update
opkg install luci luci-i18n-base-zh-cn luci-i18n-opkg-zh-cn ttyd luci-app-ttyd luci-i18n-ttyd-zh-cn luci-compat luci-lib-ipkg wget htop
opkg install ./luci-lib-fs_*.ipk
opkg install ./luci-app-filetransfer_*.ipk
opkg install ./luci-i18n-filetransfer-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-filetransfer.sh

#
#   UnblockNeteaseMusic plugin OK i18n OK
#
echo "Creating installation script for NeteaseMusic plugin"
cat << EOF > ./plugin/install-neteaseMusic.sh
opkg update
opkg install ./UnblockNeteaseMusic-Go_*.ipk
opkg install ./luci-app-unblockmusic_*.ipk
opkg install ./luci-i18n-unblockmusic-zh-cn_*.ipk
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
opkg install ./luci-i18n-vlmcsd-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-kms.sh

#
#   ArpBind Not used
#
echo "Creating installation script for ArpBind plugin"
cat << EOF > ./plugin/install-arpbind.sh
opkg update
opkg install ./luci-app-arpbind_*.ipk
opkg install ./luci-i18n-arpbind-zh-cn_*.ipk
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
opkg install ./luci-i18n-turboacc-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-turboacc.sh

#
#   NetData OK i18n OK
#
echo "Creating installation script for NetData plugin"
cat << EOF > ./plugin/install-netdata.sh
opkg update
opkg install ./netdata_*.ipk
opkg install ./luci-app-netdata_*.ipk
opkg install ./luci-i18n-netdata-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-netdata.sh

#
#   Argon Theme & Config OK i18n OK
#
echo "Creating installation script for Argon Theme"
cat << EOF > ./plugin/install-argon.sh
# 安装完成后需要重启

opkg update
opkg install luci-compat
wget --no-check-certificate https://github.com/jerrykuku/luci-theme-argon/releases/download/v2.2.5/luci-theme-argon_2.2.5-20200914_all.ipk
opkg install luci-theme-argon*.ipk
# wget --no-check-certificate https://github.com/jerrykuku/luci-app-argon-config/releases/download/v0.8-beta/luci-app-argon-config_0.8-beta_all.ipk
# opkg install luci-app-argon-config*.ipk

# opkg install ./luci-theme-argon_*.ipk
opkg install ./luci-app-argon-config_*.ipk
opkg install ./luci-i18n-argon-config_*.ipk
EOF
chmod +x ./plugin/install-argon.sh

#
#   Lean 网易 UU 加速器插件
#
echo "Creating installation script for UUGameBooster plugin"
cat << EOF > ./plugin/install-uugamebooster.sh
opkg update
opkg install ./uugamebooster_*.ipk
opkg install ./luci-app-uugamebooster_*.ipk
opkg install ./luci-i18n-uugamebooster-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-uugamebooster.sh

#
#   Socat 网络调试工具
#
echo "Creating installation script for Socat plugin"
cat << EOF > ./plugin/install-socat.sh
opkg update
opkg install ./luci-app-socat_*.ipk
opkg install ./luci-i18n-socat-zh-cn_*.ipk
EOF
chmod +x ./plugin/install-socat.sh

#
#   Finish
#

tar -czvf mt1300-plugin.tar.gz ./plugin && mv mt1300-plugin.tar.gz /workdir/
rm -rf ./plugin