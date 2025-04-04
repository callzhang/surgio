{% macro main(rule, US_node, direct) %}

# Derek's Rules
DOMAIN-SUFFIX,notion.so,{{ rule }}
DOMAIN-SUFFIX,dler.cloud,{{ rule }}
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
DOMAIN-SUFFIX,onetravel.com,{{ rule }}
DOMAIN-SUFFIX,githubusercontent.com,{{ rule }}
DOMAIN-SUFFIX,jsdelivr.net,{{ rule }}
DOMAIN-SUFFIX,ssrcloud.com,{{ rule }}
DOMAIN-SUFFIX,netlify.app,{{ rule }}
DOMAIN-SUFFIX,asuscomm.com,{{ rule }}
DOMAIN-SUFFIX,curiositystream.com,{{ rule }}
DOMAIN-SUFFIX,cvlibs.net,{{ rule }}
DOMAIN-SUFFIX,dler.cloud,{{ rule }}
DOMAIN-SUFFIX,whimsical.com,{{ rule }}
DOMAIN-SUFFIX,producthunt.com,{{ rule }}
DOMAIN-SUFFIX,kosy.onlin,{{ rule }}
DOMAIN-SUFFIX,kosyoffice.com,{{ rule }}
DOMAIN-SUFFIX,linkedin.com,{{ rule }}
DOMAIN-SUFFIX,linkedin.cn,{{ rule }}
DOMAIN-SUFFIX,rss-node.com,{{ rule }}
DOMAIN-SUFFIX,amazonaws.com,{{ rule }}
DOMAIN-SUFFIX,chatpdf.com,{{ rule }}
DOMAIN-SUFFIX,poe.com,{{ rule }}
DIMAIN-SUFFIX,python.org,{{ rule }}
DOMAIN-SUFFIX,scale.com,{{ rule }}
DOMAIN-SUFFIX,scale.ai,{{ rule }}
DOMAIN-SUFFIX,streamlit.io,{{ rule }}
DOMAIN-SUFFIX,vercel.app,{{ rule }}
DOMAIN-SUFFIX,reddit.com,{{ rule }}
DOMAIN-SUFFIX,okx.com,{{ rule }}
DOMAIN-SUFFIX,discord.com,{{ rule }}
DOMAIN-SUFFIX,duckduckgo.com,{{ rule }}
DOMAIN-SUFFIX,yts.mx,{{ rule }}
DOMAIN-SUFFIX,whimsical.com,{{ rule }}
DOMAIN-SUFFIX,huggingface.co,{{ rule }}
DOMAIN-SUFFIX,sentry.io,{{ rule }}
DOMAIN-SUFFIX,contentful.com,{{ rule }}
DOMAIN-SUFFIX,bing.com,{{ rule }}
DOMAIN-SUFFIX,okx.com,{{ rule }}

# Analytics
DOMAIN-SUFFIX,google-analytics.com,{{ rule }}
DOMAIN-SUFFIX,googletagmanager.com,{{ rule }}
DOMAIN-SUFFIX,googletagservices.com,{{ rule }}
DOMAIN-SUFFIX,hm.baidu.com,{{ direct }}

# Telegram
PROCESS-NAME,Telegram,{{ rule }}
PROCESS-PATH,telegram,{{ rule }}

#美国节点
DOMAIN-SUFFIX,puritan.com,{{ US_node }}
DOMAIN-SUFFIX,openai.com,{{ US_node }}
DOMAIN-SUFFIX,coinbase.com,{{ US_node }}
DOMAIN-SUFFIX,remotasks.com,{{ US_node }}
DOMAIN-SUFFIX,losadhwselfff2332dasd.xyz,{{ US_node }}
DOMAIN-SUFFIX,microsoftonline.com,{{ US_node }}
DOMAIN-SUFFIX,bing.com,{{ US_node }}
DOMAIN-SUFFIX,bing.net,{{ US_node }}
DOMAIN-SUFFIX,techcrunch.com,{{ US_node }}
DOMAIN-SUFFIX,scale.com,{{ US_node }}
DOMAIN-SUFFIX,scale.ai,{{ US_node }}
DOMAIN-SUFFIX,techcrunch.com,{{ US_node }}
DOMAIN-SUFFIX,medium.com,{{ US_node }}
DOMAIN-SUFFIX,techcrunch.com,{{ US_node }}
DOMAIN-SUFFIX,discord.com,{{ US_node }}
DOMAIN-SUFFIX,microsoftonline.com,{{ US_node }}
DOMAIN-SUFFIX,live.com,{{ US_node }}
DOMAIN-SUFFIX,msn.cn,{{ US_node }}
DOMAIN-SUFFIX,reddit.com,{{ US_node }}

{% endmacro %}
