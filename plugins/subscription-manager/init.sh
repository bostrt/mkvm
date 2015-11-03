#!/bin/bash
# Rename creds.sample to just creds and replace username and password with your Red Hat login credentials.

if [ -e ${HOME}/.rhn ]; then
    echo "Using ${HOME}/.rhn credentials"
    source ${HOME}/.rhn
else
    if [ -e $PLUGINS_DIR/creds ]; then
        echo "Using $PLUGINS_DIR/creds credentials"
        source $PLUGINS_DIR/creds
    else
        echo "No RHSM credentials found. Aborting RHSM configuration."
        exit
    fi
fi

subscription-manager register --username=$RHN_USER --password=$RHN_PASSWORD --auto-attach

# disable all repos
subscription-manager repos --disable="*"

# after registering we need to enable the right repo channel
if [ `grep '5\.' /etc/redhat-release | wc -l` -eq 1 ]; then
    subscription-manager repos --enable=rhel-5-server-rpms;
fi

if [ `grep '6\.' /etc/redhat-release | wc -l` -eq 1 ]; then
    subscription-manager repos --enable=rhel-6-server-rpms;
fi

if [ `grep '7\.' /etc/redhat-release | wc -l` -eq 1 ]; then
    subscription-manager repos --enable=rhel-7-server-rpms;
fi

