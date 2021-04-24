curl -sL https://deb.nodesource.com/setup_14.x | -E bash -
apt-get update
apt-get upgrade
apt-get -y install postgresql
echo "host    all             all             0.0.0.0/0                    md5" | tee -a /etc/postgresql/*/main/pg_hba.conf
echo "listen_addresses = '*'" | tee -a /etc/postgresql/*/main/postgresql.conf
-u postgres psql postgres
\password postgres
p@ssw0rd42
\q
systemctl enable postgresql