#!/bin/bash

wget \
  --recursive \
  --no-clobber \
  --page-requisites \
  --html-extension\
  --convert-links \
  --domains elm-lang.org \
  --no-parent \
    https://package.elm-lang.org/packages/elm-explorations/test/latest/
