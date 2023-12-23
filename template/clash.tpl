{% import './snippet/my_rules.tpl' as my_rules %}
{% import './snippet/direct_rules.tpl' as direct_rules %}
{% import './snippet/apple_rules.tpl' as apple_rules %}
{% import './snippet/youtube_rules.tpl' as youtube_rules %}
{% import './snippet/us_rules.tpl' as us_rules %}
{% import './snippet/blocked_rules.tpl' as blocked_rules %}

# {{ downloadUrl }}

# Port of HTTP(S) proxy server on the local end
port: 7890

# Port of SOCKS5 proxy server on the local end
# socks-port: 7891

# Transparent proxy server port for Linux and macOS (Redirect TCP and TProxy UDP)
redir-port: 7892

# Transparent proxy server port for Linux (TProxy TCP and TProxy UDP)
tproxy-port: 7893

# HTTP(S) and SOCKS4(A)/SOCKS5 server on the same port
mixed-port: 7890

# authentication of local SOCKS5/HTTP(S) server
# authentication:
#  - "user1:pass1"
#  - "user2:pass2"

# Set to true to allow connections to the local-end server from
# other LAN IP addresses
allow-lan: true

# This is only applicable when `allow-lan` is `true`
# '*': bind all IP addresses
# 192.168.122.11: bind a single IPv4 address
# "[aaaa::a8aa:ff:fe09:57d8]": bind a single IPv6 address
bind-address: '*'

# Clash router working mode
# rule: rule-based packet routing
# global: all packets will be forwarded to a single endpoint
# direct: directly forward the packets to the Internet
mode: rule

# Clash by default prints logs to STDOUT
# info / warning / error / debug / silent
log-level: info

# When set to false, resolver won't translate hostnames to IPv6 addresses
ipv6: true

# RESTful web API listening address
external-controller: 127.0.0.1:9090

# A relative path to the configuration directory or an absolute path to a
# directory in which you put some static web resource. Clash core will then
# serve it at `http://{{external-controller}}/ui`.
# external-ui: folder

# Secret for the RESTful API (optional)
# Authenticate by spedifying HTTP header `Authorization: Bearer ${secret}`
# ALWAYS set a secret if RESTful API is listening on 0.0.0.0
# secret: ""

# fwmark on Linux only
# routing-mark: 6666

# Static hosts for DNS server and connection establishment (like /etc/hosts)
#
# Wildcard hostnames are supported (e.g. *.clash.dev, *.foo.*.example.com)
# Non-wildcard domain names have a higher priority than wildcard domain names
# e.g. foo.example.com > *.example.com > .example.com
# P.S. +.foo.com equals to .foo.com and foo.com
hosts:
  # '*.clash.dev': 127.0.0.1
  # '.dev': 127.0.0.1
  # 'alpha.clash.dev': '::1'

profile:
  # Store the `select` results in $HOME/.config/clash/.cache
  # set false If you don't want this behavior
  # when two different configurations have groups with the same name, the selected values are shared
  store-selected: true

  # persistence fakeip
  store-fake-ip: true

# icon
cfw-tray-icon: 
  default: https://stardust-public.oss-cn-hangzhou.aliyuncs.com/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91/icon_bw.ico          # 默认图标
  system-proxy-on: https://stardust-public.oss-cn-hangzhou.aliyuncs.com/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91/icon.ico   # 开启系统代理后图标

tun:
  enable: true
  stack: system # or gvisor (for windows)
  # dns-hijack: # DNS hijacking might result in a failure, if the system DNS is at a private IP address (since auto-route does not capture private network traffic).
  #   - 8.8.8.8:53
  #   - tcp://8.8.8.8:53
  #   - any:53
  #   - tcp://any:53
  #   - 198.18.0.2:53 # for Windows, when `fake-ip-range` is 198.18.0.1/16, should hijack 198.18.0.2:53
  auto-route: true # manage `ip route` and `ip rules`
  auto-redir: true # manage nftable REDIRECT
  auto-detect-interface: true # conflict with `interface-name`

