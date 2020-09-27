{% import './snippet/my_rules.tpl' as my_rules %}
{% import './snippet/direct_rules.tpl' as direct_rules %}
{% import './snippet/apple_rules.tpl' as apple_rules %}
{% import './snippet/youtube_rules.tpl' as youtube_rules %}
{% import './snippet/us_rules.tpl' as us_rules %}
{% import './snippet/blocked_rules.tpl' as blocked_rules %}

# {{ downloadUrl }}

# HTTP 端口
port: 7890

# SOCKS5 端口
socks-port: 7891

# # Linux 及 macOS 的 redir 端口
redir-port: 7892

# url test address
latency-url: http://www.google.com
proxies-order: latency #按节点延迟升序排列

# icon
cfw-tray-icon: 
  default: https://stardust-public.oss-cn-hangzhou.aliyuncs.com/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91/icon_bw.ico          # 默认图标
  system-proxy-on: https://stardust-public.oss-cn-hangzhou.aliyuncs.com/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91/icon.ico   # 开启系统代理后图标

# 1. clash DNS 请求逻辑：
#   (1) 当访问一个域名时， nameserver 与 fallback 列表内的所有服务器并发请求，得到域名对应的 IP 地址。
#   (2) clash 将选取 nameserver 列表内，解析最快的结果。
#   (3) 若解析结果中，IP 地址属于 国外，那么 clash 将选择 fallback 列表内，解析最快的结果。
#
#   因此，我在 nameserver 和 fallback 内都放置了无污染、解析速度较快的国内 DNS 服务器，以达到最快的解析速度。
#   但是 fallback 列表内服务器会用在解析境外网站，为了结果绝对无污染，我仅保留了支持 DoT/DoH 的两个服务器。
# 
# 2. clash DNS 配置注意事项：
#   (1) 如果您为了确保 DNS 解析结果无污染，请仅保留列表内以 tls:// 或 https:// 开头的 DNS 服务器，但是通常对于国内域名没有必要。
#   (2) 如果您不在乎可能解析到污染的结果，更加追求速度。请将 nameserver 列表的服务器插入至 fallback 列表内，并移除重复项。
# 
# 3. 关于 DNS over HTTPS (DoH) 和 DNS over TLS (DoT) 的选择：
#   对于两项技术双方各执一词，而且会无休止的争论，各有利弊。各位请根据具体需求自行选择，但是配置文件内默认启用 DoT，因为目前国内没有封锁或管制。
#   DoH: 以 https:// 开头的 DNS 服务器。拥有更好的伪装性，且几乎不可能被运营商或网络管理封锁，但查询效率和安全性可能略低。
#   DoT: 以 tls:// 开头的 DNS 服务器。拥有更高的安全性和查询效率，但端口有可能被管制或封锁。
#   若要了解更多关于 DoH/DoT 相关技术，请自行查阅规范文档。
{% if customParams.dns %}
dns:
  enable: true # set true to enable dns (default is false)
  ipv6: true # default is false
  listen: 0.0.0.0:53
  enhanced-mode: redir-host
  nameserver:
    - 114.114.114.114
    - tls://dns.rubyfish.cn:853 # dns over tls
    - https://1.1.1.1/dns-query # dns over https
  fallback: # concurrent request with nameserver, fallback used when GEOIP country isn't CN
    - 8.8.8.8
    - tcp://1.1.1.1
    - tls://13800000000.rubyfish.cn:853
    - tls://1.0.0.1:853
    - tls://dns.google:853
  fallback-filter: 
    geoip: true # default
    ipcidr: # ips in these subnets will be considered polluted
      - 240.0.0.0/4
{% endif %}

# interface-name: en0 #windows不兼容

tun:
  stack: system
  macOS-auto-route: true #Automatic set global routing on macOS.
  macOS-auto-detect-interface: true #Automatic choose traffic exits interface on macOS. 
  enable: true

# allow-lan: false

# 仅适用于设置 allow-lan 为 true 时
# "*": 绑定所有 IP 地址
  # 192.168.122.11: 绑定单个 IPv4 地址
# "[aaaa::a8aa:ff:fe09:57d8]": 绑定单个 IPv6 地址
# bind-address: "*"

# Rule / Global / Direct (默认为 Rule 模式)
mode: Rule

# 设置输出日志的等级 (默认为 info)
# info / warning / error / debug / silent
log-level: info

