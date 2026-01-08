# Hikvision Doorbell Home Assistant Addon

A Home Assistant OS addon that provides two-way audio communication for Hikvision doorbells using WebRTC.

## Features

- WebRTC-based two-way audio streaming
- Automatic installation of the Home Assistant integration
- Automatic installation of the Lovelace card
- Simple configuration through the Home Assistant UI

## Installation

1. Add this repository to your Home Assistant addon store:
   - Go to **Settings** → **Add-ons** → **Add-on Store**
   - Click the three dots in the top right → **Repositories**
   - Add: `https://github.com/acardace/ha-hikvision-doorbell-addon`

2. Install the **Hikvision Doorbell** addon

3. Configure the addon with your doorbell credentials:
   - `doorbell_host`: IP address of your Hikvision doorbell
   - `doorbell_username`: Username (default: `admin`)
   - `doorbell_password`: Password for your doorbell
   - `server_port`: Port for the WebRTC server (default: `8080`)

4. Start the addon

5. Restart Home Assistant to load the integration

6. Add the integration in Home Assistant:
   - Go to **Settings** → **Devices & Services** → **Add Integration**
   - Search for **Hikvision Doorbell**
   - Configure with the server URL: `http://localhost:8080`

7. Add the card to your dashboard (the Lovelace resource is auto-registered):
   ```yaml
   type: custom:hikvision-doorbell-card
   entity: camera.your_doorbell_camera
   ```

## Requirements

- Home Assistant OS or Supervised installation
- Hikvision doorbell on the same network
- HTTPS access to Home Assistant (required for browser microphone access)

## Architecture

This addon bundles three components:

1. **Doorbell Server**: Go-based WebRTC server for real-time audio
2. **Integration**: Home Assistant custom component for services
3. **Lovelace Card**: UI component for two-way audio control

## License

Apache License 2.0
