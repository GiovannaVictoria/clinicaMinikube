FROM mysql:8.0.41

LABEL maintainer="giovannavictoriarossetto@gmail.com"

COPY schema.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
