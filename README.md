# Openshift htpasswd updater

this repo contains a docker images, a daemonset and a script for updating an
openshift secret for updating the htpasswd on openshift master nodes.

## Usage

### Installation

```bash
oc apply -n default -f openshift/daemonset.yml
./update-htpasswd.sh
```

### Add User

```bash
htpasswd admin.htpasswd <user> <password>
./update-htpasswd.sh
```
