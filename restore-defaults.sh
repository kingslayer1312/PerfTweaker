#!/bin/bash

systemctl stop perf_prof.service
systemctl disable perf_prof.service
systemctl daemon-reload

cd /etc/systemd/system/
rm -f perf_prof.service

cd /usr/local/bin/
rm -f perf_prof.sh