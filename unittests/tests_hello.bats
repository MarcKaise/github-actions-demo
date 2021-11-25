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