# RESTful API for clash
external-controller: 127.0.0.1:9090

# you can put the static web resource (such as clash-dashboard) to a directory, and clash would serve in `${API}/ui`
# input is a relative path to the configuration directory or an absolute path
# external-ui: folder

# Secret for RESTful API (Optional)
# secret: ""

# 实验性功能
# experimental:
#   ignore-resolve-fail: true # 忽略 DNS 解析失败，默认值为true
#   interface-name: en0 # 出站接口名称

# 本地 SOCKS5/HTTP(S) 服务器认证
# authentication:
#  - "user1:pass1"
#  - "user2:pass2"

# # 实验性 hosts, 支持通配符（如 *.clash.dev 甚至 *.foo.*.examplex.com ）
# # 静态域的优先级高于通配符域（foo.example.com > *.example.com）
hosts:
  # 'mtalk.google.com': 108.177.125.188
#   '*.clash.dev': 127.0.0.1
#   'alpha.clash.dev': '::1'



# Clash for Windows
cfw-latency-timeout: 5000

#-------------------#

proxies: {{ getClashNodes(nodeList) | json }}

proxy-groups:
- type: url-test
  name: 🚀 自动选择
config  proxies: [🇭🇰 HK, DIRECT, 🇸🇬 SG, 🇯🇵 JP, 🇰🇷 KR, 🇨🇳 TW, 🇺🇸 US, 🇬🇧 英国, 🇷🇺 俄罗斯, 🇮🇳 印度]
  url: {{ proxyTestUrl }}
  interval: 60
  tolerance: 100
- type: url-test
  name: 🇺🇸 US
  proxies: {{ getClashNodeNames(nodeList, usFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇭🇰 HK
  proxies: {{ getClashNodeNames(nodeList, hkFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 3600 #香港频率高一些
- type: url-test
  name: 🇸🇬 SG
  proxies: {{ getClashNodeNames(nodeList, singaporeFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇯🇵 JP
  proxies: {{ getClashNodeNames(nodeList, japanFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇰🇷 KR
  proxies: {{ getClashNodeNames(nodeList, koreaFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇨🇳 TW
  proxies: {{ getClashNodeNames(nodeList, taiwanFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇬🇧 英国
  proxies: {{ getClashNodeNames(nodeList, customFilters.UKFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇷🇺 俄罗斯
  proxies: {{ getClashNodeNames(nodeList, customFilters.RSFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇮🇳 印度
  proxies: {{ getClashNodeNames(nodeList, customFilters.INDFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
#- type: url-test
#  name: 🇨🇦 CA
#  proxies: {{ getClashNodeNames(nodeList, customFilters.CAFilter) | json }}
#  url: {{ proxyTestUrl }}
#  interval: 36000
- type: select
  name: 🍎 Apple
  proxies:
    - DIRECT
    - 🚀 自动选择
- type: url-test
  name: 🎬 Netflix
  proxies: {{ getClashNodeNames(nodeList, netflixFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000

rules:
{{ my_rules.main('🚀 自动选择', '🇺🇸 US') | clash }}
{{ apple_rules.main('🚀 自动选择', '🍎 Apple', '🍎 Apple', 'DIRECT', '🇺🇸 US') | clash }}
{{ remoteSnippets.netflix.main('🎬 Netflix') | clash }}
{{ remoteSnippets.hbo.main('🚀 自动选择') | clash }}
{{ remoteSnippets.hulu.main('🚀 自动选择') | clash }}
{{ youtube_rules.main('🚀 自动选择') | clash }}
{{ us_rules.main('🇺🇸 US') | clash }}
{{ remoteSnippets.telegram.main('🚀 自动选择') | clash }}
{{ blocked_rules.main('🚀 自动选择') | clash }}
{{ direct_rules.main('DIRECT') | clash }}
{{ remoteSnippets.gfwlist.main('🚀 自动选择') | clash }}

# LAN
- DOMAIN-SUFFIX,local,DIRECT
- IP-CIDR,127.0.0.0/8,DIRECT
- IP-CIDR,172.16.0.0/12,DIRECT
- IP-CIDR,192.168.0.0/16,DIRECT
- IP-CIDR,10.0.0.0/8,DIRECT
- IP-CIDR,100.64.0.0/10,DIRECT

# Final
- GEOIP,CN,DIRECT
- MATCH,DIRECT
