FROM php:8.3-fpm-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN printf '%s\n' '<?php echo "platform-ok"; ?>' > index.php \
    && printf '%s\n' 'ok' > healthz

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -fsS http://127.0.0.1:8080/healthz || exit 1

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
