# Openshift htpasswd updater

this repo contains a docker images, a daemonset and a script for updating an
openshift secret for updating the htpasswd on openshift master nodes.

## Usage

### Installation

```bash
oc adm policy add-scc-to-user privileged system:serviceaccount:default:htpasswd-updater --as system:admin
oc apply -n default -f openshift/daemonset.yml
./update-htpasswd.sh
```

### Add User

```bash
htpasswd -b admin.htpasswd <user>
```
will prompt for password
```bash
./update-htpasswd.sh
```
