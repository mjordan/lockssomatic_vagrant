echo "Installing LOCKSS-O-Matic"

# Create the PLN staging server database
echo "CREATE DATABASE lomtest DEFAULT CHARSET utf8" | mysql -uroot -proot

cd /var/www/html
mkdir lom
git clone https://github.com/ubermichael/lockss-o-matic.git lom
cp /vagrant/lom_parameters.yml.dist /var/www/html/lom/app/config/parameters.yml.dist
cd lom
/usr/bin/composer install

# Adjust some directory permissions.
chmod -R 777 /var/www/html/lom/app/cache
chmod -R 777 /var/www/html/lom/app/logs

# Run some LOM console commands to load the PLN and boxes fixtures.
mkdir /var/www/html/lom/vagrant
mkdir /var/www/html/lom/vagrant/SampleData
cp /vagrant/lom_fixtures/* /var/www/html/lom/vagrant/SampleData
php app/console doctrine:schema:update --force
php app/console doctrine:fixtures:load --fixtures=/var/www/html/lom/vagrant/SampleData --append

# Run some LOM console commands to populate a user and the LOM LOCKSS plugin.
php app/console fos:user:create --super-admin admin@example.com admin Admin Example.com
php app/console fos:user:promote admin@example.com ROLE_ADMIN
php app/console lom:import:plugin /vagrant/LockssOMaticPlugin.jar

echo "Log into LOCKSS-O-Matic at http://localhost:8000/lom/web/app.php with admin@example.com / admin"
