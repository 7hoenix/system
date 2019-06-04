#!/bin/bash

wget \
  --recursive \
  --no-clobber \
  --page-requisites \
  --html-extension\
  --convert-links \
  --domains postgrest.org \
  --no-parent \
    http://postgrest.org/en/v5.2/
