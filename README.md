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

| Name           | Description                                                                                                       |
| -------------- | ----------------------------------------------------------------------------------------------------------------- |
| `TZ`           | Inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location. |
| `SET_HOSTNAME` | Set a custom hostname on application start. Default is `homeassistant`.                                           |

## Usage

Once your device joins the fleet you'll need to allow some time for it to download the various services.

When it's done you should be able to access the access the app at <http://homeassistant.local:8123>.

Documentation for Home Assistant can be found at <https://www.home-assistant.io/docs/>.

### Services

#### code-server

[Code server](https://hub.docker.com/r/codercom/code-server) is running on port 9000 for editing YAML files directly.

#### mqtt

[Mosquitto](https://mosquitto.org/) is an MQTT broker for Home Assistant listening on port 1883.

#### zigbee2mqtt

[Zigbee2MQTT](https://www.zigbee2mqtt.io/) supports various Zigbee adapters and the Web UI is on port 7000.

#### frigate

[Frigate](https://docs.frigate.video/) is a complete and local NVR designed for Home Assistant with AI object detection. The Web UI is on port 5000.

#### wyze-bridge

Docker container to expose a local RTMP, RTSP, and HLS or Low-Latency HLS stream for ALL your Wyze cameras including the outdoor and doorbell cams. No third-party or special firmware required.

<https://github.com/mrlt8/docker-wyze-bridge>

#### influxdb & grafana

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

#### restic

Rest easy knowing that your application data volumes are automatically and securely backed up to local or cloud storage!

<https://github.com/klutchell/balena-restic>

#### hostname

An utility block to set the hostname of devices running balenaOS.

<https://github.com/balenablocks/hostname>

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.
