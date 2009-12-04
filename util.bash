#!/bin/bash

# Utility functions and aliases for bash scripts

ss496_error() { echo "$@" >&2; return 1; }

ss496_die() { ss496_error "$@"; exit $?; }

ss496_ensure() {
  check_$1 \
      && echo "$1 is already running" \
      || {
           start_$1 \
               && echo "$1 started" \
               || ss496_error "$1 failed to start" \
               ;
         }
}
