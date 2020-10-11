#!MANAGED-CONFIG {{ downloadUrl }} interval=43200 strict=false

{% import './snippet/my_rules.tpl' as my_rules %}
{% import './snippet/direct_rules.tpl' as direct_rules %}
{% import './snippet/apple_rules.tpl' as apple_rules %}
{% import './snippet/youtube_rules.tpl' as youtube_rules %}
{% import './snippet/us_rules.tpl' as us_rules %}
{% import './snippet/blocked_rules.tpl' as blocked_rules %}

[General]
# 日志等级: warning, notify, info, verbose (默认值: notify)
loglevel = notify
# 跳过某个域名或者 IP 段，这些目标主机将不会由 Surge Proxy 处理。(在 macOS
# 版本中，如果启用了 Set as System Proxy,  那么这些值会被写入到系统网络代理
# 设置中.)
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 100.84.0.0/10, localhost, *.local
# 强制使用特定的 DNS 服务器
dns-server = system, 119.29.29.29, 223.5.5.5, 1.1.1.1, 40.73.101.101, 114.114.114.114, 114.114.115.115, 119.29.29.29, 223.5.5.5, 180.76.76.76
# 将特定 IP 段跳过 Surge TUN，详见 Manual
bypass-tun = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8, 139.219.0.0/16
# 是否截取并保存 HTTP 流量 (启用后将对性能有较大影响) (默认值: false)
replica = false
# 是否启动完整的 IPv6 支持 (默认值: false)
ipv6 = true

# 以下参数仅供 macOS 版本使用（多端口监听仅 Surge 3 支持）
http-listen = 0.0.0.0:6152
socks5-listen = 0.0.0.0:6153

# 测速地址
internet-test-url = {{ proxyTestUrl }}
proxy-test-url = {{ proxyTestUrl }}

# 其它
# external-controller-access = password@0.0.0.0:6170
show-primary-interface-changed-notification = true
proxy-settings-interface = Primary Interface (Auto)
menu-bar-show-speed = false
allow-wifi-access = true
hide-crashlytics-request = true
test-timeout = 5
hijack-dns = *:53

# Sony PlayStation、Microsoft Xbox、Nintendo Switch
# 由于游戏主机会使用 STUN 技术进行 NAT 穿透，需要进行一些额外的配置才能正常工作。
# 配置完毕后，可通过设备的网络测试确认成功：
# Sony PlayStation 4：应达到 NAT 类型 2。
# Microsoft Xbox One ：应达到 NAT 类型「开放」。
# Nintendo Switch：应达到 NAT 类型 A 。
always-real-ip = *.apple.com, *.srv.nintendo.net, *.stun.playstation.net, xbox.*.microsoft.com, *.xboxlive.com


[Proxy]
{{ getSurgeNodes(nodeList) }}

[Proxy Group]
🚀 Proxy = url-test, 🇭🇰 HK, 🇸🇬 SG, 🇯🇵 JP, 🇰🇷 KR, 🇨🇳 TW, 🇺🇸 US, url = {{ proxyTestUrl }}, interval= 600, tolerance=100
🇺🇸 US = url-test, {{ getNodeNames(nodeList, usFilter) }}, url = {{ proxyTestUrl }}, interval = 36000
🇭🇰 HK = url-test, {{ getNodeNames(nodeList, hkFilter) }}, url = {{ proxyTestUrl }}, interval = 3600
🇸🇬 SG = url-test, {{ getNodeNames(nodeList, singaporeFilter) }}, url = {{ proxyTestUrl }}, interval = 36000
🇯🇵 JP = url-test, {{ getNodeNames(nodeList, japanFilter) }}, url = {{ proxyTestUrl }}, interval= 36000
🇰🇷 KR = url-test, {{ getNodeNames(nodeList, koreaFilter) }}, url= {{ proxyTestUrl }}, interval= 36000
🇨🇳 TW = url-test, {{ getNodeNames(nodeList, taiwanFilter) }}, url= {{ proxyTestUrl }}, interval= 36000
🍎 Apple = select, DIRECT, 🚀 Proxy, 🇺🇸 US, 🇭🇰 HK
🎬 Netflix = url-test, {{ getNodeNames(nodeList, netflixFilter) }}, url= {{ proxyTestUrl }}, interval= 36000

[Rule]
{{ my_rules.main('🚀 Proxy', '🇺🇸 US') }}

{{ apple_rules.main('🚀 Proxy', '🍎 Apple', '🍎 Apple', 'DIRECT', '🇺🇸 US') }}

{{ remoteSnippets.netflix.main('🎬 Netflix') }}

{{ remoteSnippets.hbo.main('🎬 Netflix') }}

{{ remoteSnippets.hulu.main('🎬 Netflix') }}

{{ youtube_rules.main('🚀 Proxy') }}

{{ us_rules.main('🇺🇸 US') }}

{{ remoteSnippets.telegram.main('🚀 Proxy') }}

{{ blocked_rules.main('🚀 Proxy') }}

{{ direct_rules.main('DIRECT') }}

{{ remoteSnippets.proxyLite.main('🚀 Proxy') }}

# Rulesets
RULE-SET,SYSTEM,DIRECT

# LAN
RULE-SET,LAN,DIRECT

# GeoIP CN
GEOIP,CN,DIRECT

# Final
# FINAL,🚀 Proxy,dns-failed
FINAL, DIRECT

[URL Rewrite]
^https?://(www.)?g.cn https://www.google.com 302
^https?://(www.)?google.cn https://www.google.com 302
