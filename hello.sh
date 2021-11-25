#!/usr/bin/env bash

function hello_no_error () {
    echo "Hello - No Error!"
    return 0
}

function hello_error () {
    echo "Hello - Error!"
    return 1
}

function read_json () {
    branch_name=$(cat config.json | jq -r '.branch_name' )
    build_type=$(cat config.json | jq -r '.build_type' )
    build_option=$(cat config.json | jq -r '.build_option' )
    return 0
}
