#!/usr/bin/env bash

function hello_no_error () {
    echo "Hello - No Error!"
    return 0
}

function hello_error () {
    echo "Hello - Error!"
    return 1
}
