'use strict';

module.exports = {
  type: 'custom',
  nodeList: [
    {
      nodeName: '🇭🇰Tencent',
      type: 'vmess',
      hostname: '43.134.199.192',
      method: 'auto', // 仅支持 auto/aes-128-gcm/chacha20-ietf-poly1305/none
      network: 'tcp', // 仅支持 tcp/ws
      path: '/',
      port: 6522,
      alterId: '56',
      tls: false,
      host: 'qq.com', // 此属性相当于 wsHeaders.host，但推荐配置在 wsHeaders.host 上
      uuid: 'f50cda66-7d3c-43d4-801e-4151457296db',
      tfo: false, // TCP Fast Open
      tls13: false, // TLS 1.3, TLS 开启时有效
      'udp-relay': true, // 开启 UDP 转发
    },
    {
      nodeName: '🇭🇰Tencent2',
      type: 'vmess',
      hostname: '43.158.192.92',
      method: 'auto', // 仅支持 auto/aes-128-gcm/chacha20-ietf-poly1305/none
      network: 'tcp', // 仅支持 tcp/ws
      path: '/',
      port: 153,
      alterId: '0',
      tls: false,
      host: 'qq.com', // 此属性相当于 wsHeaders.host，但推荐配置在 wsHeaders.host 上
      uuid: 'f5a3da84-20b8-49ab-8947-7bff9e4f17e5',
      tfo: false, // TCP Fast Open
      tls13: false, // TLS 1.3, TLS 开启时有效
      'udp-relay': true, // 开启 UDP 转发
    },
  ],
};
