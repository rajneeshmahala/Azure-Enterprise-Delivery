# Use the official Keycloak image as a base
FROM keycloak/keycloak:latest

# Copy your custom themes, configurations, or scripts (if any)
COPY themes /opt/keycloak/themes

WORKDIR /opt/keycloak/bin/
# Expose ports (optional since it's already exposed in the base image)
EXPOSE 8080 8443

# Start Keycloak
CMD ["start-dev"]
