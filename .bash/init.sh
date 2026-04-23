#!/bin/bash
for FILE in "$HOME/.bash/inits/"*; do
  source "$FILE"
done
