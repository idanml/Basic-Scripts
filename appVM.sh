apt-get update
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y git
cd /home/idanml/
mkdir app
cd app/
git clone https://github.com/idanml/node-weight-tracker.git
touch .env
