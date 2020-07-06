'use strict';
const { utils } = require('surgio');

module.exports = {
  url: 'https://losadhwselfff2332dasd.xyz/link/LNLl7wnBwbOxjy4M?mu=3',
  type: 'shadowsocks_subscribe',
  // 定义所有的节点都支持 udpRelay
  udpRelay: true,
  // 添加国旗 emoji
  addFlag: true,
  customFilters: {
    subscribeFilter: utils.discardKeywords(['地址','流量','时间','Free','续费','官网','回国','用户','设定']),
  },
};
