#!  /bin/bash
SITE_TITLE="Dev Site"
ADMIN_USER=admin
ADMIN_PASS=password
ADMIN_EMAIL="admin@localhost.com"

cd /var/www/html;
#wp core download;
wp core install --url="localhost:8080" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_email="$ADMIN_EMAIL" --admin_password="$ADMIN_PASS" --skip-email;