# dayz-dedicated-server-razorbladex401 (Helm)

This chart deploys a DayZ Dedicated Server on Kubernetes with UDP service, persistent storage, and a templated `serverDZ.cfg`.

Based on the work from [razorbladex401/dayz-dedicated-server-k8s](https://github.com/razorbladex401/dayz-dedicated-server-k8s).

## TL;DR
```bash
helm install mydayz ./charts/dayz-server-razorbladex401 -f values.yaml