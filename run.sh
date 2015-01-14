#! /bin/bash -ex

if [ -n "$TOR_PORT_9050_TCP_ADDR" ] && [ -n "$TOR_PORT_9050_TCP_PORT" ]; then
  sed -i '/^socksParentProxy.*$/d' /etc/polipo/config
  echo "socksParentProxy = \"$TOR_PORT_9050_TCP_ADDR:$TOR_PORT_9050_TCP_PORT\"" >> /etc/polipo/config
fi

sed -i '/^allowedClients.*$/d' /etc/polipo/config

if [ -n "$POLIPO_ALLOWEDCLIENTS" ]; then
  echo "allowedClients = $POLIPO_ALLOWEDCLIENTS" >> /etc/polipo/config
fi

/usr/bin/polipo -c /etc/polipo/config 2>&1
