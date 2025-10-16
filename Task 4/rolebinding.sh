#!/bin/bash

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: development
subjects:
- kind: User
  name: developer
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: write-pods
  namespace: staff
subjects:
- kind: User
  name: support
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-writer
  apiGroup: rbac.authorization.k8s.io
EOF

echo "RoleBindings created"