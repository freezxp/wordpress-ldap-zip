FROM wordpress

RUN set -x \
	&& apt-get update \
	&& apt-get install -y libldap2-dev zlib1g-dev \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
	&& docker-php-ext-install ldap \
  && docker-php-ext-install zip \
  && apt-get purge -y --auto-remove libldap2-dev \
	&& rm -rf /var/lib/apt/lists/*
