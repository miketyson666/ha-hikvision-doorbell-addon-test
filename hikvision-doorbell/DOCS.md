# Hikvision Doorbell Addon

Two-way audio for Hikvision doorbells with WebRTC.

## Configuration

| Option | Required | Default | Description |
|--------|----------|---------|-------------|
| `doorbell_host` | Yes | - | IP address of your Hikvision doorbell |
| `doorbell_username` | No | `admin` | Username for doorbell authentication |
| `doorbell_password` | Yes | - | Password for doorbell authentication |
| `server_port` | No | `8080` | Port for the WebRTC server |

## Post-Installation Setup

After starting the addon:

### 1. Restart Home Assistant

The addon automatically installs the integration and card files. Restart Home Assistant to load them.

### 2. Add the Integration

1. Go to **Settings** → **Devices & Services**
2. Click **Add Integration**
3. Search for **Hikvision Doorbell**
4. Enter the server URL: `http://localhost:8080`

### 3. Add the Card to Your Dashboard

The Lovelace card is automatically registered. Simply add it to your dashboard:

```yaml
type: custom:hikvision-doorbell-card
entity: camera.your_doorbell_camera
```

## Troubleshooting

### Microphone not working

WebRTC requires HTTPS. Ensure you're accessing Home Assistant over HTTPS.

### Connection failed

- Verify the doorbell IP address is correct
- Check that the doorbell is on the same network
- Verify the username and password

### Card not appearing

- Clear your browser cache
- Check the browser console for errors
- The card is auto-registered at `/hikvision_doorbell/hikvision-doorbell-card.js`

## Network Requirements

This addon uses host networking for WebRTC compatibility. The server binds to the configured port (default: 8080) on all interfaces.
