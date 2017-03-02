echo "Installing LOCKSS-O-Matic"

# Create the PLN staging server database
echo "CREATE DATABASE lomtest DEFAULT CHARSET utf8" | mysql -uroot -proot

cd /var/www/html
mkdir lom
git clone https://github.com/ubermichael/lockss-o-matic.git lom
cp /vagrant/lom_parameters.yml.dist /var/www/html/lom/app/config/parameters.yml.dist
cd lom
/usr/bin/composer install

# Prepare the staging server environment
chmod -R 777 /var/www/html/lom/app/cache
chmod -R 777 /var/www/html/lom/app/logs
php app/console doctrine:schema:update --force
php app/console fos:user:create --super-admin admin@example.com admin Admin Example.com

# mysql -uroot -pojs symfony < /vagrant/pkppln_db_terms_of_use.sql

echo "Log into LOCKSS-O-Matic at http://localhost:8000/lom/web/app.php with admin@example.com / admin"
