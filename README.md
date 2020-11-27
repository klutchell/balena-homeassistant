# balena-homeassistant

[homeassistant](https://www.home-assistant.io/) stack for balenaCloud

## Requirements

- RaspberryPi3, RaspberryPi4, or a similar arm64 device supported by BalenaCloud

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/klutchell/balena-homeassistant&defaultDeviceType=raspberrypi4-64)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application, flashing a device, downloading the project and pushing it via either Git or the [balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|
|`HC_HASS_API_PASSWORD`||(optional) in order for configurator to use API functions you must provide a [long-lived access token](https://developers.home-assistant.io/docs/auth_api/#long-lived-access-token)|

## Usage

### homeassistant

Connect to `http://<device-ip>:8123` to begin using homeassistant.

### configurator

Connect to `http://<device-ip>:3218` to begin using configurator.

### vscode

Connect to `http://<device-ip>:8080` to begin using vscode.

### duplicati

Connect to `http://<device-ip>:8200` to begin using duplicati.

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Acknowledgments

- <https://hub.docker.com/r/homeassistant/home-assistant>
- <https://hub.docker.com/_/eclipse-mosquitto>
- <https://hub.docker.com/r/causticlab/hass-configurator-docker>
- <https://hub.docker.com/r/codercom/code-server>
- <https://hub.docker.com/r/linuxserver/duplicati>

## License

[MIT License](./LICENSE)
