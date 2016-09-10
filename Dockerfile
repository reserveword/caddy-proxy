FROM abiosoft/caddy
EXPOSE 80 443 80/udp 443/udp

ENV CADDYPATH /srv
COPY Caddyfile /etc/Caddyfile
CMD ["-quic", "-agree", "--conf", "/etc/Caddyfile"]
