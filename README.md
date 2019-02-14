*** Nginx 1.15.8 + PHP 7.3 + Composer 1.8.4 + Xdebug 2.7 + MySQL 8.0 under Docker ***

* Install Docker and Docker-compose then run command in CLI:

`docker-compose build`

* In case you're going to use MySQL as well then run instead of command above:

`docker-compose -f docker-compose.mysql build`

* Then run:

`docker-compose up -d`

* After open your browser with:

`http://localhost/`

* Note: for MySQL initial password see documentation here:

`https://hub.docker.com/r/mysql/mysql-server/`