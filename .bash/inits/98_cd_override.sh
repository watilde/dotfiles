#!/bin/bash

# Master cd function that executes post-cd hooks
cd() {
  builtin cd "$@"
  for hook in "${post_cd_hooks[@]}"; do
    "$hook"
  done
}
