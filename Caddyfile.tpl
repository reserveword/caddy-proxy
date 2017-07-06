# Labels (hosts) are substituded in start-caddy.sh
proxy / {$TARGET_URL} {
       transparent
}

log stdout
errors stderr
