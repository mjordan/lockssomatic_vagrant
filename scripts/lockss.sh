echo "Installing the LOCKSS daemon"
cd /home/vagrant

# Clone the LOCKSS daemon repository
git clone --depth 1 --branch master https://github.com/lockss/lockss-daemon.git
chown -R vagrant:vagrant lockss-daemon

# Set up ant and build test frameworks
cd /tmp
git clone https://github.com/mjordan/lockss-o-matic-generic-plugin.git
cd /home/vagrant/lockss-daemon
mkdir plugins/src/ca/sfu/lib/plugin/lockssomatic
cp /tmp/lockss-o-matic-generic-plugin/ca/sfu/lib/plugin/LockssOMaticPlugin.xml plugins/src/ca/sfu/lib/plugin/lockssomatic

cd /home/vagrant/lockss-daemon
cp lib/junit.jar /usr/share/ant/lib

# Setting the JAVA_HOME environment variable in /env/environment doesn't apply
# to the deployment scripts, so we set it here in order to run ant.
export JAVA_HOME="/usr/lib/jvm/java-7-oracle"

# Build test frameworks
ant btf
