#!/bin/bash

# install dependencies and build rtl_433
sudo apt update
sudo apt install -y libtool libusb-1.0-0-dev librtlsdr-dev rtl-sdr build-essential cmake pkg-config
cd rtl_433/
mkdir build
cd build
cmake ..
make
sudo make install

# install grafana and influx
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

sudo apt update
sudo apt install -y grafana influxdb

# start grafana and influx at startup
sudo systemctl enable grafana-server
sudo systemctl unmask influxdb
sudo systemctl enable influxdb

# start grafana and influx now to keep installing
sudo systemctl start grafana-server
sudo systemctl start influxdb

# setup influxdb
influx -execute 'CREATE DATABASE smoker'

# setup script to log temp data
sudo cp log-smoker.sh /usr/sbin/
sudo cp log-smoker.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable log-smoker