{% if customParams.dns %}
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
# DNS server settings
# This section is optional. When not present, the DNS server will be disabled.
dns:
  enable: true
  listen: 0.0.0.0:53
  ipv6: true # when the false, response to AAAA questions will be empty

  # These nameservers are used to resolve the DNS nameserver hostnames below.
  # Specify IP addresses only
  # default-nameserver:
  #  - 8.8.8.8
  #  - 114.114.114.114
  enhanced-mode: fake-ip # or redir-host (not recommended)
  fake-ip-range: 198.18.0.1/16 # Fake IP addresses pool CIDR
  # use-hosts: true # lookup hosts and return IP record
  
  # Hostnames in this list will not be resolved with fake IPs
  # i.e. questions to these domain names will always be answered with their real IP addresses
  fake-ip-filter:
    - '*.lan'
    - localhost
  
  # Supports UDP, TCP, DoT, DoH. You can specify the port to connect to.
  # All DNS questions are sent directly to the nameserver, without proxies
  # involved. Clash answers the DNS question with the first result gathered.
  nameserver:
    - 114.114.114.114 # 电信
    - 223.5.5.5 # 阿里云
    - 119.29.29.29 # 腾讯云
    - dhcp://en0 # dns from dhcp

  # When `fallback` is present, the DNS server will send concurrent requests
  # to the servers in this section along with servers in `nameservers`.
  # The answers from fallback servers are used when the GEOIP country
  # is not `CN`.
  fallback:
    - tcp://1.1.1.1
    - https://doh.buzz:8000/dns-query
    - https://doh.beauty:8000/dns-query
    - https://cloudflare-dns.com/dns-query
    - tls://1.1.1.1:853
    - tls://1.0.0.1:853
    - https://1.1.1.1/dns-query
    - https://1.0.0.1/dns-query
    - tls://8.8.8.8:853
    - tls://8.8.4.4:853
    - https://dns.google/dns-query
    - https://dns.twnic.tw/dns-query

  # If IP addresses resolved with servers in `nameservers` are in the specified
  # subnets below, they are considered invalid and results from `fallback`
  # servers are used instead.
  #
  # IP address resolved with servers in `nameserver` is used when
  # `fallback-filter.geoip` is true and when GEOIP of the IP address is `CN`.
  #
  # If `fallback-filter.geoip` is false, results from `nameserver` nameservers
  # are always used if not match `fallback-filter.ipcidr`.
  #
  # This is a countermeasure against DNS pollution attacks.
  fallback-filter:
    geoip: true
    geoip-code: CN
    ipcidr:
      - 240.0.0.0/4
    domain:
      - '+.google.com'
      - '+.facebook.com'
      - '+.youtube.com'
      - '+.bing.cn'
      - '+.bing.com'
      - '+.openai.com'
  
  # Lookup domains via specific nameservers
  nameserver-policy:
    '+.openai.com': '8.8.8.8'
    '+.bing.com': '8.8.8.8'
{% endif %}

#-------------------#

proxies: 
{{ getClashNodes(nodeList) | yaml }}

proxy-groups:
- type: url-test
  name: 🚀 自动选择 # 选择最快的代理组
  proxies: [🇭🇰 HK, 🇸🇬 SG, 🇯🇵 JP, 🇰🇷 KR, 🇨🇳 TW, 🇺🇸 US, 🇬🇧 英国, 🇷🇺 俄罗斯, 🇮🇳 印度, 🇨🇦 CA, 📌 Free]
  url: {{ proxyTestUrl }}
  interval: 600
  tolerance: 50
- type: url-test
  name: 🌐 ChatGPT # 针对封锁亚洲的情况
  proxies: [🇺🇸 US, 🇬🇧 英国, 🇷🇺 俄罗斯, 🇨🇦 CA, 🇯🇵 JP, 🇩🇪 德国]
  url: https://chat.openai.com/
  interval: 600
  tolerance: 100
- type: url-test
  name: 🌟 Contentful # 官网配置后台
  proxies: [🇭🇰 HK, 🇸🇬 SG, 🇯🇵 JP, 🇰🇷 KR, 🇨🇳 TW, 🇺🇸 US, 🇬🇧 英国, 🇷🇺 俄罗斯, 🇮🇳 印度, 🇨🇦 CA, 📌 Free]
  url: https://api.contentful.com
  interval: 3600
  tolerance: 100
