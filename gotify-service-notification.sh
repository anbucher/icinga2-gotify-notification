#!/bin/sh

# Environment variables
NOTIFICATIONTYPE=$ICINGA_NOTIFICATIONTYPE
HOSTDISPLAYNAME=$ICINGA_HOSTALIAS
HOSTSTATE=$ICINGA_HOSTSTATE
GOTIFY_WEBHOOK=$ICINGA_CONTACTPAGER

SERVICENAME=$ICINGA_SERVICENAME
SERVICESTATE=$ICINGA_SERVICESTATE
SERVICEOUTPUT=$ICINGA_SERVICEOUTPUT


MESSAGE="[$NOTIFICATIONTYPE] Service $SERVICENAME on Host $HOSTDISPLAYNAME is in state $SERVICESTATE : $SERVICEOUTPUT"

curl --silent \
     --show-error \
     -X POST \
     -H "Content-type: application/json" \
     --data '{"title": "'"$NOTIFICATIONTYPE"'", "message":"'"$MESSAGE"'", "priority":5}' \
     $GOTIFY_WEBHOOK