{{ $data := . }}
apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  name: {{.Workflow.Name}}
  namespace: default
spec:
  entrypoint: custom-chaos
  securityContext:
    runAsNonRoot: true
    runAsUser: 1000
  serviceAccountName: argo-chaos
  templates:
    - name: custom-chaos
      steps:
        - - name: install-chaos-experiments
            template: install-chaos-experiments
{{- range $experimentName := .Workflow.Experiments -}}
        - - name: {{$experimentName}}
            template: {{$experimentName}}
{{- end }}
    - name: install-chaos-experiments
      inputs:
        artifacts:
{{- range $experimentName := .Workflow.Experiments -}}
          - name: {{$experimentName}}
            path: /tmp/{{$experimentName}}.yaml
            raw:
              data: >
{{- GetTemplate $data $experimentName | nindent 16 -}}{{- end -}}
      container:
        args:
        command:
          - sh
          - -c
        image: litmuschaos/k8s:latest
{{ range $experimentName := .Workflow.Experiments }}
    - name: {{$experimentName}}
      inputs:
        artifacts:
          - name: {{$experimentName}}
            path: /tmp/chaosengine-{{$experimentName}}.yaml
            raw:
              data: |
{{ GetEngine $data $experimentName | nindent  16 }}
      container:
        args:
          - -file=/tmp/chaosengine-{{$experimentName}}.yaml
          - -saveName=/tmp/engine-name
        image: litmuschaos/litmus-checker:latest
{{- end -}}
