# gatherinfo


### Run this script from outside kubernetes-installer repo
```
./gatherinfo.sh
```

Is going to send a nodejs warning for the markdown files converted,

Look for 

 * $K8S_CLUSTER_NAME.tar.gz *
 
#### kubernetes-installer/docs/customer/
- README.md
- releasenotes.md

#### kubernetes-installer/clusters/$K8S_CLUSTER_NAME/generated/auth
- kubeconfig
- credentials.sh
- basic-auth-password
