#!/bin/bash

# add ip / hostname 
HOSTS=""

# no ping request
COUNT=1

# email report when 
SUBJECT="Network Check"
EMAILID="test@test.com"
for myHost in $HOSTS
do
  count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
  if [ $count -eq 0 ]; then
    # 100% failed 
    echo "Host : $myHost is down (ping failed) at $(date)" | mail -s "$SUBJECT" $EMAILID
  fi
done