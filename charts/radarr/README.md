# Radarr

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.0.4.10291](https://img.shields.io/badge/AppVersion-6.0.4.10291-informational?style=flat-square)

A fork of Sonarr to work with movies à la Couchpotato

## Description

Radarr is a movie collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new movies and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.

## Installation

### Add Helm Repository

```bash
helm repo add jespernohr https://jespernohr.github.io/helm-charts
helm repo update
```

### Install Chart

To install the chart with the release name `radarr`:

```bash
helm install radarr jespernohr/radarr
```

The command deploys radarr on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

### Upgrade Chart

```bash
helm upgrade radarr jespernohr/radarr
```

### Uninstall Chart

```bash
helm uninstall radarr
```

This removes all the Kubernetes components associated with the chart and deletes the release.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| | kubernetes | >=1.19.0-0 |

## Parameters

### Global Parameters

| Name | Description | Value |
|------|-------------|-------|
| `replicaCount` | Number of replicas | `1` |
| `image.repository` | Radarr image repository | `lscr.io/linuxserver/radarr` |
| `image.pullPolicy` | Radarr image pull policy | `IfNotPresent` |
| `image.tag` | Radarr image tag (immutable tags are recommended) | `6.0.4-ls206` |
| `imagePullSecrets` | Specify docker-registry secret names as an array | `[]` |
| `nameOverride` | String to partially override radarr.fullname template | `""` |
| `fullnameOverride` | String to fully override radarr.fullname template | `""` |

### Environment Variables

| Name | Description | Value |
|------|-------------|-------|
| `env.TZ` | Set the container timezone | `UTC` |
| `env.PUID` | User ID for the container user | `1000` |
| `env.PGID` | Group ID for the container user | `1000` |

### Service Account

| Name | Description | Value |
|------|-------------|-------|
| `serviceAccount.create` | Specifies whether a service account should be created | `true` |
| `serviceAccount.annotations` | Annotations to add to the service account | `{}` |
| `serviceAccount.name` | The name of the service account to use | `""` |

### Security Context

| Name | Description | Value |
|------|-------------|-------|
| `podAnnotations` | Annotations to add to the pod | `{}` |
| `podSecurityContext` | Pod security context | `{}` |
| `securityContext` | Security context for the container | `{}` |

### Service

| Name | Description | Value |
|------|-------------|-------|
| `service.type` | Service type | `ClusterIP` |
| `service.port` | Service port | `7878` |

### Ingress

| Name | Description | Value |
|------|-------------|-------|
| `ingress.enabled` | Enable ingress record generation | `false` |
| `ingress.className` | IngressClass that will be be used to implement the Ingress | `""` |
| `ingress.annotations` | Additional annotations for the Ingress resource | `{}` |
| `ingress.hosts` | An array with the list of hostnames to be covered with the ingress record | See values.yaml |
| `ingress.tls` | TLS configuration for additional hostnames to be covered with the ingress record | `[]` |

### Persistence

| Name | Description | Value |
|------|-------------|-------|
| `persistence.enabled` | Enable persistence for config | `true` |
| `persistence.storageClass` | Storage class for config volume | `""` |
| `persistence.accessMode` | Access mode for config volume | `ReadWriteOnce` |
| `persistence.size` | Size for config volume | `1Gi` |
| `persistence.annotations` | Annotations for config PVC | `{}` |

### Media Persistence

| Name | Description | Value |
|------|-------------|-------|
| `persistence.media.enabled` | Enable media volume | `false` |
| `persistence.media.existingClaim` | Existing PVC name for media | `""` |
| `persistence.media.storageClass` | Storage class for media volume | `""` |
| `persistence.media.accessMode` | Access mode for media volume | `ReadWriteOnce` |
| `persistence.media.size` | Size for media volume | `50Gi` |
| `persistence.media.annotations` | Annotations for media PVC | `{}` |

### Downloads Persistence

| Name | Description | Value |
|------|-------------|-------|
| `persistence.downloads.enabled` | Enable downloads volume | `false` |
| `persistence.downloads.existingClaim` | Existing PVC name for downloads | `""` |
| `persistence.downloads.storageClass` | Storage class for downloads volume | `""` |
| `persistence.downloads.accessMode` | Access mode for downloads volume | `ReadWriteOnce` |
| `persistence.downloads.size` | Size for downloads volume | `10Gi` |
| `persistence.downloads.annotations` | Annotations for downloads PVC | `{}` |

### Health Checks

| Name | Description | Value |
|------|-------------|-------|
| `probes.liveness.enabled` | Enable liveness probe | `true` |
| `probes.readiness.enabled` | Enable readiness probe | `true` |
| `probes.startup.enabled` | Enable startup probe | `true` |

### Resources

| Name | Description | Value |
|------|-------------|-------|
| `resources` | CPU/Memory resource requests/limits | `{}` |

### Autoscaling

| Name | Description | Value |
|------|-------------|-------|
| `autoscaling.enabled` | Enable horizontal pod autoscaler | `false` |
| `autoscaling.minReplicas` | Minimum number of replicas | `1` |
| `autoscaling.maxReplicas` | Maximum number of replicas | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Target CPU utilization percentage | `80` |

### Metrics

| Name | Description | Value |
|------|-------------|-------|
| `metrics.enabled` | Enable metrics collection | `false` |
| `metrics.exporter.image.repository` | Exportarr image repository | `ghcr.io/onedr0p/exportarr` |
| `metrics.exporter.image.tag` | Exportarr image tag | `v2.0.1` |
| `metrics.serviceMonitor.enabled` | Enable ServiceMonitor for Prometheus Operator | `false` |
| `metrics.prometheusRule.enabled` | Enable PrometheusRule for Prometheus Operator | `false` |

### Node Selection

| Name | Description | Value |
|------|-------------|-------|
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Tolerations for pod assignment | `[]` |
| `affinity` | Affinity for pod assignment | `{}` |

## Configuration

### Basic Setup

The default configuration includes:
- Radarr web UI accessible on port 7878
- Config persistence enabled with 1Gi storage
- LinuxServer.io Docker image with the latest stable version
- No ingress configured by default

### Storage Configuration

For a complete media server setup, you'll want to enable persistent storage for your media and downloads:

```yaml
persistence:
  media:
    enabled: true
    size: 500Gi
    storageClass: "fast-ssd"
  downloads:
    enabled: true
    size: 100Gi
    storageClass: "fast-ssd"
```

### Ingress Configuration

To expose Radarr via ingress:

```yaml
ingress:
  enabled: true
  className: "nginx"
  annotations:
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-secret: radarr-auth
  hosts:
    - host: radarr.example.com
      paths:
        - path: /
          pathType: Prefix
  tls:
    - secretName: radarr-tls
      hosts:
        - radarr.example.com
```

### Metrics and Monitoring

Enable metrics collection with Prometheus:

```yaml
metrics:
  enabled: true
  serviceMonitor:
    enabled: true
    labels:
      release: prometheus
  prometheusRule:
    enabled: true
    labels:
      release: prometheus
```

### Environment Variables

Common environment variables you might want to set:

```yaml
env:
  TZ: "America/New_York"
  PUID: "1001"
  PGID: "1001"
```

## Examples

### Minimal Installation

```bash
helm install radarr jespernohr/radarr
```

### Production Setup

```yaml
# values.yaml
persistence:
  media:
    enabled: true
    size: 2Ti
    existingClaim: "media-storage"
  downloads:
    enabled: true
    size: 500Gi
    existingClaim: "downloads-storage"

ingress:
  enabled: true
  className: "traefik"
  hosts:
    - host: radarr.homelab.local
      paths:
        - path: /
          pathType: Prefix

resources:
  limits:
    cpu: 2000m
    memory: 2Gi
  requests:
    cpu: 100m
    memory: 512Mi

metrics:
  enabled: true
  serviceMonitor:
    enabled: true
```

```bash
helm install radarr jespernohr/radarr -f values.yaml
```

## Upgrading

### From k8s-at-home Chart

If you're migrating from the k8s-at-home/radarr chart, note these changes:
- Image repository changed to LinuxServer.io format
- Some value paths may have changed
- New metrics configuration options
- Enhanced persistence options

Make sure to backup your configuration before upgrading!

## Troubleshooting

### Common Issues

1. **Permission Issues**: Make sure PUID and PGID match your storage permissions
2. **Storage Issues**: Verify your PVC claims are bound and accessible
3. **Network Issues**: Check that your indexers and download clients are reachable

### Logs

View application logs:
```bash
kubectl logs -f deployment/radarr
```

### Health Checks

The chart includes health check endpoints at `/ping` for monitoring pod health.

## Support

- [Radarr Documentation](https://wiki.servarr.com/radarr)
- [LinuxServer.io Docker Image](https://docs.linuxserver.io/images/docker-radarr)
- [GitHub Issues](https://github.com/jespernohr/helm-charts/issues)

## License

This chart is licensed under the MIT License. See the original Radarr project for its licensing terms.