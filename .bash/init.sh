#!/bin/bash
export INITS=$HOME/.bash/inits/*
for FILE in $INITS; do
  source $FILE
done
