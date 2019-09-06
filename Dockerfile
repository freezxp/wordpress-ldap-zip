FROM wordpress

RUN set -x \
	&& apt-get update \
	&& apt-get install -y libldap2-dev zlib1g-dev zip libzip-dev \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
	&& docker-php-ext-install ldap \
	&& docker-php-ext-configure zip --with-libzip \
  	&& docker-php-ext-install zip \
  	&& apt-get purge -y --auto-remove libldap2-dev \
	&& rm -rf /var/lib/apt/lists/*
	
RUN touch /usr/local/etc/php/conf.d/uploads.ini \
    && echo "upload_max_filesize = 20M;" >> /usr/local/etc/php/conf.d/uploads.ini
