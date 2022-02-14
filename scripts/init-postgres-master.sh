#!/bin/bash
reppassword=$1
echo " Creating replication user." >> INSTALL_LOG
# Create archive location for replication
mkdir /var/lib/postgresql/archive
chown postgres:postgres /var/lib/postgresql/archive
# PostgreSQL - Create the replication user
echo " Using password: $reppassword" >> INSTALL_LOG
sudo -u postgres -H -- psql -c "CREATE ROLE repuser PASSWORD 'md5${reppassword}' REPLICATION LOGIN;"