apiVersion: litmuchaos.io/v1alpha1
kind: ChartServiceVersion
metadata:
  createdAt: 2019-10-11T10:28:08Z
  name: {{.Name}}
  version: 0.1.13
  annotations:
    categories: Kubernetes
    vendor: CNCF
    support: https://slack.kubernetes.io/
spec:
  displayName: pod-network-loss
  categoryDescription: |
    Pod-network-loss contains chaos to disrupt network connectivity to kubernetes pods. Experiments can inject percentage packet loss on the app replica pods. 
    - Causes loss of access to application replica by injecting packet loss using pumba.
    - The application pod should be healthy once chaos is stopped. Service-requests should be served (say, via alternate replicas) despite chaos.
  keywords:
    - Kubernetes
    - Network
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
  chaosexpcrdlink: https://raw.githubusercontent.com/litmuschaos/chaos-charts/master/charts/generic/pod-network-loss/experiment.yaml 
