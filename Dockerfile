FROM abiosoft/caddy
EXPOSE 80 443 80/udp 443/udp

ENV CADDYPATH /srv
COPY Caddyfile.tpl /etc/
COPY start-caddy.sh /usr/bin

RUN curl https://get.acme.sh | sh

ENTRYPOINT ["/usr/bin/start-caddy.sh"]
