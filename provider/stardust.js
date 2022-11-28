'use strict';

module.exports = {
  type: 'custom',
  nodeList: [
    {
      nodeName: '🇭🇰Tencent',
      type: 'vmess',
      hostname: '43.154.224.172',
      method: 'auto', // 仅支持 auto/aes-128-gcm/chacha20-ietf-poly1305/none
      network: 'tcp', // 仅支持 tcp/ws
      path: '/',
      port: 153,
      alterId: 0,
      tls: false,
      host: 'qq.com', // 此属性相当于 wsHeaders.host，但推荐配置在 wsHeaders.host 上
      uuid: 'c5cc3ba3-274b-42ca-ba5d-1f6fc132b6ef',
      tfo: false, // TCP Fast Open
      tls13: false, // TLS 1.3, TLS 开启时有效
      'udp-relay': true, // 开启 UDP 转发
    },
    {
      nodeName: '🇭🇰Tencent-ss',
      type: 'shadowsocks',
      hostname: '43.154.224.172',
      password: 'work4star',
      method: 'auto', // 仅支持 auto/aes-128-gcm/chacha20-ietf-poly1305/none
      network: 'tcp', // 仅支持 tcp/ws
      path: '/',
      port: 44400,
      tls: false,
      host: 'qq.com', // 此属性相当于 wsHeaders.host，但推荐配置在 wsHeaders.host 上
      tfo: false, // TCP Fast Open
      tls13: false, // TLS 1.3, TLS 开启时有效
      'udp-relay': true, // 开启 UDP 转发
    },
  ],
};
