apiVersion: litmuschaos.io/v1alpha1
description:
  message: |
    Fillup Ephemeral Storage of a Resource
kind: ChaosExperiment
metadata:
  name: {{.Name}}
  labels:
    name: {{.Name}}
    app.kubernetes.io/part-of: litmus
    app.kubernetes.io/component: chaosexperiment
    app.kubernetes.io/version: latest
spec:
  definition:
    scope: Namespaced
    permissions:
      - apiGroups:
          - ""
          - apps
          - batch
          - apps.openshift.io
          - argoproj.io
          - litmuschaos.io
        resources:
          - jobs
          - pods
          - pods/exec
          - pods/log
          - replicationcontrollers
          - deployments
          - statefulsets
          - daemonsets
          - replicasets
          - deploymentconfigs
          - rollouts
          - events
          - chaosengines
          - chaosexperiments
          - chaosresults
        verbs:
          - create
          - list
          - get
          - patch
          - update
          - delete
          - deletecollection
    image: vr00mm/chaos/chaos-go-runner:0.0.4
    imagePullPolicy: Always
    args:
      - -c
      - ./experiments -name volume-fill
    command:
      - /bin/bash
    env:
      - name: TARGET_CONTAINER
        value: "{{if .Args.TARGET_CONTAINER}}{{.Args.TARGET_CONTAINER}}{{end}}"
      - name: TARGET_VOLUME
        value: "{{if .Args.TARGET_VOLUME}}{{.Args.TARGET_VOLUME}}{{end}}"
      - name: FILL_PERCENTAGE
        value: "{{if .Args.FILL_PERCENTAGE}}{{.Args.FILL_PERCENTAGE}}{{else}}80{{end}}"
      - name: TOTAL_CHAOS_DURATION
        value: "{{if .Args.TOTAL_CHAOS_DURATION}}{{.Args.TOTAL_CHAOS_DURATION}}{{else}}60{{end}}"
      - name: RAMP_TIME
        value: "{{if .Args.RAMP_TIME}}{{.Args.RAMP_TIME}}{{end}}"
      - name: LIB
        value: "{{if .Args.LIB}}{{.Args.LIB}}{{else}}litmus{{end}}"
      - name: DATA_BLOCK_SIZE
        value: "{{if .Args.DATA_BLOCK_SIZE}}{{.Args.DATA_BLOCK_SIZE}}{{else}}256{{end}}"
      - name: TARGET_PODS
        value: "{{if .Args.TARGET_PODS}}{{.Args.TARGET_PODS}}{{end}}"
      - name: EPHEMERAL_STORAGE_MEBIBYTES
        value: "{{if .Args.EPHEMERAL_STORAGE_MEBIBYTES}}{{.Args.EPHEMERAL_STORAGE_MEBIBYTES}}{{end}}"
      - name: PODS_AFFECTED_PERC
        value: "{{if .Args.PODS_AFFECTED_PERC}}{{.Args.PODS_AFFECTED_PERC}}{{end}}"
      - name: LIB_IMAGE
        value: "{{if .Args.LIB_IMAGE}}{{.Args.LIB_IMAGE}}{{else}}vr00mm/go-runner:latest{{end}}"
      - name: CONTAINER_PATH
        value: "{{if .Args.CONTAINER_PATH}}{{.Args.CONTAINER_PATH}}{{else}}/var/vcap/store/docker/docker/containers{{end}}"
      - name: SEQUENCE
        value: "{{if .Args.SEQUENCE}}{{.Args.SEQUENCE}}{{else}}parallel{{end}}"
      - name: SOCKET_PATH
        value: "{{if .Args.SOCKET_PATH}}{{.Args.SOCKET_PATH}}{{else}}/var/vcap/sys/run/docker/docker.sock{{end}}"
      - name: CONTAINER_RUNTIME
        value: "{{if .Args.CONTAINER_RUNTIME}}{{.Args.CONTAINER_RUNTIME}}{{else}}docker{{end}}"
    labels:
      name: {{.Name}}
      app.kubernetes.io/part-of: litmus
      app.kubernetes.io/component: experiment-job
      app.kubernetes.io/version: latest
