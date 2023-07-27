# Demo Helmfile

The `helmfile.yaml` file found under the [manifest](manifest) directory includes a repo definition and releases.

```yaml
repositories:
- name: akuity-demo
  url: https://akuity.github.io/demo-helm-charts/

releases:
- name: jupiter
  chart: akuity-demo/simple-go
  set:
  - name: replicaCount
    value: 2
- name: saturn
  chart: akuity-demo/gobg
  set:
  - name: color
    value: green
```

## Deploying

Once you've set up a [CMP](https://argo-cd.readthedocs.io/en/stable/operator-manual/config-management-plugins/) on your instance, you can deploy this repo by applying the following `Application` definition:

> :bangbang: **You may need to change some fields like the `spec.destination.name` and `spec.destination.namespace` depending on your environment

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: helmfile-demo
spec:
  destination:
    name: mycluster
    namespace: demo
  project: default
  source:
    path: helm/helmfile/demo/manifest
    repoURL: https://github.com/akuity/examples
    targetRevision: main
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
```