- type: url-test
  name: 🇺🇸 US
  proxies: {{ getClashNodeNames(nodeList, usFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
  tolerance: 50
- type: url-test
  name: 🇭🇰 HK
  proxies: {{ getClashNodeNames(nodeList, hkFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 600
  tolerance: 50
- type: url-test
  name: 🇸🇬 SG
  proxies: {{ getClashNodeNames(nodeList, singaporeFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 3600
  tolerance: 100
- type: url-test
  name: 🇯🇵 JP
  proxies: {{ getClashNodeNames(nodeList, japanFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 3600
  tolerance: 100
- type: url-test
  name: 🇰🇷 KR
  proxies: {{ getClashNodeNames(nodeList, koreaFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
  tolerance: 100
- type: url-test
  name: 🇨🇳 TW
  proxies: {{ getClashNodeNames(nodeList, taiwanFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 3600
  tolerance: 100
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
- type: url-test
  name: 🇨🇦 CA
  proxies: {{ getClashNodeNames(nodeList, customFilters.CAFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 36000
- type: url-test
  name: 🇩🇪 德国
  proxies: {{ getClashNodeNames(nodeList, customFilters.GEFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 3600
- type: select
  name: 🍎 Apple
  proxies:
    - DIRECT
    - 🚀 自动选择
- type: url-test
  name: 🎬 Netflix
  proxies: {{ getClashNodeNames(nodeList, netflixFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 3600
- type: url-test
  name: 📌 Free
  proxies: {{ getClashNodeNames(nodeList, customFilters.FreeFilter) | json }}
  url: {{ proxyTestUrl }}
  interval: 3600

rule-providers: # ClashX Premium features
  chatgpt:
    behavior: "classical" # domain, ipcidr or classical
    type: http
    format: 'yaml' # or 'text'
    url: "http://stardust-public.oss-cn-hangzhou.aliyuncs.com/%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91/rss/ruleset.yaml"
    interval: 36000
    path: ./chatgpt.yaml
  gfwlist:
    behavior: "classical"
    type: http
    format: 'text'
    url: https://1521335688226052.cn-hongkong.fc.aliyuncs.com/2016-08-15/proxy/tools/gfwlist/
    interval: 3600000
    path: ./gfwlist.txt
  reject:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/reject.txt"
    path: ./ruleset/reject.yaml
    interval: 86400
  private:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/private.txt"
    path: ./ruleset/private.yaml
    interval: 86400
  gfw:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/gfw.txt"
    path: ./ruleset/gfw.yaml
    interval: 86400
  telegramcidr:
    type: http
    behavior: ipcidr
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/telegramcidr.txt"
    path: ./ruleset/telegramcidr.yaml
    interval: 86400
  applications:
    type: http
    behavior: classical
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/applications.txt"
    path: ./ruleset/applications.yaml
    interval: 86400


rules:
- RULE-SET,chatgpt,🌐 ChatGPT
- RULE-SET,applications,DIRECT
- RULE-SET,private,DIRECT
- RULE-SET,reject,REJECT
#--------------------------- my rules ---------------------------
{{ my_rules.main('🚀 自动选择', '🇺🇸 US') | clash }}
#--------------------------- cn direct ---------------------------
{{ remoteSnippets.cn.main('DIRECT') | clash}}
- GEOIP,CN,DIRECT
{{ direct_rules.main('DIRECT') | clash }}
# -------------------------- apple --------------------------
{{ remoteSnippets.apple.main('🚀 自动选择', '🍎 Apple', '🍎 Apple', 'DIRECT', '🇺🇸 US') | clash}}
# -------------------------- netflix --------------------------
{{ remoteSnippets.netflix.main('🎬 Netflix') | clash}}
# -------------------------- telegram --------------------------
- RULE-SET,telegramcidr,🚀 自动选择
# -------------------------- gfwlist --------------------------
# - RULE-SET,gfwlist,🚀 自动选择
- RULE-SET,gfw,🚀 自动选择

# LAN
- DOMAIN-SUFFIX,local,DIRECT
- IP-CIDR,127.0.0.0/8,DIRECT
- IP-CIDR,172.16.0.0/12,DIRECT
- IP-CIDR,192.168.0.0/16,DIRECT
- IP-CIDR,10.0.0.0/8,DIRECT
- IP-CIDR,100.64.0.0/10,DIRECT

# Final
- MATCH,DIRECT
