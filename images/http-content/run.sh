if [ -z "$app_name" ]; then
  echo app_name is missing
fi
if [ -z "$env" ]; then
  echo env is missing
fi



apiVersion: v1
kind: Pod
metadata:
 name: pod-01
spec:
 initContainers:
 - name: pod1
   image: busybox
   env:
   - name: "DB_HOST"
     value: "SQL"
     volumeMounts:
     - name: image-path
       mountPath: /data

 volumes:
 - name: image-path
   emptyDir: {}

 containers:
 - name: cont
   image: busybox
   volumeMounts:
   - name: image-path
     mountPath: /data

     FROM centos
     COPY /run.sh
     ENTRYPOINT ["bash","/run.sh"]

     run.sh
     ======
     if [-z "$DB_HOST"]; then
       echo missing
     fi