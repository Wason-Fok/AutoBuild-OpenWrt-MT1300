# GL-iNet MT-1300 路由器 Openwrt 系统
![opVer](https://img.shields.io/badge/Openwrt-19.07.7-blue)
![issues](https://img.shields.io/github/issues/Wason-Fok/AutoBuild-OpenWrt-MT1300)
![license](https://img.shields.io/github/license/Wason-Fok/AutoBuild-OpenWrt-MT1300)
[![Follow](https://img.shields.io/github/followers/Wason-Fok.svg?label=%E5%85%B3%E6%B3%A8%E6%88%91&style=social)](https://github.com/Wason-Fok)  
> **Wechat**：Wason__  
> **E-Mail**: Wason_Fok@163.com

> **该项目主要用于单独编译插件，如需编译固件请自行修改**

>PS: 如果路由器没有足够的空间安装其他插件，可参考一下教程进行扩容  
> [将 Overlay 空间指向外置存储](https://blog.digicat-studio.com/Technology/openwrt_overlay.html)

## 近期更新
<details>
    <summary><b>&nbsp;&nbsp;&nbsp; 2021-10-19</b></summary>
    </br>

    - 修复 插件打包脚本 Bug
    - 修复 luci-app-socat 权限问题
    - 测试 部分插件
    - 更新 Readme
    
</details>

<details>
    <summary><b>&nbsp;&nbsp;&nbsp; 2021-10-18</b></summary>
    </br>

    - 修复 luci-app-argon-config i18n 问题
    - 修复 第三方插件不能正常编译 luci-i18n-*-zh-cn_*.ipk 问题
    - 修复 luci-app-autotimeset 权限问题
    - 添加 luci-app-socat 网络调试工具插件
    - 添加 Lean 的 luci-app-uugamebooster 网易 UU 加速器插件
    - 为保证 .config 配置完整性，使用 `./scripts/diffconfig.sh > diffconfig` 剥离出自定义部分
</details>

<details>
    <summary><b>&nbsp;&nbsp;&nbsp; 2021-10-17</b></summary>
    </br>
    
    - 第一版完成
</details>

---

基于 GL-iNet 官方 [19.07.7](https://github.com/gl-inet/openwrt/tree/openwrt-19.07.7) 分支，添加了部分常用插件。

## 默认设置
- 主机名：`GL-MT1300`
- IP 地址：`192.168.8.1`
- Wifi SSID：`GL-MT1300`
- Wifi 密码：`goodlife`

<details>
    <summary><b>&nbsp;&nbsp;&nbsp; 添加的第三方插件</b></summary>
    </br>

| 插件 | 描述 | 备注 | 状态 | 链接 |
| :--- | :--- | ---: | :---: | :---: |
| helloworld | 不用说大家都懂！ | 不包含 Kcptun Naiveproxy Trojan | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/fw876/helloworld) |
| shadowsocks-libv | 不用说大家都懂！| 使用 Lean 版本 而非官方 | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/packages/tree/master/net/shadowsocks-libev) |
| wget | 大宝天天见 | 使用 Lean 版本 而非官方 | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/packages/tree/master/net/wget) |
| luci-app-bearDropper | SSH 防攻击插件 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/NateLol/luci-app-bearDropper) |
| luci-app-ddnsto | DDNSTO 内网穿透插件 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/linkease/nas-packages-luci) |
| luci-theme-edge | Edge 主题 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/garypang13/luci-theme-edge) |
| luci-app-zerotier | Zerotier 内网穿透插件 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-zerotier) |
| luci-app-adbyby-plus | 广告屏蔽大师 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-adbyby-plus) |
| luci-app-autoreboot | Lean 定时重启插件 (与autotimeset 二选一即可)| | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-autoreboot) |
| luci-app-ramfree | 内存释放插件 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-ramfree) |
| luci-app-diskman | 磁盘管理插件 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-diskman) |
| luci-app-filetransfer | 文件传输插件 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-filetransfer) |
| luci-app-unblockmusic | 解锁网易云灰色歌曲插件 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-unblockmusic) |
| luci-app-netdata | Netdata 图形实时监控插件 | Netdata 使用 Lean 版本 而非官方 | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-turboacc) |
| luci-app-v2ray-server | V2Ray 服务端 | | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-v2ray-server) |
| luci-app-autotimeset | 定时关机重启插件 | 存在权限问题 **`已修复`** | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/sirpdboy/luci-app-autotimeset) |
| luci-app-argon-config | Argon 主题配置插件 |  主分支 i18n 问题 **`已修复`** | ![已测试](https://img.shields.io/badge/-TESTED-green) | [链接](https://github.com/jerrykuku/luci-app-argon-config) |
| luci-theme-argon | Argon 主题 | 使用 v2.2.5 版本，主分支 Logo 显示存在问题 | ![已修复](https://img.shields.io/badge/-Fixed-blue) | [链接](https://github.com/jerrykuku/luci-theme-argon) |
| luci-app-serverchan | 微信推送插件 | | ![未测试](https://img.shields.io/badge/-UNTEST-orange) | [链接](https://github.com/tty228/luci-app-serverchan) |
| luci-app-webadmin | Web 管理插件 | 对于 MT-1300 可能用处不大 | ![未测试](https://img.shields.io/badge/-UNTEST-orange) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-webadmin) |
| luci-app-arpbind | IP/MAC 绑定插件 | 对于 MT-1300 可能用处不大 | ![未测试](https://img.shields.io/badge/-UNTEST-orange) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-arpbind) |
| luci-app-ssrserver-python | SSR 服务器 python 版本 | 无法运行(可用 v2ray server 替代) | ![待修复](https://img.shields.io/badge/-FAIL-red) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-ssrserver-python) |
| luci-app-UUGameAcc | 网易 UU 加速器插件 | 暂不支持 mips 平台 | ![待修复](https://img.shields.io/badge/-FAIL-red) | [链接](https://github.com/BCYDTZ/luci-app-UUGameAcc) |
| luci-app-linkease | 易有云私有云插件 | 无法成功编译 | ![待修复](https://img.shields.io/badge/-FAIL-red) |  [链接](https://github.com/linkease/nas-packages-luci) |
| luci-app-socat | 端口转发工具 | 存在权限问题 | ![待修复](https://img.shields.io/badge/-FAIL-red) | [链接](https://github.com/nickilchen/luci-app-socat) |
| luci-app-vlmcsd | KMS 激活服务器插件 | 存在安装后无法运行问题 | ![待修复](https://img.shields.io/badge/-FAIL-red) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-vlmcsd) |
| luci-app-turboacc | TurboAcc 网络加速插件 | 安装后一直处于正在获取数据状态 | ![待修复](https://img.shields.io/badge/-FAIL-red) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-turboacc) |
| luci-app-uugamebooster | Lean 网易 UU 加速器插件 | 安装后无法启用 | ![待修复](https://img.shields.io/badge/-FAIL-red) | [链接](https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-uugamebooster)

</details>

---

## 文件描述
```
- Build-MT1300-gl.yml 用于自动编译固件
- update-cheker-gl.yml 用于每周五检查 GL-iNet 官方固件更新并自动触发编译
- update-cheker-lede.yml 用于每周五检查 Lede 固件更新并自动触发编译

- config
    - .config.gl 固件编译配置文件（可自行添加或移除功能）
- customize
    - create-plugin-packages.sh 用于将需要的 ipk 单独进行打包，并生成 install-*.sh 文件
    - customize-config.sh  用于在编译前进行配置 openwrt 固件（例如：修改 IP 地址、Wifi 等）
    - customize-feeds-gl.sh 用于在编译前 clone 第三方插件等操作
```

---

## 安装打包好的插件
1. 下载 [mt1300-plugin-tar.gz](https://github.com/Wason-Fok/AutoBuild-OpenWrt-MT1300/releases/latest) 并上传到 `/tmp` 目录中，也可以使用 `wget`
2. 解压文件
    ```
    tar -zxvf mt1300-plugin-tar.gz
    ```
3. 进入到 `plugin` 目录，安装需要的功能即可
    ```
    cd plugin
    
    # 使用 ls 可以看到所有安装脚本
    ls -al *.sh

    # 建议在运行插件安装脚本之前先运行下面的脚本，安装基础插件
    sh install-baseplugin.sh

    # 最后运行相应的插件安装脚本即可
    sh install-***.sh
    ```

---

## 鸣谢
- [GL-iNet 官方库](https://github.com/gl-inet/openwrt)

- [P3TERX 的 Action 库](https://github.com/P3TERX/Actions-OpenWrt)

- [Lean 的 OpenWrt 库](https://github.com/coolsnowwolf/lede)

- [igithublab 的 MT1300 库](https://github.com/igithublab/MT1300)

- [由衷感谢 eSir](https://github.com/esirplayground)
    - **如果没有 esir 我也不可能以较快的速度感受到 openwrt 的魅力**
    - 奉上 esir 的 YouTube 频道，视频做的非常详细。希望大家多多关注 ！！！
    - 📺 [eSir Playground](https://github.com/esirplayground)