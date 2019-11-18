#!/bin/bash

set -eux -o pipefail

uptime && date

# Adding the community repository
CURRENT_REPO="$(cat /etc/apk/repositories )"
echo "${CURRENT_REPO}" | sed 's/main/community/g' | tee -a /etc/apk/repositories

# Update system
apk upgrade -U --available --no-cache

# Install base packages
apk --no-cache add curl bash bash-completion rsync

# Configure root to use bash
sed -i 's#/ash#/bash#g' /etc/passwd

# Trick vagrant by creating a dummy shutdown command
cat <<EOF > /sbin/shutdown
#!/bin/sh
echo "INFO: Got the command: shutdown ${*}"
echo "INFO: Replacing by: poweroff"
/sbin/poweroff
EOF
chmod a+x /sbin/shutdown

# Create a persisted folder for the customized resources
mkdir -p /var/customize
chmod -R 777 /var/customize
