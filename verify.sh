#!/bin/sh
# validate the syntax of yml and json CFN files
aws cloudformation validate-template --template-body "file://$1"