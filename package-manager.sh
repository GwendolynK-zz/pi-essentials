#!/bin/bash
#
# Created by: Westley K
# email: westley@sylabs.io
# Date: Aug 1, 2018
# version-1.0.0
#
# MIT License
#
# Copyright (c) 2018 WestleyK
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

set -e

REPO_LOCATION="packages/"

REPO_URL="https://github.com/"
MY_REPO="WestleyK/"
BACKLIGHT="backlight"
RPI_BRIGHTNESS="rpi-brightness"
EASY_CLONE="easy-clone"
DRIVE_MOUNT="drive-mounting-script"
CALC="calc"




# are you root?
IS_ROOT=$( id -u )
if [ $IS_ROOT != 0 ]; then
	echo "Please run as root!"
	echo "try: sudo ./package-manager.sh"
	exit 1
fi

install_all() {

	if [[ ! -d "$REPO_LOCATION" ]]; then
		echo "Making: "$REPO_LOCATION
		echo $REPO_LOCATION
		mkdir -p $REPO_LOCATION
	fi
	
	if [[ ! -d "$REPO_LOCATION$BACKLIGHT" ]]; then
		echo "Install: "$BACKLIGHT
		cd $REPO_LOCATION
		git clone $REPO_URL$MY_REPO$BACKLIGHT
		cd $BACKLIGHT
		chmod +x backlight-pi
		cp backlight-pi /usr/local/bin/
		cd ..
	        cd ..	
	fi

	if [[ ! -d "$REPO_LOCATION$RPI_BRIGHTNESS" ]]; then
		echo "Install: "$RPI_BRIGHTNESS
		cd $REPO_LOCATION
		git clone $REPO_URL$MY_REPO$RPI_BRIGHTNESS
		cd $RPI_BRIGHTNESS
		gcc -o rpi-brightness pi-brightness.c
		chmod +x rpi-brightness
		cp rpi-brightness /usr/local/bin/
		cd ..
		cd ..
	fi

	if [[ ! -d "$REPO_LOCATION$EASY_CLONE" ]]; then
		echo "Install: "$EASY_CLONE
		cd $REPO_LOCATION
		git clone $REPO_URL$MY_REPO$EASY_CLONE
		cd $EASY_CLONE
		chmod +x hubget
		cp hubget /usr/local/bin/
		#source ~/pi-essentials/packages/easy-clone/auto-complete.sh
		cd ..
		cd ..
	fi

	if [[ ! -d "$REPO_LOCATION$MOUNT_DRIVE" ]]; then
		echo "Install: "$MOUNT_DRIVE
		cd $REPO_LOCATION
		git clone $REPO_URL$MY_REPO$MOUNT_DRIVE
		cd $MOUNT_DRIVE
		chmod +x drive-mounter
		cp drive-mounter /usr/local/bin/
		cd ..
		cd ..
	fi
	
	if [[ ! -d "$REPO_LOCATION$CALC" ]]; then
		echo "Install: "$CALC
		cd $REPO_LOCATION
		git clone $REPO_URL$MY_REPO$CALC
		cd $CALC
		gcc -o calc calc.c
		chmod +x calc
		cp calc /usr/local/bin/
		cd ..
		cd ..
	fi
}

if [[ -d "$REPO_LOCATION" ]]; then
	echo "Updating..."
	rm -r $REPO_LOCATION
	install_all
	echo "Done."
	exit 0
fi

echo "Done."
exit 0





#
# End script
#


