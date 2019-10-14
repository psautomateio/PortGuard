#!/bin/bash
#
# Title:      PSAutomate
# Based On:   PGBlitz (Reference Title File)
# Original Author(s):  Admin9705 - Deiteq
# PSAutomate Auther: fattylewis
# URL:        https://psautomate.io - http://github.psautomate.io
# GNU:        General Public License v3.0
################################################################################

# Simple Note To Notify User that Input Is Bad
badinput () {
echo
read -p '⛔️ ERROR - BAD INPUT! | PRESS [ENTER] ' typed < /dev/tty
}
