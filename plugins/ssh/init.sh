#!/bin/bash
# Copy any ssh public keys you want to add to authorized keys into this plugin's directory. 
# The pulic keys must end with .pub .

mkdir /root/.ssh
cat $PLUGINS_DIR/*.pub >> /root/.ssh/authorized_keys
