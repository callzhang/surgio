'use strict';

module.exports = {
  type: 'custom',
  nodeList: [
    {nodeName: "🇺🇸 GoogleLosAngels", type: 'shadowsocks', hostname: '34.94.174.162', port: 8080, method: 'chacha20-ietf-poly1305', password: "x", 'udp-relay': true, tfp: true, 'obfs': 'http', 'obfs-host': 'reily.app'},
    {nodeName: "🇸🇬 GoogleSingapore", type: 'shadowsocks', hostname: '35.247.154.33', port: 8080, method: 'chacha20-ietf-poly1305', password: "x", 'udp-relay': true, tfp: true, 'obfs': 'http', 'obfs-host': 'reily.app'},
    {nodeName: "🇨🇳 GoogleTW", type: 'shadowsocks', hostname: '35.229.151.32', port: 8080, method: 'chacha20-ietf-poly1305', password: "x", 'udp-relay': true, tfp: true, 'obfs': 'http', 'obfs-host': 'reily.app'},
    {nodeName: "🇭🇰 GoogleHK", type: 'shadowsocks', hostname: '35.220.132.85', port: 8080, method: 'chacha20-ietf-poly1305', password: "x", 'udp-relay': true, tfp: true, 'obfs': 'http', 'obfs-host': 'reily.app'},
    {nodeName: "🇭🇰 AliYunHK", type: 'shadowsocks', hostname: '47.244.180.212', port: 8080, method: 'chacha20-ietf-poly1305', password: "x", 'udp-relay': true, tfp: true, 'obfs': 'http', 'obfs-host': 'reily.app'},
    {nodeName: "🇭🇰 AliYunHK_SNELL", type: 'snell', hostname: '47.244.180.212', port: 80, psk: 'x', 'obfs': 'http'},
    // {
    //   type: 'shadowsocks',
    //   nodeName: '🇺🇸US',
    //   hostname: 'us.example.com',
    //   port: 10000,
    //   method: 'chacha20-ietf-poly1305',
    //   password: 'password',
    //   obfs: 'tls', // tls, http, ws, wss
    //   'obfs-host': 'gateway-carry.icloud.com',
    //   'obfs-uri': '/', // 当 obfs 为 ws 或 wss 时可配置
    //   'udp-relay': true,
    //   tfo: false, // TCP Fast Open
    //   tls13: false, // TLS 1.3，适用于 v2ray-plugin
    //   mux: false, // 目前仅 Clash + Shadowsocks + v2ray-plugin 可用
    // },
    // {
    //   type: 'snell',
    //   nodeName: '🇭🇰HK',
    //   hostname: 'hk.example.com',
    //   port: 10000,
    //   psk: 'RjEJRhNPps3DrYBcEQrcMe3q9NzFLMP',
    //   obfs: 'tls', // tls 或 http
    //   version: '2', // 可选
    // }
  ],
};
