# Kubernetes snippets

- [Kubernetes snippets](#kubernetes-snippets)
  - [Cheat Sheet](#cheat-sheet)
  - [Show current Context](#show-current-context)
  - [List all clusters available](#list-all-clusters-available)
  - [Set context to cluster](#set-context-to-cluster)
  - [Context setzen innerhalb von Templates](#context-setzen-innerhalb-von-templates)

## Cheat Sheet

See <https://kubernetes.io/docs/reference/kubectl/cheatsheet/>.

## Show current Context

```bash
kubectl config current-context 
```

## List all clusters available

```bash
kubectl config get-contexts
```

## Set context to cluster

```bash
kubectl config use-context my-cluster-name
```

## Context setzen innerhalb von Templates

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
