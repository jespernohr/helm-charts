# Jesper Nøhr's Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/jespernohr)](https://artifacthub.io/packages/search?repo=jespernohr)
[![Release Charts](https://github.com/jespernohr/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/jespernohr/helm-charts/actions/workflows/release.yaml)

A collection of production-ready Helm charts for Kubernetes applications including game servers, network infrastructure, and home lab services.

## 📋 Available Charts

| Chart | Description | Version | App Version |
|-------|-------------|---------|-------------|
| [dayz-dedicated-server](./charts/dayz-dedicated-server) | DayZ Dedicated Game Server | ![Version](https://img.shields.io/badge/version-0.1.2-blue) | 0.1.2 |
| [dayz-dedicated-server-razorbladex401](./charts/dayz-server-razorbladex401) | DayZ Server with custom configs | ![Version](https://img.shields.io/badge/version-1.0.2-blue) | stable |
| [unifi-controller](./charts/unifi-controller) | Ubiquiti UniFi Network Controller | ![Version](https://img.shields.io/badge/version-2.3.2-blue) | 7.5.176 |
| [metallb](./charts/metallb) | Load Balancer for bare metal Kubernetes | ![Version](https://img.shields.io/badge/version-0.1.4-blue) | v0.13.11 |

## 🚀 Quick Start

### Add Repository

```bash
helm repo add jespernohr https://jespernohr.github.io/helm-charts
helm repo update
```

### Search Charts

```bash
helm search repo jespernohr
```

### Install a Chart

```bash
# Install UniFi Controller with default values
helm install unifi jespernohr/unifi-controller

# Install with custom values
helm install unifi jespernohr/unifi-controller -f my-values.yaml

# Install in specific namespace
helm install unifi jespernohr/unifi-controller --namespace unifi --create-namespace
```

## 📖 Chart Documentation

### DayZ Dedicated Server
A Helm chart for deploying DayZ dedicated game servers on Kubernetes.

**Features:**
- Persistent storage for game data
- ConfigMap for server configuration
- UDP service exposure
- Resource management

```bash
helm install dayz jespernohr/dayz-dedicated-server \
  --set persistence.enabled=true \
  --set resources.requests.memory=2Gi
```

### UniFi Controller
Deploy Ubiquiti's UniFi Network Controller for managing UniFi devices.

**Features:**
- Persistent storage for controller data
- Web UI and device communication ports
- Horizontal Pod Autoscaling
- Ingress support

```bash
helm install unifi jespernohr/unifi-controller \
  --set ingress.enabled=true \
  --set ingress.hosts[0].host=unifi.example.com
```

### MetalLB
Load balancer implementation for bare metal Kubernetes clusters.

**Features:**
- Layer 2 and BGP mode support
- Custom Resource Definitions
- Speaker and controller components
- IP address pool management

```bash
helm install metallb jespernohr/metallb \
  --namespace metallb-system \
  --create-namespace
```

## ⚙️ Configuration

Each chart includes a `values.yaml` file with configurable options. Common patterns:

### Resource Management
```yaml
resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 500m
    memory: 512Mi
```

### Persistence
```yaml
persistence:
  enabled: true
  size: 10Gi
  storageClass: "fast-ssd"
```

### Ingress
```yaml
ingress:
  enabled: true
  className: "nginx"
  hosts:
    - host: app.example.com
      paths:
        - path: /
          pathType: Prefix
```

## 🔧 Development

### Prerequisites
- [Helm](https://helm.sh/docs/intro/install/) >= 3.0
- [Kubernetes](https://kubernetes.io/) >= 1.19
- [helm-docs](https://github.com/norwoodj/helm-docs) (for documentation generation)

### Local Testing
```bash
# Lint charts
helm lint charts/*

# Template rendering
helm template my-release charts/unifi-controller

# Install locally
helm install test-release charts/unifi-controller --dry-run --debug
```

### Adding a New Chart
1. Create chart directory: `mkdir charts/my-new-chart`
2. Initialize chart: `helm create charts/my-new-chart`
3. Customize templates and values
4. Update Chart.yaml metadata
5. Generate documentation: `helm-docs`
6. Test thoroughly
7. Submit PR

## 🏗️ CI/CD Pipeline

This repository uses GitHub Actions for automated chart releases:

- **Linting**: Charts are automatically linted on PRs
- **Testing**: Template rendering and value validation
- **Releases**: Automatic versioning and publishing to GitHub Pages
- **Artifact Hub**: Automatic synchronization with Artifact Hub

### Release Process
1. Update chart version in `Chart.yaml`
2. Commit and push to `main` branch
3. GitHub Actions automatically:
   - Creates GitHub Release
   - Packages chart as `.tgz`
   - Updates Helm repository index
   - Publishes to GitHub Pages

## 🌐 Artifact Hub

All charts are available on [Artifact Hub](https://artifacthub.io/packages/search?repo=jespernohr) for easy discovery and installation.

## 📝 Contributing

Contributions are welcome! Please follow these guidelines:

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/my-new-chart`
3. **Make** your changes and test thoroughly
4. **Update** documentation and README if needed
5. **Commit** with conventional commits: `feat: add new chart for awesome-app`
6. **Push** to your fork and submit a **Pull Request**

### Chart Requirements
- Follow [Helm Best Practices](https://helm.sh/docs/chart_best_practices/)
- Include comprehensive `values.yaml` with comments
- Add `NOTES.txt` for post-install instructions
- Include proper labels and annotations
- Test on multiple Kubernetes versions
- Document breaking changes

## 🐛 Issues & Support

- **Issues**: [GitHub Issues](https://github.com/jespernohr/helm-charts/issues)
- **Discussions**: [GitHub Discussions](https://github.com/jespernohr/helm-charts/discussions)
- **Security**: Please report security vulnerabilities privately via email

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Helm Community](https://helm.sh/community/) for the amazing package manager
- [Artifact Hub](https://artifacthub.io/) for chart discovery and distribution
- [Chart Releaser Action](https://github.com/helm/chart-releaser-action) for automated releases
- Contributors and users of these charts

---

⭐ **Star this repository** if you find these charts useful!