#!/bin/sh
sensors -uA 'coretemp-*' | grep '^  temp' | sed -e 's/\s*//;s/:\s*/|int|/;s/\..*//'
echo
