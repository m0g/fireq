### mongod
add() {
    _skip_install mongodb-org-server && return 0

    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" \
        > /etc/apt/sources.list.d/mongodb-org-3.2.list

    apt-get -y update
    apt-get -y install --no-install-recommends mongodb-org-server

    systemctl enable mongod
}
add

# tune mongo
config=/etc/mongod.conf
[ -f "${config}.bak" ] || mv $config $config.bak
cat << EOF > $config
storage:
  dbPath: /var/lib/mongodb
  journal:
    enabled: true
  engine: wiredTiger

systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

net:
  port: 27017
  bindIp: 0.0.0.0
EOF
systemctl restart mongod
