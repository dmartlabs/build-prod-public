FROM asia.gcr.io/meradmart-prod/distroless-nginx:1.19.6
COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY /build usr/share/nginx/html
# use the following for debug when using base-debian10:debug image
#RUN ["/busybox/sh", "-c", "chown -R 1001 /var/cache/nginx"]
#RUN ["/busybox/sh", "-c", "chown -R 1001 /var/run"]
#RUN ["/busybox/sh", "-c", "cat /etc/nginx/nginx.conf"]
EXPOSE 8080
STOPSIGNAL SIGTERM
ENTRYPOINT ["nginx", "-g", "daemon off;"]