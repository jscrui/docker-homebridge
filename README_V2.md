🧠 Runtime Config Handling (config.json)
This project uses a safe config bootstrapping mechanism to ensure config.json is only initialized once and not overwritten during future deployments.

📁 File Locations

Path	Purpose
/defaults/config.json	The initial config file bundled in the image.
/homebridge/config.json	The actual runtime config used by Homebridge.
⚙️ How It Works
On container startup, the custom entrypoint.sh script checks if /homebridge/config.json exists.

If it doesn't, it copies the bundled /defaults/config.json into place.

If it does exist, it is left untouched — preserving any runtime or UI-based changes you’ve made.

This approach prevents your Homebridge settings from being overwritten on every Railway or Docker redeploy, while still allowing a clean config to be seeded at first boot.

📌 Why This Matters
Platforms like Railway or Docker without volumes rebuild containers often. If you copy config.json directly to /homebridge in the Dockerfile, you'd lose your configuration each time. This mechanism avoids that issue.

