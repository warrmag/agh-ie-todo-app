#!/bin/sh
composer -vvv install --prefer-dist --working-dir=/app

php bin/console doctrine:database:create  --if-not-exists  --no-interaction
php bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration
php bin/console doctrine:fixtures:load --no-interaction

exec "$@"
