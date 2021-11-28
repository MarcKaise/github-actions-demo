#!/usr/bin/env bats

setup() {
    # Configulation
    git_path=https://github.com/MarcKaise/hello-world.git

    # Read config.json
    CONF="${BATS_TEST_DIRNAME}/../config.json"
    branch_name=$(cat $CONF | jq -r '.branch_name' )
    build_type=$(cat $CONF | jq -r '.build_type' )
    build_option=$(cat $CONF | jq -r '.build_option' )

    # Expected values
    VALID_BUILD_TYPES=(
        "standard"
        "safety"
        "standard52"
        "safety52"
    )

    VALID_BUILD_OPTIONS=(
        "release"
        "release_dlr_ver2"
        "debug"
        "fault_injection"
        "eventlog_long_mode"
        "verbose"
    )
}

teardown() {
    rm -rf test_branchname/
}

@test "check branch_name" {
    # Error Message
    echo "Invalid branch_name. Please check config.json"

    # Test
    run git clone -b $branch_name --depth 1 $git_path test_branchname/
    [ $status -eq 0 ]
}

@test "check build_type" {
    # Error Message
    echo "Invalid build_type. Please check config.json"

    # Test
    result=1
    for VALID_BUILD_TYPE in "${VALID_BUILD_TYPES[@]}"; do
        if [ "${build_type}" = "${VALID_BUILD_TYPE}" ]; then
            result=0
        fi
    done
    [ $result -eq 0 ]
}

@test "check build_option" {
    # Error Message
    echo "Invalid build_option. Please check config.json"

    # Test
    result="1"
    for VALID_BUILD_OPTION in ${VALID_BUILD_OPTIONS[@]}; do
        if [ $build_option = $VALID_BUILD_OPTION ]; then
            result="0"
        fi
    done
    [ $result -eq 0 ]
}
