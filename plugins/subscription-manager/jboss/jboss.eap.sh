#!/bin/bash

if [ `grep '5\.' /etc/redhat-release | wc -l` -eq 1 ]; then 
    subscription-manager repos --enable=jb-eap-6-for-rhel-5-server-rpms;
fi
if [ `grep '6\.' /etc/redhat-release | wc -l` -eq 1 ]; then 
    subscription-manager repos --enable=jb-eap-6-for-rhel-6-server-rpms;
fi
if [ `grep '7\.' /etc/redhat-release | wc -l` -eq 1 ]; then 
    subscription-manager repos --enable=jb-eap-6-for-rhel-7-server-rpms;
fi
