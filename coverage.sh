#!/bin/bash

ROOT=$PWD

meson test -C build

cp /usr/share/vala-0.56/vapi/glib-2.0.vapi build/unit.p

cd build/unit.p
find ./ -type f -name "*.c" -exec cp {} . \;

gcovr --version

gcovr -r $ROOT --txt --jacoco jacoco.xml -o $ROOT/build/meson-logs/ --gcov-ignore-errors=all

cat $ROOT/build/meson-logs/coverage.txt
rm $ROOT/build/meson-logs/coverage.txt
