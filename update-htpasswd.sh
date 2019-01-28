#!/bin/bash

cat <<EOF | oc apply -n default -f -
apiVersion: v1
kind: Secret
metadata:
  name: master-htpasswd
type: Opaque
data:
  admin.htpasswd: '$(cat admin.htpasswd | base64 )'
EOF

