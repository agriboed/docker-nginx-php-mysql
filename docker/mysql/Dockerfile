FROM mysql/mysql-server

VOLUME /var/lib/mysql

RUN mysqld --initialize-insecure

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

EXPOSE 3306

ENTRYPOINT ["entrypoint.sh"]

CMD ["mysqld"]