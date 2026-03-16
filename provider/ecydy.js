'use strict';
const { utils } = require('surgio');


module.exports = {
  url: 'https://owo.ecydy.com/link/KYqIa0qyGVWPjJTx?clash=1',
  type: 'clash',
  // 定义所有的节点都支持 udpRelay
  udpRelay: true,
  // 添加国旗 emoji
  addFlag: true,
  // nodeFilter: utils.discardKeywords(['地址','流量','时间','Free','官网','回国','用户','设定','限速', '游戏','低速']),
  tfo: true,
  renameNode: name => {
    return name + ' | ecydy';
  },
};
