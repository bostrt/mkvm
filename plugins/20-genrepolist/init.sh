#!/bin/bash

subscription-manager status | grep Current

if [ "$?" -ne 0]; then
    echo "genrepolist plugin failed. Not registered"
    exit 1
fi

subscription-manager repos --list > /root/repos.list
echo "genrepolist plugin created /root/repos.list"
