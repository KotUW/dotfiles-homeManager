#!/bin/env sh

echo "Starting"
grep -v '#' ./config/kitty/kitty.conf | grep '\S' > ./df/kitty.conf
echo "Done"
