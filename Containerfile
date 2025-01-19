FROM docker.io/library/caddy:2.9.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/porkbun \
    --with github.com/mholt/caddy-dynamicdns

FROM docker.io/library/caddy:2.9.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
