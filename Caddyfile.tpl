# Labels (hosts) are substituded in start-caddy.sh
proxy / {$TARGET_URL} {
       transparent
       websocket
}

log stdout
errors stderr
