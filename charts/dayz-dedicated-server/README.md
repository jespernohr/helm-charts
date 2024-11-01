
# DayZ Dedicated Server Helm Chart

A Helm chart for deploying a DayZ dedicated server on Kubernetes, using the custom Docker image `ghcr.io/jespernohr/dayz-dedicated-server`.

## Prerequisites

- Kubernetes cluster (v1.18+)
- Helm 3.0+
- A Kubernetes-compatible load balancer (for external access)

## Installation

To install the chart with the release name `my-dayz-server`, use the following command:

```bash
helm install my-dayz-server ./dayz-dedicated-server
```

## Configuration

The following tables list the configurable parameters of the DayZ server chart and their default values.

### General Settings

| Parameter            | Description                           | Default |
|----------------------|---------------------------------------|---------|
| `replicaCount`       | Number of replicas for the server    | `1`     |
| `image.repository`   | Image repository                     | `ghcr.io/jespernohr/dayz-dedicated-server-k8s` |
| `image.tag`          | Image tag                            | `0.1.0` |
| `image.pullPolicy`   | Image pull policy                    | `IfNotPresent` |

### Service Settings

| Parameter              | Description                                     | Default       |
|------------------------|-------------------------------------------------|---------------|
| `service.type`         | Kubernetes Service type                         | `LoadBalancer`|
| `service.ports.game`   | Game port for player connections (UDP)          | `2302`        |
| `service.ports.steam`  | Steam port for server visibility (UDP)          | `8766`        |
| `service.ports.rcon`   | RCON port for remote admin access (TCP)         | `2310`        |

### Resource Settings

| Parameter            | Description               | Default   |
|----------------------|---------------------------|-----------|
| `resources.requests` | Minimum resources required | `{}`      |
| `resources.limits`   | Maximum resources allowed  | `{}`      |

### Environment Variables

The server container accepts the following environment variables to configure Steam account details and game settings.

| Variable         | Description                             | Default     |
|------------------|-----------------------------------------|-------------|
| `STEAMACCOUNT`   | Steam account username (for login)      | `anonymous` |
| `CPUCOUNT`       | Number of CPUs the server can use       | `2`         |
| `PORT`           | Port for the game server (UDP)          | `2302`      |

## Usage

### Updating the Chart

To apply any configuration changes, use the following command:

```bash
helm upgrade my-dayz-server ./dayz-dedicated-server -f values.yaml
```

### Uninstalling the Chart

To uninstall/delete the `my-dayz-server` deployment:

```bash
helm uninstall my-dayz-server
```

### Accessing the Server

The game server and Steam connection ports are exposed using a LoadBalancer service. After deploying, check your load balancer's external IP and connect to it with the appropriate ports (`2302` for the game, `8766` for Steam).

---

This chart provides an easy way to set up and deploy a DayZ server on Kubernetes. You can customize the values in `values.yaml` as needed to fit your server's specifications.
