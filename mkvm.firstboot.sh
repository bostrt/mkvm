#!/bin/bash

# password is 'redhat' ¬_¬
useradd -r -s /bin/bash -m -p '$1$nzNcwr0G$ibOno/ZV60fAuy5lDkTjg.' redhat
mkdir /home/redhat/.ssh
touch /home/redhat/.ssh/authorized_keys
cat /root/remote_id_rsa.pub >> /home/redhat/.ssh/authorized_keys
chown -R redhat:redhat /home/redhat/.ssh

# Expects a file 'rhn_creds' to exist. First line should have rhn username. Second line should have rhn password.
RHN_USER=$(head -n 1 /root/rhn_creds)
RHN_PASS=$(tail -n 1 /root/rhn_creds)

subscription-manager --username=$RHN_USER --password=$RHN_PASS register --auto-attach

rm /root/rhn_creds

# Run plugins
tar xzf /root/plugins.tar.gz -C /root/
for plugin in /root/plugins/*; do 
  chmod +x ${plugin}/init.sh # Make sure it's executable.
  PLUGINS_DIR=${plugin} sh ${plugin}/init.sh
done
