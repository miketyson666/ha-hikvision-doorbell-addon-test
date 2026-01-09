#!/usr/bin/with-contenv bashio

# Parse addon options
DOORBELL_HOST=$(bashio::config 'doorbell_host')
DOORBELL_USERNAME=$(bashio::config 'doorbell_username')
DOORBELL_PASSWORD=$(bashio::config 'doorbell_password')
SERVER_PORT=$(bashio::config 'server_port')


# Validate required options
if [ -z "$DOORBELL_HOST" ]; then
    bashio::log.error "doorbell_host is required"
    exit 1
fi

if [ -z "$DOORBELL_PASSWORD" ]; then
    bashio::log.error "doorbell_password is required"
    exit 1
fi

# Generate server config
bashio::log.info "Generating server configuration..."
cat > /data/config.yaml << EOF
server:
  host: "0.0.0.0"
  port: ${SERVER_PORT}

hikvision:
  host: "${DOORBELL_HOST}"
  username: "${DOORBELL_USERNAME}"
  password: "${DOORBELL_PASSWORD}"
EOF

# Install integration to Home Assistant config (includes bundled card)
bashio::log.info "Installing Hikvision Doorbell integration..."
mkdir -p /config/custom_components
cp -r /custom_components/hikvision_doorbell /config/custom_components/

bashio::log.info "Starting Hikvision Doorbell server on port ${SERVER_PORT}..."
exec /usr/bin/doorbell-server -config /data/config.yaml
