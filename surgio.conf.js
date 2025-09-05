'use strict';

const { utils } = require('surgio');


// const uuid = require('crypto').randomUUID();
const uuid = '5b4d987c-4766-41b5-a87a-a6fbb4ea3e4d';

/**
 * 使用文档：https://surgio.royli.dev/
 */
module.exports = {
  // cache: {
  //   type: 'redis',
  //   redisUrl: process.env.REDIS_URL,
  // },
  remoteSnippets: [
    // {
    //   name: 'gfwlist',
    //   url: 'https://1521335688226052.cn-hongkong.fc.aliyuncs.com/2016-08-15/proxy/tools/gfwlist/'
    //   // url: 'https://cdn.jsdelivr.net/gh/Loyalsoldier/surge-rules@release/gfw.txt'
    // },
    // {
    //   url: 'https://raw.githubusercontent.com/geekdada/surge-list/master/surgio-snippet/apple.tpl',
    //   name: 'apple', // 模板中对应 remoteSnippets.apple
    //   surgioSnippet: true
    // },
  ],

  customFilters: {
    asianFilter: utils.useKeywords(['印度', 'Indian', '菲律宾', '越南', '马来西亚',]),
    rowFilter: utils.useKeywords(['英国', '加拿大', '德国', '阿根廷', '土耳其', '澳大利亚', '法国', '乌克兰', '澳洲', '荷兰', '西班牙']),
    RSFilter: utils.useKeywords(['俄罗斯', 'RS']),
    HKFilter: utils.mergeFilters([utils.useKeywords(['香港', 'HK']), utils.discardKeywords(['免费', '游戏', ' 遊戲', 'Game', '测试'], false)], true),
    JPFilter: utils.mergeFilters([utils.useKeywords(['日本', 'JP']), utils.discardKeywords(['免费', '游戏', ' 遊戲', 'Game', '测试'], false)], true),
    otherFilter: utils.useKeywords(['免费', 'Free', '应急', '剩余', '游戏']),
    ikuuuFilter: utils.useKeywords(['ikuuu']),
    hitunFilter: utils.useKeywords(['hitun']),
  },

  artifacts: [
    /**
     * Clash
     */
    {
      name: `stardust_${uuid}.yaml`,
      template: 'clash',
      provider: 'hitun',
      combineProviders: ['stardust', 'ikuuu', 'no626'],
      customParams: {
        dns: true,
      }
    },
  ],
  /**
   * 订阅地址的前缀部分，以 / 结尾
   * 例如阿里云 OSS 的访问地址 https://xxx.oss-cn-hangzhou.aliyuncs.com/
   */
  // urlBase: 'https://surgio-sandy.vercel.app/get-artifact/',
  urlBase: 'https://surgio.netlify.app/get-artifact/',
  surgeConfig: {
    v2ray: 'native',
  },
  binPath: {
    // 安装教程: https://surgio.royli.dev/guide/install-ssr-local.html
    shadowsocksr: '/usr/local/bin/ssr-local',
    v2ray: '/usr/local/bin/v2ray',
  },
  upload: {
    // 默认保存至根目录，可以在此修改子目录名，以 / 结尾，默认为 /
    prefix: '/科学上网/rss/',
    bucket: 'stardust-public',
    // 支持所有区域
    region: 'oss-cn-hangzhou',
    // 以下信息于阿里云控制台获得
    accessKeyId: process.env.AK,
    accessKeySecret: process.env.SK,
  },
  // 非常有限的报错信息收集
  analytics: true,
  // 接口鉴权
  gateway: {
    auth: true,
    accessToken: 'stardust2017',
    useCacheOnError: true,//是否在 Artifact 生成错误时使用缓存（上一次正确请求的结果）。如果 Artifact 中的某个 Provider 经常请求错误则建议开启这个选项，可以避免 Clash 等客户端在配置文件请求报错的时候崩溃。
  },
};

