#!/bin/sh

#iptables
opkg update
opkg install coreutils-nohup bash iptables dnsmasq-full curl libcurl4 ca-certificates ipset ip-full iptables-mod-tproxy iptables-mod-extra libcap libcap-bin ruby ruby-yaml kmod-tun kmod-inet-diag unzip luci-compat luci luci-base htop ttyd luci-app-ttyd luci-i18n-ttyd-zh-cn luci-lib-ipkg wget

wget -O /tmp/argon.ipk https://ghproxy.com/https://github.com/jerrykuku/luci-theme-argon/releases/download/v2.2.9.4/luci-theme-argon-master_2.2.9.4_all.ipk
opkg install /tmp/argon.ipk
rm -f /tmp/argon.ipk

wget -O /tmp/argon-config.ipk https://ghproxy.com/https://github.com/jerrykuku/luci-app-argon-config/releases/download/v0.8-beta/luci-app-argon-config_0.8-beta_all.ipk
opkg install /tmp/argon-config.ipk
rm -f /tmp/argon-config.ipk

wget -O /tmp/ramfree.ipk https://op.dllkids.xyz/packages/arm_cortex-a7_neon-vfpv4/luci-app-ramfree_git-22.174.45616-591316c_all.ipk
opkg install /tmp/ramfree.ipk
rm -f /tmp/ramfree.ipk

wget -O /tmp/diskman.ipk https://op.dllkids.xyz/packages/arm_cortex-a7_neon-vfpv4/luci-app-diskman_git-22.193.56798-d29e7ab_all.ipk
opkg install /tmp/diskman.ipk
rm -f /tmp/diskman.ipk

wget -O /tmp/openclash.ipk https://ghproxy.com/https://github.com/vernesong/OpenClash/releases/download/v0.45.70-beta/luci-app-openclash_0.45.70-beta_all.ipk
opkg install /tmp/openclash.ipk
rm -f /tmp/openclash.ipk

wget -O /tmp/luci-app-netdata.ipk https://ghproxy.com/https://github.com/sirpdboy/luci-app-netdata/releases/download/V1.1/luci-app-netdata_1.1-20221013_all.ipk
opkg install /tmp/luci-app-netdata.ipk
rm -f /tmp/luci-app-netdata.ipk

wget -O /tmp/luci-i18n-netdata-zh-cn.ipk https://ghproxy.com/https://github.com/sirpdboy/luci-app-netdata/releases/download/V1.1/luci-i18n-netdata-zh-cn_1.1-20221013_all.ipk
opkg install /tmp/luci-i18n-netdata-zh-cn.ipk
rm -f /tmp/luci-i18n-netdata-zh-cn.ipk
