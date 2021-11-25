#!/usr/bin/env bats

source "${BATS_TEST_DIRNAME}/../hello.sh" >/dev/null 2>/dev/null

BUILD_TYPE_LIST=(
    "standard"
    "safety"
    "standard52"
    "safety52"
)
BUILD_OPTION_LIST=(
    "release"
    "release_dlr_ver2"
    "debug"
    "fault_injection"
    "eventlog_long_mode"
    "verbose"
)

@test "hello no error" {
    run hello_no_error
    [ $status -eq 0 ]
}

@test "hello error" {
    run hello_error
    [ $status -eq 1 ]
}

@test "check build_type" {
    run read_json
    result="1"
    for BUILD_TYPE in "${BUILD_TYPE_LIST[@]}"; do
        if [ $type = $BUILD_TYPE ]; then
            result="0"
        fi
    done
    [ $result -eq 0 ]
}
