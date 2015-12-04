#!/bin/bash
# Script to install and start the default_static network

sudo virsh net-create --file default_static-net.xml
sudo virsh net-start --network default_static
