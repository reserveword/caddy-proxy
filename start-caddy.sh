#!/bin/sh

if [ -n "$VIRTUAL_HOST" ]; then
  echo $VIRTUAL_HOST > /etc/Caddyfile
elif [ -n "$VIRTUAL_HOSTS" ]; then
  echo $VIRTUAL_HOSTS > /etc/Caddyfile
else
  echo ERROR: no VIRTUAL_HOSTS or VIRTUAL_HOST env var provided >>/dev/stderr
  exit 1
fi

cat /etc/Caddyfile.tpl >> /etc/Caddyfile

exec /usr/bin/caddy -quic -agree --conf /etc/Caddyfile --log stdout $@
