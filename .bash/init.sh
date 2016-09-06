#!/bin/bash
export INITS=$HOME/.bash/inits/*
for file in $INITS; do
  source $file
done
