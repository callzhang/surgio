{% macro main(rule, US_node) %}

# Derek's Rules
DOMAIN-KEYWORD,slack,{{ rule }}
DOMAIN-KEYWORD,adobe,{{ rule }}
DOMAIN-KEYWORD,hitun,{{ rule }}
DOMAIN-SUFFIX,github.io,{{ rule }}
DOMAIN-SUFFIX,gitlab.com,{{ rule }}
DOMAIN-SUFFIX,github.com,{{ rule }}
DOMAIN-SUFFIX,gitlab-static.net,{{ rule }}
DOMAIN-SUFFIX,okex.com,{{ rule }}
DOMAIN-SUFFIX,ign.com,{{ rule }}
DOMAIN-SUFFIX,arxiv.org,{{ rule }}
DOMAIN-SUFFIX,cryptobriefing.com,{{ rule }}
DOMAIN-SUFFIX,ethereum.org,{{ rule }}
DOMAIN-SUFFIX,slack.com,{{ rule }}
DOMAIN-SUFFIX,slack-msgs.com,{{ rule }}
DOMAIN-SUFFIX,gstatic.com,{{ rule }}
DOMAIN-SUFFIX,slack-imgs.com,{{ rule }}
DOMAIN-SUFFIX,googleapis.com,{{ rule }}
DOMAIN-SUFFIX,googleusercontent.com,{{ rule }}
DOMAIN-SUFFIX,kaggle.com,{{ rule }}
DOMAIN-SUFFIX,stanford.edu,{{ rule }}
DOMAIN-SUFFIX,cloudfunctions.net,{{ rule }}
DOMAIN-SUFFIX,wikipedia.org,{{ rule }}
DOMAIN-SUFFIX,slack-edge.com,{{ rule }}
DOMAIN-SUFFIX,海豚湾.com,{{ rule }}
DOMAIN-SUFFIX,onetravel.com,{{ rule }}
DOMAIN-SUFFIX,githubusercontent.com,{{ rule }}
DOMAIN-SUFFIX,ssrcloud.com,{{ rule }}
DOMAIN-SUFFIX,netlify.app,{{ rule }}
#美国节点
DOMAIN-SUFFIX,coinbase.com,{{ US_node }}
DOMAIN-SUFFIX,remotasks.com,{{ US_node }}
DOMAIN-SUFFIX,losadhwselfff2332dasd.xyz,{{ US_node }}

#直连
DOMAIN-SUFFIX,asus.com, DIRECT
DOMAIN-SUFFIX,acl4ssr,DIRECT
DOMAIN-SUFFIX,ip6-localhost,DIRECT
DOMAIN-SUFFIX,ip6-loopback,DIRECT
DOMAIN-SUFFIX,local,DIRECT
DOMAIN-SUFFIX,localhost,DIRECT
DOMAIN,router.asus.com,DIRECT
DOMAIN-SUFFIX,hiwifi.com,DIRECT
DOMAIN-SUFFIX,leike.cc,DIRECT
DOMAIN-SUFFIX,miwifi.com,DIRECT
DOMAIN-SUFFIX,my.router,DIRECT
DOMAIN-SUFFIX,p.to,DIRECT
DOMAIN-SUFFIX,peiluyou.com,DIRECT
DOMAIN-SUFFIX,phicomm.me,DIRECT
DOMAIN-SUFFIX,routerlogin.com,DIRECT
DOMAIN-SUFFIX,tendawifi.com,DIRECT
DOMAIN-SUFFIX,zte.home,DIRECT
IP-CIDR,10.0.0.0/8,DIRECT
IP-CIDR,100.64.0.0/10,DIRECT
IP-CIDR,127.0.0.0/8,DIRECT
IP-CIDR,172.16.0.0/12,DIRECT
IP-CIDR,192.168.0.0/16,DIRECT
IP-CIDR6,::1/128,DIRECT
IP-CIDR6,fc00::/7,DIRECT
IP-CIDR6,fe80::/10,DIRECT
IP-CIDR6,fd00::/8,DIRECT
{% endmacro %}
