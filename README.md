# icinga2-gotify-notification
Send notifications from Icinga2 to Gotify

## Installation

1. copy both scripts/*.sh files to /icinga2/scripts/ folder
2. copy gotify.conf file to /icinga2/conf.d folder
3. set Pager value from desired user to <GOTIFY_WEBHOOK_URL>
4. reload icinga
5. create Notifications with new NotificationCommands:
    - gotify-host-notification
    - gotify-service-notification

## Testing

### 1. Preparation
set Webhook URL for testing

run in bash:
    `    
    export ICINGA_CONTACTPAGER=<GOTIFY_WEBHOOK_URL>
    `
### 2. run tests
- ./test/bats/bin/bats test/test-host-notifications.bats
- ./test/bats/bin/bats test/test-service-notifications.bats

### 3. check results in Gotify
