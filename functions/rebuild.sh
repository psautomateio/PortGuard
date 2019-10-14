#!/bin/bash
#
# Title:      PSAutomate
# Based On:   PGBlitz (Reference Title File)
# Original Author(s):  Admin9705 - Deiteq
# PSAutomate Auther: fattylewis
# URL:        https://psautomate.io - http://github.psautomate.io
# GNU:        General Public License v3.0
################################################################################

# Rebuilds the Container / To Open or Close the Ports
rebuild () {
docker ps -a --format "{{.Names}}"  > /psa/var/container.running

sed -i -e "/traefik/d" /psa/var/container.running
sed -i -e "/watchtower/d" /psa/var/container.running
sed -i -e "/wp-*/d" /psa/var/container.running
sed -i -e "/x2go*/d" /psa/var/container.running
sed -i -e "/authclient/d" /psa/var/container.running
sed -i -e "/dockergc/d" /psa/var/container.running
sed -i -e "/oauth/d" /psa/var/container.running

count=$(wc -l < /psa/var/container.running)
((count++))
((count--))

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️  PortGuard - Rebuilding Containers!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
sleep 2
for ((i=1; i<$count+1; i++)); do
	app=$(sed "${i}q;d" /psa/var/container.running)

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
↘️  PortGuard - Rebuilding [$app]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
	sleep .5
	bash /psa/apps/programs/$app/start.sh
done

echo ""
tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅️  PortGuard - Containers have been Reconfigured!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
read -p 'Continue? | Press [ENTER] ' name < /dev/tty
}
