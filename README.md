# balena-homeassistant

homeassistant stack for balenaCloud

## Requirements

- RaspberryPi3, RaspberryPi4, or a similar arm64 device supported by BalenaCloud

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balena CLI.

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|(optional) inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location|

## Usage

## Contributing

Please open an issue or submit a pull request with any features, fixes, or changes.

## Author

Kyle Harding <https://klutchell.dev>

## Acknowledgments

- <https://home-assistant.io>
- <https://mosquitto.org/>
- <https://github.com/CausticLab/hass-configurator-docker>

## License

[MIT License](./LICENSE)
