#!/bin/bash

echo "Executing App install steps"
echo "Setting up env variables"
./install_envs.sh

if [ "$?" -ne 0 ]; then
    exit 1
fi
echo "Env setup done "
echo "Setting up access to cluster"
./update_man.sh allow
if [ "$?" -ne 0 ]; then
    exit 1
fi
echo "Access setup done "
echo "Installing app"
./helm_install.sh
if [ "$?" -ne 0 ]; then
    exit 1
fi
echo "Install complete"
echo "Removing access to cluster"
./update_man.sh disallow