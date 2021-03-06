apiVersion: litmuchaos.io/v1alpha1
kind: ChartServiceVersion
metadata:
  name: {{.Name}}
  version: 0.1.0
  annotations:
    categories: Kubernetes
    vendor: CNCF
    support: https://slack.kubernetes.io/
spec:
  displayName: disk-fill
  categoryDescription: |
    Disk fill contains chaos to disrupt state of kubernetes resources. 
    - Causes (forced/graceful) Disk Stress by filling up the Ephemeral Storage of the Pod using one of it containers.
    - Causes Pod to get Evicted if the Pod exceeds it Ephemeral Storage Limit.
    - Tests the Ephemeral Storage Limits, to ensure those parameters are sufficient.
  keywords:
    - Kubernetes
    - Disk
    - State 
  platforms:
    - PKS
    - {{.Platform}}
  maturity: alpha
  chaosType: infra
  maintainers:
    - name: ChaosTeam
      email: _chaos@company.com
  minKubeVersion: 1.12.0
  provider:
    name: Company Name
  labels:
    app.kubernetes.io/component: chartserviceversion
    app.kubernetes.io/version: latest
  links:
    - name: Source Code
      url: https://github.com/litmuschaos/litmus-go/tree/master/experiments/generic/disk-fill
    - name: Documentation
      url: https://litmuschaos.github.io/litmus/experiments/categories/pods/disk-fill/
    - name: Video
      url: https://www.youtube.com/watch?v=pbok737rUPQ
  icon:
    - url: 
      mediatype: ""
  chaosexpcrdlink: https://raw.githubusercontent.com/litmuschaos/chaos-charts/master/charts/generic/disk-fill/experiment.yaml
