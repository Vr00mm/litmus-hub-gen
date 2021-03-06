apiVersion: litmuchaos.io/v1alpha1
kind: ChartServiceVersion
metadata:
  name: {{.Name}}
  version: 0.1.0
  annotations:
    categories: "Kubernetes"
    vendor: "CNCF"
    support: https://slack.openebs.io/
spec:
  displayName: container-kill
  categoryDescription: |
   Container kill contains chaos to disrupt state of kubernetes resources. Experiments can inject random container delete failures against specified application. 
    - Executes SIGKILL on containers of random replicas of an application deployment.
    - Tests deployment sanity (replica availability & uninterrupted service) and recovery workflows of the application pod.
  keywords:
    - Kubernetes
    - Container 
  platforms:
    - PKS
    - {{.Platform}}
  maturity: alpha
  maintainers:
    - name: ChaosTeam
      email: _chaos@company.com
  provider:
    name: Company Name
  labels:
    app.kubernetes.io/component: chartserviceversion
    app.kubernetes.io/version: latest
  links:
    - name: Source Code
      url: https://github.com/litmuschaos/litmus-go/tree/master/experiments/generic/container-kill
    - name: Documentation
      url: https://litmuschaos.github.io/litmus/experiments/categories/pods/container-kill/
    - name: Video
      url: https://www.youtube.com/watch?v=XKyMNdVsKMo
  icon:
    - url: 
      mediatype: ""
  chaosexpcrdlink: https://raw.githubusercontent.com/litmuschaos/chaos-charts/master/charts/generic/container-kill/experiment.yaml
