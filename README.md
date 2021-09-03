# balena-homeassistant

[Home Assistant](https://www.home-assistant.io/) - Open source home automation that puts local control and privacy first.

## Hardware Required

- Raspberry Pi 3/4 (64-bit)
- 32GB MicroSD card or larger

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![deploy with balena](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/klutchell/balena-homeassistant)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application,
flashing a device, downloading the project and pushing it via the [balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

| Name           | Example           | Purpose                                                                                                                     |
| -------------- | ----------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `TZ`           | `America/Toronto` | (optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location |
| `SET_HOSTNAME` | `homeassistant`   | Set a custom hostname on application start.                                                                                 |

## Usage

Once your device joins the fleet you'll need to allow some time for it to download the various services.

When it's done you should be able to access the access the app at <http://homeassistant.local>.

Documentation for Home Assistant can be found at <https://www.home-assistant.io/docs/>.

### InfluxDB & Grafana

You may optionally duplicate the Home Assistant sensor data to an
influx database and generate graphs in the Grafana dashboard.

Start by opening a terminal to the `influxdb` service and creating
a database and user credentials.

```bash
influx

create database homeassistant
show databases

create user homeassistant with password 'homeassistant'
show users

grant all on homeassistant to homeassistant
exit
```

Then the following block to your Home Assistant configuration.yml to
transfer all state changes to an external InfluxDB database

```yaml
# https://www.home-assistant.io/integrations/influxdb/
influxdb:
  host: influxdb
  port: 8086
  database: homeassistant
  username: !secret influxdb_user
  password: !secret influxdb_password
  max_retries: 3
  include:
    domains:
      - sensor
```

The Grafana dashboard should be available at <http://homeassistant.local:3000> and the default credentials are `admin/admin`.

## Extras

Works well with the [duplicati block](https://github.com/klutchell/balenablocks-duplicati) to make encrypted snapshots offsite!

Add the following services and volumes to the existing docker-compose file in this project.

```yaml
services:
  duplicati:
    image: linuxserver/duplicati:latest
    environment:
      PUID: "0"
      PGID: "0"
      CLI_ARGS: --webservice-interface=any
    ports:
      - 8200:8200/tcp
    volumes:
      - duplicati:/config
      - config:/source

volumes:
  duplicati:
```

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.
