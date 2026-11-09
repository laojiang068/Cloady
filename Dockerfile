FROM teddysun/xray:latest AS builder
FROM alpine:latest
RUN apk add --no-cache ca-certificates tzdata wget unzip
COPY --from=builder /usr/bin/xray /usr/bin/xray
COPY --from=builder /usr/share/xray /usr/share/xray
RUN mkdir -p /etc/xray
COPY config.json /etc/xray/config.json
EXPOSE 3000
CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]
