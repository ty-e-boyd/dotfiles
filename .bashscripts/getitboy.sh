#!/bin/bash

min=${1:-25}
let seconds=$min*60
echo "Waiting ${min} minutes"
sleep $seconds
say "Get it boi!"
echo "Get it boi!"

