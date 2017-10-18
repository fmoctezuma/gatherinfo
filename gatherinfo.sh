#kubernetes-installer/docs/customer/
#- README.md
#- releasenotes.md

#kubernetes-installer/clusters/$K8S_CLUSTER_NAME/generated/auth
#- kubeconfig
#- credentials.sh

#!/bin/bash
mkdir -p gather-info/$K8S_CLUSTER_NAME
cp kubernetes-installer/docs/customer/*.md gather-info/$K8S_CLUSTER_NAME/
cp kubernetes-installer/clusters/$K8S_CLUSTER_NAME/generated/auth/* gather-info/$K8S_CLUSTER_NAME/

# Generate pdf files from markdown using markdown-pdf with a Docker container
# Dockerfile https://github.com/fmoctezuma/md2pdf/blob/master/Dockerfile
for x in `cd gather-info/$K8S_CLUSTER_NAME && ls -1 *.md | sed s/\.md//g`
 do docker run -v $PWD/gather-info/$K8S_CLUSTER_NAME:/opt/docs quay.io/fmoctezuma/md2pdf markdown-pdf -o $x.pdf $x.md
done

#Deletes markdown files due are available on pdf format
rm $PWD/gather-info/$K8S_CLUSTER_NAME/*.md

echo "Generating tar file, $K8S_CLUSTER_NAME.tar.gz"
cd $PWD/gather-info
tar -cvf ../$K8S_CLUSTER_NAME.tar.gz $K8S_CLUSTER_NAME
