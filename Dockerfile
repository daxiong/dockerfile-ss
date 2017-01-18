FROM debian:wheezy

RUN apt-get update \
                && apt-get install -y --no-install-recommends ca-certificates wget curl git \
                && curl -sL https://deb.nodesource.com/setup_6.x | bash \
                && apt-get install -y nodejs

RUN mkdir -p /data/ \
                && cd /data/ \
                && git clone -b version1 https://github.com/shadowsocks/shadowsocks-manager.git ./shadowsocks-manager \
                && npm install -g bower \
                && cd shadowsocks-manager \
                && npm install \
                && sed -i '11a \ "resolutions": { "angular": "1.6.1" },' bower.json \
                && bower install --allow-root

COPY config.js /data/shadowsocks-manager/config.js
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3884
