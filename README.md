# balena-homeassistant

[homeassistant](https://www.home-assistant.io/) stack for balenaCloud

## Requirements

- RaspberryPi3, RaspberryPi4, or a similar arm64 device supported by BalenaCloud

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balena CLI.

### Environment Variables

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|
|`HASS_SERVER`|`http://homeassistant.local:8123`|(optional) specify homassistant server endpoint|
|`HASS_TOKEN`|`longandsafesecret`|(optional) specify homeassistant server long-lived access token|
|`AUTHORIZED_KEYS_URL`|`https://github.com/<username>.keys`|(optional) provide a url to a list of public ssh keys for authentication|

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

## Author

Kyle Harding <https://klutchell.dev>

[Buy me a beer](https://kyles-tip-jar.myshopify.com/cart/31356319498262:1?channel=buy_button)

[Buy me a craft beer](https://kyles-tip-jar.myshopify.com/cart/31356317859862:1?channel=buy_button)

## Acknowledgments

- <https://hub.docker.com/r/homeassistant/raspberrypi4-homeassistant>
- <https://hub.docker.com/r/arm64v8/eclipse-mosquitto>
- <https://hub.docker.com/r/linuxserver/duplicati>

## License

[MIT License](./LICENSE)
