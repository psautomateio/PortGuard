#!/bin/bash
#
# Title:      PSAutomate
# Based On:   PGBlitz (Reference Title File)
# Original Author(s):  Admin9705 - Deiteq
# PSAutomate Auther: fattylewis
# URL:        https://psautomate.io - http://github.psautomate.io
# GNU:        General Public License v3.0
################################################################################

# Main Area
primestart () {
ports=$(cat /psa/var/server.ports)
if [ "$ports" == "127.0.0.1:" ]; then guard="CLOSED" && opp="Open";
else guard="OPEN" && opp="Close"; fi
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🤖 Welcome to PortGuard ~ 📓 Reference: portguard.psautomate.io
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Server Ports are Currently: [$guard]

1. $opp Ports
Z. EXIT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

  read -p 'Type a Number | Press [ENTER]: ' typed < /dev/tty
  if [ "$typed" == "1" ]; then
    if [ "$guard" == "CLOSED" ]; then echo "" > /psa/var/server.ports
  else echo "127.0.0.1:" > /psa/var/server.ports; fi
    rebuild
elif [[ "$typed" == "z" || "$typed" == "Z" ]]; then exit;
else badinput; fi
}
