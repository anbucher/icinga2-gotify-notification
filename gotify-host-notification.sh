#!/bin/sh

# Environment variables
NOTIFICATIONTYPE=$ICINGA_NOTIFICATIONTYPE
HOSTDISPLAYNAME=$ICINGA_HOSTALIAS
HOSTSTATE=$ICINGA_HOSTSTATE
GOTIFY_WEBHOOK=$ICINGA_CONTACTPAGER

MESSAGE="[$NOTIFICATIONTYPE] Host $HOSTDISPLAYNAME is $HOSTSTATE!"

curl --silent \
     --show-error \
     -X POST \
     -H "Content-type: application/json" \
     --data '{"title": "'"$NOTIFICATIONTYPE"'", "message":"'"$MESSAGE"'", "priority":5}' \
     $GOTIFY_WEBHOOK
