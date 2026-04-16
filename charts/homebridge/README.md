# Homebridge

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

Homebridge for Kubernetes.

## Installation

```bash
helm repo add jespernohr https://jespernohr.github.io/helm-charts
helm repo update
helm install homebridge jespernohr/homebridge
```

## Configuration

The chart defaults to the official Homebridge Docker image:

- `image.repository`: `homebridge/homebridge`
- `image.tag`: `latest`
- `service.port`: `8581` (Homebridge UI)
