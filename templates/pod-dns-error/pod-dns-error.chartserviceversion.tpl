apiVersion: litmuchaos.io/v1alpha1
kind: ChartServiceVersion
metadata:
  name: {{.Name}}
  version: 0.1.1
  annotations:
    categories: generic
spec:
  displayName: pod-dns-error
  categoryDescription: >
    Pod DNS Error injects dns failure/error in target pod containers
  keywords:
    - "pods"
    - "kubernetes"
    - "generic"
    - "dns"
  platforms:
    - PKS
    - {{.Platform}}
  maturity: alpha
  labels:
    app.kubernetes.io/component: chartserviceversion
    app.kubernetes.io/version: latest
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
    - base64data: ""
      mediatype: ""
  chaosexpcrdlink: https://raw.githubusercontent.com/litmuschaos/chaos-charts/master/charts/generic/pod-dns-error/experiment.yaml
