#!/bin/bash

# password is 'redhat' ¬_¬
useradd -r -s /bin/bash -m -p '$1$nzNcwr0G$ibOno/ZV60fAuy5lDkTjg.' redhat
mkdir /home/redhat/.ssh
touch /home/redhat/.ssh/authorized_keys
cat /root/remote_id_rsa.pub >> /home/redhat/.ssh/authorized_keys
chown -R redhat:redhat /home/redhat/.ssh

# Cleanup public key
rm -f /root/remote_id_rsa.pub

# Ensure that the network device is up 
# a restart ensure that changes made are applied
service network restart
# and that ssh is on
service sshd start

# When the network is configured, you can install stuff
yum install tar -y --nogpgcheck

# check exit status of tar installation
if [ $? -ne 0 ]; then
    echo "The tar package failed to install. Skipping plugins and leaving plugins.tar.gz for later use."
else
    # Run plugins
    tar xzf /root/plugins.tar.gz -C /root/
    for plugin in /root/plugins/*; do 
        echo "Starting plugin '$(basename ${plugin})' install..."
        if [ -e ${plugin}/init.sh ]; then
            chmod +x ${plugin}/init.sh # Make sure it's executable.
            PLUGINS_DIR=${plugin} sh ${plugin}/init.sh
            echo "Plugin '$(basename ${plugin})' installation complete!"
        else
            echo "Plugin '$(basename ${plugin})' has a missing or disabled init.sh. Skipping plugin."
        fi
    done

    # Cleanup plugins tar
    rm -f /root/plugins.tar.gz
fi

echo "==========================="
echo "VM configuration complete!!"
