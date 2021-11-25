#!/usr/bin/env bats

CONF="${BATS_TEST_DIRNAME}/../config.json"

branch_name=$(cat $CONF | jq -r '.branch_name' )
build_type=$(cat $CONF | jq -r '.build_type' )
build_option=$(cat $CONF | jq -r '.build_option' )

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

@test "check build_type" {
    # テスト対象の$build_typeはsourceした時点で設定されている
    result="1"
    for VALID_BUILD_TYPE in "${VALID_BUILD_TYPES[@]}"; do
        if [ "${build_type}" = "${VALID_BUILD_TYPE}" ]; then
            result="0"
        fi
    done
    [ $result -eq 0 ]
}

@test "check build_option" {
    # テスト対象の$build_optionはsourceした時点で設定されている
    result="1"
    for VALID_BUILD_OPTION in ${VALID_BUILD_OPTIONS[@]}; do
        if [ $build_option = $VALID_BUILD_OPTION ]; then
            result="0"
        fi
    done
    [ $result -eq 0 ]
}
