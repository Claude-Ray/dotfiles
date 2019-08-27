#!/bin/bash

# https://unix.stackexchange.com/questions/108174/how-to-persistently-control-maximum-system-resource-consumption-on-mac/221988#293062

sudo /usr/libexec/PlistBuddy /Library/LaunchAgents/com.launchd.maxfiles.plist \
-c "add Label string com.launchd.maxfiles" \
-c "add ProgramArguments array" \
-c "add ProgramArguments: string launchctl" \
-c "add ProgramArguments: string limit" \
-c "add ProgramArguments: string maxfiles" \
-c "add ProgramArguments: string 10240" \
-c "add ProgramArguments: string unlimited" \
-c "add RunAtLoad bool true"

sudo /usr/libexec/PlistBuddy /Library/LaunchAgents/com.launchd.maxproc.plist \
-c "add Label string com.launchd.maxproc" \
-c "add ProgramArguments array" \
-c "add ProgramArguments: string launchctl" \
-c "add ProgramArguments: string limit" \
-c "add ProgramArguments: string maxproc" \
-c "add ProgramArguments: string 2000" \
-c "add ProgramArguments: string unlimited" \
-c "add RunAtLoad bool true"

sudo launchctl load /Library/LaunchAgents/com.launchd.*

