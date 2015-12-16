#!/bin/bash
# Script to install and start the default_static network

sudo virsh net-define --file default_static-net.xml
sudo virsh net-autostart --network default_static
