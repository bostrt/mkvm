#!/bin/bash
# Rename creds.sample to just creds and replace username and password with your Red Hat login credentials.

source $PLUGINS_DIR/creds
subscription-manager --username=$RHN_USER --password=$RHN_PASSWORD register --auto-attach
