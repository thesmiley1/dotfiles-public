#!/usr/bin/env bash

if [[ `which go 2> /dev/null` ]]; then
  if [[ ! -z `go env GOBIN` ]]; then
    PATH="$PATH:$(go env GOBIN)"
  else
    PATH="$PATH:$(go env GOPATH)/bin"
  fi
fi
