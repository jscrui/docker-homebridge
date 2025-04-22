#!/bin/sh

CONFIG_PATH="/homebridge/config.json"

# If the config.json file does not exist, we copy it from the defaults
if [ ! -f "$CONFIG_PATH" ]; then
  echo "➡️ No config.json found. Copying default config..."
  cp /defaults/config.json "$CONFIG_PATH"
else
  echo "✅ Existing config.json found. Not overwriting."
fi

# Run original entrypoint
exec /init
