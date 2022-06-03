FROM koenkk/zigbee2mqtt:1.25.2

# install default configuration for first boot
# future changes must be made via the UI
COPY configuration.yaml /app/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "/sbin/tini", "--", "node", "index.js"]
