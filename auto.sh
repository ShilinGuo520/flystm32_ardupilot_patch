#!/bin/bash

git clone https://github.com/mikemccauley/libmaple.git
echo "git clone libmaple dome"

cd libmaple
cp main.cpp.example main.cpp
make jtag
echo "make libmaple dome"

cd -
git clone https://github.com/ArduPilot/ardupilot.git
cd ardupilot
git checkout ArduCopter-3.2
echo "git clone ArduCopter dome"

cd -
patch -p1 < 0001-Modify.patch
patch -p1 < 0002-Add-flymaple-config.mk.patch
patch -p1 < 0003-Add-libmaple-path-.-libmaple.patch
patch -p1 < 0004-Modify-eeprom-address-in-flash.patch
patch -p1 < 0005-Flymaple_InertialSensor-Support-MPU6050-i2c.patch
echo "patch dome"

cd ./ardupilot/ArduCopter
make flymaple
echo "make ArduCopter dome"

cp /tmp/ArduCopter.build/ArduCopter.hex ./
echo "The ArduCopter.hex use jtag flash"


