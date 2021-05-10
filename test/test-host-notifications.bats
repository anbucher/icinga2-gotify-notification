setup() {
    load 'test_helper/common-setup'
    _common_setup

}

### Hosts

@test "send HOST Problem" {  
    run : ${ICINGA_CONTACTPAGER?"Need to set ICINGA_CONTACTPAGER"} 
    assert_success 

    # Environment variables
    export ICINGA_NOTIFICATIONTYPE="PROBLEM"
    export ICINGA_HOSTALIAS="Test Host"
    export ICINGA_HOSTSTATE="Down"
    # $ICINGA_CONTACTPAGER has to be set by environment 

    run ./scripts/gotify-host-notification.sh
}

@test "send HOST Recovery" {  
    run : ${ICINGA_CONTACTPAGER?"Need to set ICINGA_CONTACTPAGER"} 
    assert_success 

    # Environment variables
    export ICINGA_NOTIFICATIONTYPE="RECOVERY"
    export ICINGA_HOSTALIAS="Test Host"
    export ICINGA_HOSTSTATE="Up"
    # $ICINGA_CONTACTPAGER has to be set by environment 

    run ./scripts/gotify-host-notification.sh
}

@test "send HOST Info" {  
    run : ${ICINGA_CONTACTPAGER?"Need to set ICINGA_CONTACTPAGER"} 
    assert_success 

    # Environment variables
    export ICINGA_NOTIFICATIONTYPE="INFO"
    export ICINGA_HOSTALIAS="Test Host"
    export ICINGA_HOSTSTATE="totally fine"
    # $ICINGA_CONTACTPAGER has to be set by environment 

    run ./scripts/gotify-host-notification.sh
}