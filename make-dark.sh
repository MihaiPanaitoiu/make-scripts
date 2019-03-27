#!/bin/bash
#==========================================================================
#        FILE: make_dark.sh
#
# DESCRIPTION: Change to UI of the Android devide to dark mode
#
#      AUTHOR: Mihai Gătejescu
#     VERSION: 1.0.0
#     CREATED: 27.03.2019
#==========================================================================

#==========================================================================
# Copyright 2019 Mihai Gătejescu
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

# Change to dark mode
adb shell settings put secure ui_night_mode 2

# Need reboot after changing to night mode
adb reboot