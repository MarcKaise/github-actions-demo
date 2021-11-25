#!/usr/bin/env bats

source "${BATS_TEST_DIRNAME}/../hello.sh" >/dev/null 2>/dev/null




@test "hello no error" {
    run hello_no_error
    [ $status -eq 0 ]
}

@test "hello error" {
    run hello_error
    [ $status -eq 1 ]
}

@test "check build_type" {
    VALID_BUILD_TYPES=(
        "standard"
        "safety"
        "standard52"
        "safety52"
    )
    run read_json
    result="1"
    for VALID_BUILD_TYPE in $VALID_BUILD_TYPES[@]; do
        if [ $build_type = $VALID_BUILD_TYPE ]; then
            result="0"
        fi
    done
    [ $result -eq 0 ]
}

@test "check build_type" {
    VALID_BUILD_OPTIONS=(
        "release"
        "release_dlr_ver2"
        "debug"
        "fault_injection"
        "eventlog_long_mode"
        "verbose"
    )
    run read_json
    result="1"
    for VALID_BUILD_OPTION in $VALID_BUILD_OPTIONS[@]; do
        if [ $build_option = $VALID_BUILD_OPTION ]; then
            result="0"
        fi
    done
    [ $result -eq 0 ]
}
