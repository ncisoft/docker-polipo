#! /bin/bash
sed -i '/^allowedClients.*$/d' /etc/polipo/config

if [ -n "$POLIPO_ALLOWEDCLIENTS" ]; then
  echo "allowedClients = $POLIPO_ALLOWEDCLIENTS" >> /etc/polipo/config
fi

/usr/bin/polipo -c /etc/polipo/config
