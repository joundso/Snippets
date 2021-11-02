# Kubernetes snippets

- [Kubernetes snippets](#kubernetes-snippets)
  - [List all clusters available](#list-all-clusters-available)
  - [Context setzen innerhalb von Templates](#context-setzen-innerhalb-von-templates)

## List all clusters available


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
