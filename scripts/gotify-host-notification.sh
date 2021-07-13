#!/bin/sh

# Environment variables
NOTIFICATIONTYPE=$ICINGA_NOTIFICATIONTYPE
HOSTDISPLAYNAME=$ICINGA_HOSTALIAS
HOSTSTATE=$ICINGA_HOSTSTATE
GOTIFY_WEBHOOK=$ICINGA_CONTACTPAGER


case $ICINGA_NOTIFICATIONTYPE in
     PROBLEM)
          ICON="\u274c"
          PRIORITY=8
          ;;
     RECOVERY)
          ICON="\u2705"
          PRIORITY=3
          ;;
     *)
          ICON="\ud83d\udd14"
          PRIORITY=5
          ;;
esac


# Build Message
MESSAGE="$ICON Host $HOSTDISPLAYNAME is $HOSTSTATE!"

curl --silent \
     --show-error \
     -X POST \
     -H "Content-type: application/json" \
     --data '{"title": "'"$NOTIFICATIONTYPE"'", "message":"'"$MESSAGE"'", "priority":'"$PRIORITY"'}' \
     $GOTIFY_WEBHOOK
