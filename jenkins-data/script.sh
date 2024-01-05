#!/bin/bash

NAME=$1
LNAME=$2
SHOW=$3

if [ "$SHOW" = "true" ]; then
  echo "Hello, $NAME $LNAME"
else
  echo "If you want to see the name, please mark the show option"
fi


