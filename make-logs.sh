#!/bin/bash
#==========================================================================
#        FILE: make_logs.sh
#
# DESCRIPTION: Pipes the output of the adb logcat command to the tee 
#              command to write to stdout and to write logfiles
#              Creates a directory tree: year/month/daylogfile.
#
#      AUTHOR: Mihai Gătejescu
#     VERSION: 1.0.2
#     CREATED: 05.09.2017
#==========================================================================

#==========================================================================
# Copyright 2017 Mihai Gătejescu
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#==========================================================================

# Display usage and exit, if erroneous input
if [ ! $# = 0 ] && [ ! $# = 1 ]; then
	echo Usage: make_logs.sh "adb logcat filter option"
	exit 1
fi

path="d:/logs"

# Go the the location of the logs
cd "$path"

# Initialize variables: year, month, day
year=$(date +"%Y")
month=$(date +"%B")
day=$(date +"%d")

# Create year directory
if [ ! -d $year ]; then
	mkdir $year
fi
cd $year

# Create month directory
if [ ! -d $month ]; then
	mkdir $month
fi
cd $month

# Clear adb logs and console
adb logcat -c
clear

# Start logging
if [ -f $day ]; then
	adb logcat | tee -a $day
else
	adb logcat | tee $day
fi
