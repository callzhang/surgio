'use strict';
const { utils } = require('surgio');

// https://ikuuu.art

module.exports = {
  url: 'https://l1wn2.no-mad-world.club/link/ZMOoNEXC8crj3cYe?clash=3&extend=1',
  type: 'clash',
  // 定义所有的节点都支持 udpRelay
  udpRelay: true,
  // 添加国旗 emoji
  addFlag: true,
  // nodeFilter: utils.discardKeywords(['地址','流量','时间','Free','官网','回国','用户','设定','限速', '游戏','低速']),
  tfo: true,
  renameNode: name => {
    return name + ' | ikuuu';
  },
};
