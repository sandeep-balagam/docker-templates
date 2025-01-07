FROM nginx:1.27-alpine

# Add self-signed SSL and trust
COPY ssl/ /usr/local/share/ca-certificates/
RUN update-ca-certificates