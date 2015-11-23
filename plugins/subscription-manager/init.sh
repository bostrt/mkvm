#!/bin/bash
# Rename creds.sample to just creds and replace username and password with your Red Hat login credentials.

# ensure that the system is RHEL :)
if [ `grep 'Red Hat Enterprise Linux' /etc/redhat-release | wc -l` -eq 0 ]; then
    echo "Subscription-manager plugin doesn't apply; OS is not RHEL. Aborting plugin..."
    exit
fi

if [ -e $PLUGINS_DIR/creds ]; then
    echo "Using $PLUGINS_DIR/creds credentials"
    source $PLUGINS_DIR/creds
else
    echo "No RHSM credentials found. Aborting RHSM configuration."
    exit
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

if [[ $? -eq 0 ]]; then
    # disable the preconfigured repositories from virt-builder
    echo "Disabling download.devel.redhat.com repository"
    sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/download.devel.redhat.com.repo
fi
