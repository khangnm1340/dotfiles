#!/bin/bash

if ! pidof -x "anyrun-provider"; then
      anyrun
else
      anyrun close
fi
