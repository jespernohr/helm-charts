# dayz-dedicated-server (Helm)

This chart deploys a DayZ Dedicated Server on Kubernetes with UDP service, persistent storage, and a templated `serverDZ.cfg`.

## TL;DR
```bash
helm install mydayz ./charts/dayz-dedicated-server -f values.yaml