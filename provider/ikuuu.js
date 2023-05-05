'use strict';
const { utils } = require('surgio');

module.exports = {
  url: 'https://api.sub-100.one/link/9qAfmnYmJElkP96A?clash=3&extend=1',
  type: 'clash',
  // 定义所有的节点都支持 udpRelay
  udpRelay: true,
  // 添加国旗 emoji
  addFlag: true,
  // nodeFilter: utils.discardKeywords(['地址','流量','时间','Free','官网','回国','用户','设定','限速', '游戏','低速']),
  tfo: true,
  // startPort: 61200
};
