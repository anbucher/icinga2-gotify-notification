#!/bin/sh

# Environment variables
NOTIFICATIONTYPE=$ICINGA_NOTIFICATIONTYPE
HOSTDISPLAYNAME=$ICINGA_HOSTALIAS
HOSTSTATE=$ICINGA_HOSTSTATE
GOTIFY_WEBHOOK=$ICINGA_CONTACTPAGER

SERVICENAME=$ICINGA_SERVICENAME
SERVICESTATE=$ICINGA_SERVICESTATE
SERVICEOUTPUT=$ICINGA_SERVICEOUTPUT

case $SERVICESTATE in
     WARNING)
          ICON="\ud83d\udd14"
          TITLE="PROBLEM"
          PRIORITY=5
          ;;
     CRITICAL)
          ICON="\u274c"
          TITLE="PROBLEM"
          PRIORITY=8
          ;;
     OK)
          ICON="\u2705"
          TITLE="RECOVERY"
          PRIORITY=3
          ;;
     *)
          ICON="\ud83d\udd14"
          TITLE="Notification"
          PRIORITY=5
          ;;
esac


# Build Message

MESSAGE="$ICON Service $SERVICENAME on Host $HOSTDISPLAYNAME is in state $SERVICESTATE : $SERVICEOUTPUT"

curl --silent \
     --show-error \
     -X POST \
     -H "Content-type: application/json" \
     --data '{"title": "'"$TITLE"'", "message":"'"$MESSAGE"'", "priority":'"$PRIORITY"'}' \
     $GOTIFY_WEBHOOK
