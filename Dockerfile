
FROM openresty/openresty:alpine-fat
RUN mkdir /var/log/nginx
RUN apk add --no-cache openssl-dev
RUN apk add --no-cache git
RUN apk add --no-cache gcc
RUN apk add --no-cache ca-certificates
RUN luarocks install lua-resty-openidc
ADD ./nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ENTRYPOINT ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
