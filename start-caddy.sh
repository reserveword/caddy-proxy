#!/bin/sh

if [ -n "$VIRTUAL_HOST" ]; then
  echo $VIRTUAL_HOST > /etc/Caddyfile
elif [ -n "$VIRTUAL_HOSTS" ]; then
  VIRTUAL_HOST=${VIRTUAL_HOSTS}$'\n'${AppName}.herokuapp.com
  echo $VIRTUAL_HOSTS > /etc/Caddyfile
else
  #echo ERROR: no VIRTUAL_HOSTS or VIRTUAL_HOST env var provided >>/dev/stderr
  VIRTUAL_HOST=${AppName}.herokuapp.com
fi

cat /etc/Caddyfile.tpl >> /etc/Caddyfile

if [ -n "$OTHER_DNS_API_ENV" ]; then
  $(echo "export $a")
fi
if [ -n "$USE_ACME_SH" ]; then
  acme.sh --issue --dns $USE_ACME_SH $(echo $VIRTUAL_HOST | awk '{print "-b " $0}')
fi

exec /usr/bin/caddy -quic -agree --conf /etc/Caddyfile --log stdout $@
