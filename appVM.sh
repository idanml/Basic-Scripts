curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get update
apt-get upgrade -y
apt-get install -y nodejs
apt-get install -y npm
apt-get install  -y default-jdk
npm install pm2 -g
cd /home/idanml/
mkdir jenkins
chmod -R 777 /home/idanml/jenkins/
