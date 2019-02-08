FROM nginx:stable

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./site.conf /etc/nginx/conf.d/default.conf

RUN rm -rf /var/lib/apt/lists/*