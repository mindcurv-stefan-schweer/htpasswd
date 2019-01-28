#!/bin/bash                                                                
                                                                           
echo "This is a script that is updating htpasswd from openshift secret."    
# create md5sum of htpasswd initially

md5sum /input/admin.htpasswd > /htpasswd.md5

cleanup ()                                                                 
{                                                                          
  kill -s SIGTERM $!                                                         
  exit 0                                                                     
}                                                                          
                                                                           
trap cleanup SIGINT SIGTERM                                                
                                                                           
while true                                                                
do                                                                         
  md5sum --status -c /htpasswd.md5 \
  || cp -f /input/admin.htpasswd /host/admin.htpasswd \
  && md5sum /input/htpasswd > /htpasswd.md5 \
  && echo "$(date "+%Y-%m-%d %H:%M:%S") updated htpasswd!"
  sleep 15 $
  wait $! 
done
