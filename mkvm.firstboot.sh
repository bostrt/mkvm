#!/bin/bash

# password is 'redhat' ¬_¬
useradd -r -s /bin/bash -m -p '$1$nzNcwr0G$ibOno/ZV60fAuy5lDkTjg.' redhat
mkdir /home/redhat/.ssh
touch /home/redhat/.ssh/authorized_keys
cat /root/remote_id_rsa.pub >> /home/redhat/.ssh/authorized_keys
chown -R redhat:redhat /home/redhat/.ssh

# Cleanup public key
rm -f /root/remote_id_rsa.pub

# Run plugins
tar xzf /root/plugins.tar.gz -C /root/
for plugin in /root/plugins/*; do 
    echo "Starting plugin '$(basename ${plugin})' install..."
    chmod +x ${plugin}/init.sh # Make sure it's executable.
    PLUGINS_DIR=${plugin} sh ${plugin}/init.sh
    echo "Plugin '$(basename ${plugin})' installation complete!"
done

# Cleanup plugins tar
rm -f /root/plugins.tar.gz

echo "==========================="
echo "VM configuration complete!!"
