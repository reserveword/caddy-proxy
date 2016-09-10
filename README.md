Caddy Proxy
===========

[Caddy Server](https://caddyserver.com/) in reverse proxy mode

Docker Compose example
----------------------

```yaml
version: "2"

services:
  proxy:
    from: dockhero/caddy-proxy
    ports:
      - "80:80"
      - "80:80/udp"
      - "443:443"
      - "443:443/udp"
    volumes:
      - caddy_certificates:/srv
    environment:
      VIRTUAL_HOST: ${DOCKHERO_HOST}
      TARGET_URL: http://app:8080

  app:
    image: dockhero/dockhero-docs:hello

volumes:
  caddy_certificates:
    driver: local
```


Use with Dockhero
-------------------

First install Dockhero addon and plugin

```bash
heroku addons:create dockhero
heroku plugins:install dockhero
heroku dh:wait
```

Then generate the new stack using *helloworld* template

```bash
heroku dh:generate helloworld
```

Now spin up the stack:
```bash
heroku dh:compose up -d
```

and check the logs with

```bash
heroku logs --tail -p dockhero
```

If everything went fine, you should be able to see the app via Dockhero URL:

```bash
heroku dh:open
```
