# Basic Pushover notification when the Container is started in Docker optimized for Unraid

This is a simple container that sends a message when the container is started (needed this for a headless machine to know when I can connect or better speaking start up the VM's with WOL).  
  
If using the string `HOST_IP` in the message text the container will try to replace this string with the Host IP address - this will only work when the container is ran on the host network!

## Env params
| Name | Value | Example |
| --- | --- | --- |
| PUSHOVER_APP_TOKEN | Pushover APP Token | "YOURSECRETAPPTOKEN" |
| PUSHOVER_USER_TOKEN | Pushover User Token | "YOURSECRETUSERTOKEN" |
| PUSHOVER_TITLE | Customized Pushover Message Title | Startup Complete |
| PUSHOVER_MESSAGE | Customized Pushover Message | Server is now Online! |
| PUSHOVER_PRIORITY | Customize the Pushover Priority ('-2': Lowest priority | '-1': Low Priority | '0': Normal Priority | '1': High Priority | '2': Emergency Priority) | 0 |

## Run example
```
docker run --name PushoverOnStart -d \
    --env 'PUSHOVER_APP_TOKEN=YOURSECRETAPPTOKEN' \
    --env 'PUSHOVER_USER_TOKEN=YOURSECRETUSERTOKEN' \
    --env 'PUSHOVER_TITLE=Startup Complete' \
    --env 'PUSHOVER_MESSAGE=Server is now Online!' \
    --env 'PUSHOVER_PRIORITY=0' \
    --net='host' \
    ich777/pushover-on-start
```


#### Support Thread: https://forums.unraid.net/topic/83786-support-ich777-application-dockers/