apiVersion: litmuchaos.io/v1alpha1
kind: ChartServiceVersion
metadata:
  createdAt: 2019-09-26T10:28:08Z
  name: {{.Name}}
  version: 0.1.17
  annotations:
    categories: Kubernetes
    chartDescription: Injects generic kubernetes chaos
spec:
  displayName: Generic Chaos
  categoryDescription: >
    Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easier management and discovery. It will install all the experiments which can be used to inject chaos into containerized applications.
  experiments:
{{- range $Name, $experiment := .Experiments }}
    - {{$Name}}
{{- end}}
  keywords:
    - Kubernetes
    - Container
    - Pod
    - Disk
    - IO
    - Filesystem
    - Network
    - CPU
    - Memory
    - DNS
  platforms:
    - PKS
    - {{.Platform}}
  maintainers:
    - name: ChaosTeam
      email: _chaos@company.com
  minKubeVersion: 1.0.0
  provider:
    name: Company Name
  links:
    - name: Mattermost Chaos
      url: https://mattermost.pe-qvr.net/tmj/channels/chaos-engineering
    - name: Documentation
      url: https://github.com/litmuschaos/chaos-charts
    - name: Source Code
      url: https://github.com/litmuschaos/chaos-charts
  icon:
    - url: https://raw.githubusercontent.com/litmuschaos/charthub.litmuschaos.io/master/public/litmus.ico
      mediatype: image/png
  chaosexpcrdlink: https://raw.githubusercontent.com/litmuschaos/chaos-charts/master/charts/generic/experiments.yaml
