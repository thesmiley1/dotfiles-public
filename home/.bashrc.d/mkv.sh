#!/usr/bin/env bash

function mkvstrip() {
  mkvpropedit "$1" --tags all:
}
