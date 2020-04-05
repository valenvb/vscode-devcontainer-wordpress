#!  /bin/bash
SITE_TITLE="Dev Site"
ADMIN_USER=admin
ADMIN_PASS=password
ADMIN_EMAIL="admin@localhost.com"
WP_RESET=true


echo "Setting up WordPress"
cd /var/www/html;
if $WP_RESET ; then
    echo "Resetting WP"
    wp db reset --yes
    rm wp-config.php;
fi

if [ ! -f wp-config.php ]; then 
    echo "Configuring";
    wp config create --dbhost="db" --dbname="wordpress" --dbuser="wp_user" --dbpass="wp_pass" --skip-check;
    wp core install --url="http://localhost:8080" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_email="$ADMIN_EMAIL" --admin_password="$ADMIN_PASS" --skip-email;
else
    echo "Already configured"
fi