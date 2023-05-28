FROM php:8.1-fpm
# Defina o nome de usuário, por exemplo: user=bernardo
ARG user=JM7087
ARG uid=1000
# Instale as dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip
# Instale o Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
# Limpe o cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Instale as extensões do PHP
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets
# Obtenha o Composer mais recente
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Crie um usuário de sistema para executar comandos do Composer e Artisan
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user
# Instale o redis
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis
# Defina o diretório de trabalho
WORKDIR /var/www
# Copie as configurações personalizadas do PHP
COPY docker/php/custom.ini /usr/local/etc/php/conf.d/custom.ini
USER $user
