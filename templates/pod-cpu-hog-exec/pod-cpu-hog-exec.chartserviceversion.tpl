y
apiVersion: litmuchaos.io/v1alpha1
kind: ChartServiceVersion
metadata:
  createdAt: 20.1.16-16T10:28:08Z
  name: {{.Name}}
  version: 0.1.1
  annotations:
    categories: Kubernetes
    vendor: CNCF
    support: https://slack.kubernetes.io/
spec:
  displayName: pod-cpu-hog-exec
  categoryDescription: |
    pod-cpu-hog-exec contains chaos to consume CPU resouces of specified containers in Kubernetes pods.  
    - Causes high CPU resource consumption utilizing one or more cores by triggering md5sum commands
    - The application pod should be healthy once chaos is stopped. Expectation is that service-requests should be served despite chaos.
  keywords:
    - Kubernetes
    - CPU
  maturity: alpha
  labels:
    app.kubernetes.io/component: chartserviceversion
    app.kubernetes.io/version: latest
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
    - base64data: ""
      mediatype: ""
  chaosexpcrdlink: https://raw.githubusercontent.com/litmuschaos/chaos-charts/master/charts/generic/pod-cpu-hog-exec/experiment.yaml 
