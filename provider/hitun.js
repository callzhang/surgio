'use strict';
const { utils } = require('surgio');

module.exports = {
  url: 'https://rss0814-main.rss-node.com/link/1axJAyPFMNbFhW40?mu=1&clash=1',
  type: 'clash',
  // 定义所有的节点都支持 udpRelay
  udpRelay: true,
  // 添加国旗 emoji
  addFlag: true,
  // nodeFilter: utils.discardKeywords(['地址','流量','时间','Free','官网','回国','用户','设定','限速', '游戏','低速']),
  // nodeFilter: utils.discardKeywords(['地址','官网','回国','用户','设定','限速', '游戏','低速']),
  tfo: true,
  // startPort: 61100,
  renameNode: name => {
    return name + ' | hitun';
  },
};
