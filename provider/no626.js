'use strict';
const { utils } = require('surgio');
// https://www.no626.online/
module.exports = {
  url: 'https://sub.no626.link/api/v1/client/subscribe?token=e149d70fc20d1610bae5d2000dae237b',
  type: 'clash',
  // 定义所有的节点都支持 udpRelay
  udpRelay: true,
  // 添加国旗 emoji
  addFlag: true,
  // nodeFilter: utils.discardKeywords(['地址','流量','时间','Free','官网','回国','用户','设定','限速', '游戏','低速']),
  tfo: true,
  renameNode: name => {
    return name + ' | no626';
  },
};
