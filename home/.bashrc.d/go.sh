#!/usr/bin/env bash

if [[ `which go` ]]; then
  if [[ ! -z `go env GOBIN` ]]; then
    PATH="$PATH:$(go env GOBIN)"
  else
    PATH="$PATH:$(go env GOPATH)/bin"
  fi
fi
