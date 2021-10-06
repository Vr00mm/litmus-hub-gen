apiVersion: litmuchaos.io/v1alpha1
kind: ChartServiceVersion
metadata:
  name: {{.Workflow.Name}}
  version: 0.1.0
  annotations:
    categories: {{.Workflow.Name}}
    chartDescription: Injects chaos on {{.Workflow.Name}} application
spec:
  displayName: {{.Workflow.Name}}
  experiments:
{{- range $experimentName := .Workflow.Experiments -}}
	{{- $experimentNameFull := printf "%s-%s" $.Name $experimentName }}
    - {{ $experimentNameFull }}
{{- end }}
  keywords:
    - Kubernetes
    - datamap-preprod
    - Pod
    - Memory
    - CPU
    - Network
    - Disk
  platforms:
    - preprod02
  maintainers:
    - name: ChaosTeam
      email: _chaos@company.com
  provider:
    name: CompanyName
  links:
    - name: Mattermost Chaos
      url: https://mattermost.pe-qvr.net/tmj/channels/chaos-engineering
    - name: Documentation
      url: https://github.com/litmuschaos/chaos-charts
  icon:
    - url:
      mediatype: ""
