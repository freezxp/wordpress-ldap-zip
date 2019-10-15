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
    	&& echo "file_uploads = On" >> /usr/local/etc/php/conf.d/uploads.ini \
    	&& echo "memory_limit = 100M" >> /usr/local/etc/php/conf.d/uploads.ini \
    	&& echo "upload_max_filesize = 100M" >> /usr/local/etc/php/conf.d/uploads.ini \
    	&& echo "post_max_size = 100M" >> /usr/local/etc/php/conf.d/uploads.ini \
    	&& echo "max_execution_time = 600" >> /usr/local/etc/php/conf.d/uploads.ini
