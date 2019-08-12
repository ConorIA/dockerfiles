#!/bin/bash

# This file is from github.com/kartoza/docker-qgis-desktop

# Put any tasks you would like to have carried
# out when the container is first created here

# We expect the container is started with the
# the users ~ directory mounted as /home/$USER

# Make the user matching the user from the mounted home
# We assume there will only be one user dir in home
# hence tail -1

if [ -e /tmp/extra.sh ]; then
  if [ ! -x /tmp/extra.sh ]; then
      chmod a+x /tmp/extra.sh
  fi
  /tmp/extra.sh
fi

USER_ID=`ls -lahn /home | tail -1 | awk {'print $3'}`
GROUP_ID=`ls -lahn /home | tail -1 | awk {'print $4'}`
USER_NAME=`ls -lah /home/ | tail -1 | awk '{print $9}'`

groupadd -g $GROUP_ID qgis
useradd --shell /bin/bash --uid $USER_ID --gid $GROUP_ID $USER_NAME
export LD_LIBRARY_PATH=/usr/lib
su $USER_NAME -c "/usr/bin/qgis"
