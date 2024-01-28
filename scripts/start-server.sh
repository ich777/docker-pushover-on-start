#!/bin/bash
# Replace HOST_IP with the IP from the Host - only works when container is ran on host interface!
if grep -q "HOST_IP" <<< "${PUSHOVER_MESSAGE}" ; then
  HOST_IP=$(hostname -I | awk '{print $1}')
  PUSHOVER_MESSAGE=$(sed "s/HOST_IP/${HOST_IP}/" <<< "${PUSHOVER_MESSAGE}")
fi

echo "---Sending Pushover message with title: '${PUSHOVER_TITLE}' and message: '${PUSHOVER_MESSAGE}'---"
wget https://api.pushover.net/1/messages.json --post-data="token=${PUSHOVER_APP_TOKEN}&user=${PUSHOVER_USER_TOKEN}&priority=${PUSHOVER_PRIORITY}&title=${PUSHOVER_TITLE}&message=${PUSHOVER_MESSAGE}" -qO- > /dev/null 2>&1
echo "--- D O N E ---"