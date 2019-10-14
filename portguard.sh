#!/bin/bash
#
# Title:      PSAutomate
# Based On:   PGBlitz (Reference Title File)
# Original Author(s):  Admin9705 - Deiteq
# PSAutomate Auther: fattylewis
# URL:        https://psautomate.io - http://github.psautomate.io
# GNU:        General Public License v3.0
################################################################################
source /psa/portguard/functions/variables.sh

# KEY VARIABLE RECALL & EXECUTION
program=$(cat /psa/tmp/program_var)
mkdir -p /psa/var/cron/
mkdir -p /psa/var/cron
# FUNCTIONS START ##############################################################
primestart
# FUNCTIONS END ##############################################################
break=off && while [ "$break" == "off" ]; do primestart; done
