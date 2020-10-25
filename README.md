Caddy Proxy
===========


[![Deploy to Heroku]()](https://heroku.com/deploy)

[Caddy Server](https://caddyserver.com/) in reverse proxy mode

Docker Compose example
----------------------

```yaml
version: "2"

services:
  proxy:
    image: dockhero/caddy-proxy
    ports:
      - "80:80"
      - "80:80/udp"
      - "443:443"
      - "443:443/udp"
    volumes:
      - caddy_certificates:/srv
    environment:
      VIRTUAL_HOSTS: https://${DOCKHERO_HOST}
      TARGET_URL: http://app:8080

  app:
    image: dockhero/dockhero-docs:hello

volumes:
  caddy_certificates:
    driver: local
```


Use as HTTP/2 and QUIC proxy for your Heroku app
------------------------------------------------

Use [Dockhero](https://elements.heroku.com/addons/dockhero) Heroku add-on with
[caddy-proxy](https://github.com/dockhero/generators/tree/master/caddy-proxy) example stack

See [example](https://github.com/dockhero/quic-protocol-demo)
