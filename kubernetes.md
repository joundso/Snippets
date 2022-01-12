# Kubernetes snippets

- [Kubernetes snippets](#kubernetes-snippets)
  - [Further Information / Helpful stuff](#further-information--helpful-stuff)
    - [Base64 Encoding](#base64-encoding)
    - [Create Secret from whole file](#create-secret-from-whole-file)
    - [Sending stuff to the cluster](#sending-stuff-to-the-cluster)
    - [Apply Argo Workflow to the cluster](#apply-argo-workflow-to-the-cluster)
    - [Cheat Sheet](#cheat-sheet)
    - [Lens](#lens)
    - [Install KinD (Kubernetes in Docker)](#install-kind-kubernetes-in-docker)
    - [Install Argo (CD/Workflows)](#install-argo-cdworkflows)
  - [Context / Cluster switching](#context--cluster-switching)
    - [Show current Context](#show-current-context)
    - [List all clusters available](#list-all-clusters-available)
    - [Set context to cluster](#set-context-to-cluster)
    - [Set context within a HELM template](#set-context-within-a-helm-template)
  - [Templates](#templates)
    - [Secret](#secret)
    - [Persistent Volume Claim (PVC)](#persistent-volume-claim-pvc)

## Further Information / Helpful stuff

### Base64 Encoding

```bash
## Encode a String with base64:
echo -n 'blablabla' | base64

## Encode a File with base64:
base64 /path/to/file -w 0 > output.txt
```

### Create Secret from whole file

```bash
kubectl create secret generic SECRET_NAME --from-file=path/to/file.env --dry-run=client -o yaml > mysecret.yaml
```

### Sending stuff to the cluster

```bash
kubectl apply -f ./path/to/file.yaml -n namespace-name
```

### Apply Argo Workflow to the cluster

```bash
## Send workflow to the cluster:
argo submit ./path/to/file.yaml --watch --log

## Create the workflow:
argo cron create ./path/to/file.yaml
```

### Cheat Sheet

See <https://kubernetes.io/docs/reference/kubectl/cheatsheet/>.

### Lens

[LENS](https://k8slens.dev/) is a great platform to manage your cluster using a GUI. Give it a try.

### Install KinD (Kubernetes in Docker)

[KinD](https://kind.sigs.k8s.io/) (Kubernetes in Docker) is a great way to test Kubernets stuff locally without the need of a high-performance cluster.

1. Install KinD following the [instructions on their webpage](https://kind.sigs.k8s.io/docs/user/quick-start/#installation).

### Install Argo (CD/Workflows)

```bash
## Add the repo for Argo:
helm repo add argo https://argoproj.github.io/argo-helm

## Install Argo Workflow with own presets:
helm install argo-wf argo/argo-workflows \
    --set controller.containerRuntimeExecutor=pns \
    --set workflow.rbac.create=true \
    --set workflow.namespace=default \
    --set workflow.serviceAccount.create=true
```

## Context / Cluster switching

### Show current Context

```bash
kubectl config current-context 
```

### List all clusters available

```bash
kubectl config get-contexts
```

### Set context to cluster

```bash
kubectl config use-context my-cluster-name
```

### Set context within a HELM template

```yaml
  {{with .Values.service}}
  type: {{ .type }}
  ports:
    - port: {{ .httpPort }}
      targetPort: http
      protocol: TCP
      name: patient-browser-server-http
  selector:
    {{- include "patient-browser.selectorLabels" $ | nindent 4 }}
  {{end}}
```

## Templates

### Secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: secret-name
type: Opaque
data:
  variable-key: variable-value
```

### Persistent Volume Claim (PVC)

```yaml
# Define Kubernetes PVC
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: mydata
spec:
  storageClassName: "standard"
  accessModes: [ "ReadWriteOnce" ]
  resources:
    requests:
      storage: 1Gi
```
