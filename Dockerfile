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
                && bower install --allow-root \
                && mv config.js.sample config.js \
                && sed -i '3c host:"mongo",' config.js \
                && sed -i '11c email:"cnstou@gmail.com",' config.js \
                && sed -i '12c password:"xxxx"' config.js \
                && sed -i '18c webaddress:"http://0.0.0.0:3884"' config.js \
                && sed -i '21c http:3884,' config.js


ENTRYPOINT ["node", "server"]
EXPOSE 3884
