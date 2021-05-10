setup() {
    load 'test_helper/common-setup'
    _common_setup

}

### Services

@test "send Service Warning" {  
    run : ${ICINGA_CONTACTPAGER?"Need to set ICINGA_CONTACTPAGER"} 
    assert_success 

    # Environment variables
    export ICINGA_NOTIFICATIONTYPE="PROBLEM"
    export ICINGA_HOSTALIAS="Test Host"
    export ICINGA_HOSTSTATE="Down"
    # $ICINGA_CONTACTPAGER has to be set by environment 

    export ICINGA_SERVICENAME="Test Service"
    export ICINGA_SERVICESTATE="WARNING"
    export ICINGA_SERVICEOUTPUT="This is a test"

    run ./scripts/gotify-service-notification.sh
}

@test "send Service Critical" {  
    run : ${ICINGA_CONTACTPAGER?"Need to set ICINGA_CONTACTPAGER"} 
    assert_success 

    # Environment variables
    export ICINGA_NOTIFICATIONTYPE="RECOVERY"
    export ICINGA_HOSTALIAS="Test Host"
    export ICINGA_HOSTSTATE="Up"
    # $ICINGA_CONTACTPAGER has to be set by environment 

    export ICINGA_SERVICENAME="Test Service"
    export ICINGA_SERVICESTATE="CRITICAL"
    export ICINGA_SERVICEOUTPUT="This is a test"

    run ./scripts/gotify-service-notification.sh
}

@test "send Service OK" {  
    run : ${ICINGA_CONTACTPAGER?"Need to set ICINGA_CONTACTPAGER"} 
    assert_success 

    # Environment variables
    export ICINGA_NOTIFICATIONTYPE="INFO"
    export ICINGA_HOSTALIAS="Test Host"
    export ICINGA_HOSTSTATE="totally fine"
    # $ICINGA_CONTACTPAGER has to be set by environment 

    export ICINGA_SERVICENAME="Test Service"
    export ICINGA_SERVICESTATE="OK"
    export ICINGA_SERVICEOUTPUT="This is a test"

    run ./scripts/gotify-service-notification.sh
}