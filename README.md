## TemPi
A quick repo for setting up a grafana dashboard for a wireless thermomoter for a smoker

### Required Materials
* RaspberryPi: While anything would work, I used a 3-A+ since I only need the 1 USB port for the rtl-sdr, and wifi. A zero-w would work, but you'd need to use an OTG adapter for the SDR
* rtl-sdr: I used [this one](https://www.amazon.com/RTL-SDR-Blog-RTL2832U-Software-Defined/dp/B011HVUEME/) from Amazon, but any will work
* Wireless Thermometer: [this one]](https://www.amazon.com/gp/product/B014DAVHSQ) from Amazon, so if you have a different one you might need to change some stuff...
* Smoker: Mine is a Taeger Ranger, which works ok, but if I had more room I would get something bigger (one day I'll get an actual offset smoker and become "legit")

### Setup Instructions
Pretty straight-forward. Just run the script. Takes care of setting up `rtl_433`, `influx`, and `grafana`. Also creates a script to automatically import results from thermopen into `influx`

```
ssh pi@<RASPBERRY_PI_IP>
git clone https://github.com/gmackie/tempi.git
cd tempi
./setup.sh
```

At this point you should be able to open up the grafana dashboard at 
```
http://<RASPBERRY_PI_IP>:3000
```

### Future Work
While this is just a simple all-in-one solution to allow remote monitoring of your smoker temps, ideally this would be setup with alerts, thresholds to set, ability to export to a "home" influxdb, etc.

This repo will hopefully evolve over time as I continue to play with my smoker
