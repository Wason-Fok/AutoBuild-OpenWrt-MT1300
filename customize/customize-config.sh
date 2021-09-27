#!/bin/bash

############# Modify default parameters here #################
WORKDIR=/workdir
HOSTNAME=GL-MT1300
IPADDRESS=192.168.8.1
SSID=MT1300
ENCRYPTION=psk2+ccmp
KEY=goodlife
LEAN_SETTINGS=/workdir/openwrt/package/lean/default-settings/files/zzz-default-settings
LIENOL_SETTINGS=/workdir/openwrt/package/default-settings/files/zzz-default-settings
###############################################################

cd "$WORKDIR/openwrt"

# Modify HostName
sed -i "s/hostname='OpenWrt'/hostname='$HOSTNAME'/g" package/base-files/files/bin/config_generate

# 修改默认 IP
# 在 21.02 中，不能使用此 sed 命令修改 config generate 中的默认 ipaddress。
#sed -i 's/192.168.1.1/$IPADDRESS/g' package/base-files/files/bin/config_generate

# 如果该 OpenWrt 是 Lean 或者 Lienol 则修改该默认 ipaddress
if [ -f "$LIENOL_SETTINGS" ]
then
    sed -i -e '/exit 0/d' $LIENOL_SETTINGS
    echo "uci set network.lan.ipaddr=$IPADDRESS" >> $LIENOL_SETTINGS
    echo 'uci commit network' >> $LIENOL_SETTINGS
    echo 'exit 0' >> $LIENOL_SETTINGS
else
    if [ -f "$LEAN_SETTINGS" ]
    then
        sed -i -e '/exit 0/d' $LEAN_SETTINGS
        echo "uci set network.lan.ipaddr=$IPADDRESS" >> $LEAN_SETTINGS
        echo 'uci commit network' >> $LEAN_SETTINGS
        echo 'exit 0' >> $LEAN_SETTINGS
    else 
        sed -i 's/192.168.1.1/$IPADDRESS/g' package/base-files/files/bin/config_generate
    fi
fi

# Modify Timezone
sed -i "s/timezone='UTC'/timezone='CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/timezone='CST-8'/a\                set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate

# Modify NTP settings
sed -i 's/0.openwrt.pool.ntp.org/ntp1.aliyun.com/g' package/base-files/files/bin/config_generate
sed -i 's/1.openwrt.pool.ntp.org/time1.cloud.tencent.com/g' package/base-files/files/bin/config_generate
sed -i 's/2.openwrt.pool.ntp.org/time.ustc.edu.cn/g' package/base-files/files/bin/config_generate
sed -i 's/3.openwrt.pool.ntp.org/pool.ntp.org/g' package/base-files/files/bin/config_generate

# Modify default WiFi SSID
sed -i "s/set wireless.default_radio\${devidx}.ssid=OpenWrt/set wireless.default_radio\${devidx}.ssid='$SSID'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default WiFi Encryption
sed -i "s/set wireless.default_radio\${devidx}.encryption=none/set wireless.default_radio\${devidx}.encryption='$ENCRYPTION'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default WiFi Key
sed -i "/set wireless.default_radio\${devidx}.mode=ap/a\                        set wireless.default_radio\${devidx}.key='$KEY'" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Forced WiFi to enable
sed -i 's/set wireless.radio\${devidx}.disabled=1/set wireless.radio\${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

cd "$WORKDIR/openwrt"
make defconfig