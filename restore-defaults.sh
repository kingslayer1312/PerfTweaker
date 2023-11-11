#!/bin/bash

systemctl stop cpu_gov.service
systemctl disable cpu_gov.service
systemctl daemon-reload

cd /etc/systemd/system/
rm -f cpu_gov.service

cd /usr/local/bin/
rm -f cpu_gov.sh