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
    name=$(cat config.json | jq -r '.branch_name' )
    type=$(cat config.json | jq -r '.build_type' )
    option=$(cat config.json | jq -r '.build_option' )
    return 0
}

read_json

echo $name
echo $type
echo $option
