# Update Ubuntu
apt-get -y update
apt-get -y upgrade

# Install some useful stuff
apt-get -y install python ant ant-optional openssh-server git vim wget curl

# Install LAMP server
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
tasksel install lamp-server
apt-get -y install php5-gd php5-dev php5-xsl php5-curl php5-cli php-pear
pear install Archive_Tar
service apache2 restart

# Install composer
curl -Ss https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer

# Install LOCKSS daemon dependencies
add-apt-repository ppa:webupd8team/java
apt-get update

# Respond to the Oracle Java interactive installer.
debconf-set-selections <<< 'debconf shared/accepted-oracle-license-v1-1 select true'
debconf-set-selections <<< 'debconf shared/accepted-oracle-license-v1-1 seen true'

apt-get install -y oracle-java7-installer
echo 'JAVA_HOME="/usr/lib/jvm/java-7-oracle"' >>  /etc/environment
