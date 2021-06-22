#!/usr/bin/with-contenv bash
set -e

# set a hostname for mDNS (default to homeassistant.local)
if [ -n "${DEVICE_HOSTNAME}" ]
then
    curl -X PATCH --header "Content-Type:application/json" \
        --data "{\"network\": {\"hostname\": \"${DEVICE_HOSTNAME}\"}}" \
        "${BALENA_SUPERVISOR_ADDRESS}/v1/device/host-config?apikey=${BALENA_SUPERVISOR_API_KEY}" || true
fi
