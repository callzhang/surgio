'use strict';
const { utils } = require('surgio');

module.exports = {
    url: 'https://dler.cloud/subscribe/Ulep1Ha1dk8LLGbi?mu=ss', 
//   url: 'https://dler.cloud/subscribe/Ulep1Ha1dk8LLGbi?mu=ssr',
//   type: 'shadowsocksr_subscribe',
    type: 'shadowsocks_subscribe',
    // 定义所有的节点都支持 udpRelay
    udpRelay: true,
    // 添加国旗 emoji
    addFlag: true,
    nodeFilter: utils.discardKeywords(['地址','流量','时间','Free','续费','官网','回国','用户','设定','限速', '游戏','低速']),
    relayUrl: false,
    tfo: true
};
