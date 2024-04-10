'use strict';
const { utils } = require('surgio');

module.exports = {
  // url: 'https://subapi.rss-node.com/sub?target=clash&interval=129600&filename=Hitun&url=https%3A%2F%2Frss-node.com%2Flink%2FllaIn6VhNWQ8lUW7%3Fmu%3D1',
  url: 'https://subapi.rss-node.com/sub?target=clash&interval=129600&filename=Hitun&url=https%3A%2F%2Frss-node.com%2Flink%2F1axJAyPFMNbFhW40%3Fmu%3D1',
  type: 'clash',
  // 定义所有的节点都支持 udpRelay
  udpRelay: true,
  // 添加国旗 emoji
  addFlag: true,
  // nodeFilter: utils.discardKeywords(['地址','流量','时间','Free','官网','回国','用户','设定','限速', '游戏','低速']),
  // nodeFilter: utils.discardKeywords(['地址','官网','回国','用户','设定','限速', '游戏','低速']),
  tfo: true,
  startPort: 61100,
  renameNode: name => {
    return name + ' | hitun';
  },
};
