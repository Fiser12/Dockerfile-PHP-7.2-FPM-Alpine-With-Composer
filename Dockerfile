FROM php:7.2-fpm-alpine

RUN apk update \
	&& apk add \
		vim \
		bash \
		wget \
		curl \
		bind-tools \
		zlib-dev \
        icu-dev \
		libmemcached-dev \
		g++ \
&& rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Run docker-php-ext-install for available extensions
RUN docker-php-ext-configure intl \
&& docker-php-ext-install pdo pdo_mysql opcache intl