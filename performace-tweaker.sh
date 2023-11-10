#!/bin/bash

# Getting a list of available governors
modes=($(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors))
echo "Your CPU supports the following modes: "
echo ${modes[*]}

echo "Choose a mode: "
read selected_mode

cd /usr/local/bin/
rm -f cpu_gov.sh
echo "#!/bin/bash" >> cpu_gov.sh
echo "echo $selected_mode | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> cpu_gov.sh
chmod 744 /usr/local/bin/cpu_gov.sh

cd /etc/systemd/system/
rm -f cpu_gov.service
echo "[Unit]" >> cpu_gov.service
echo "After=network.target" >> cpu_gov.service
echo -en '\n' >> cpu_gov.service
echo "[Service]" >> cpu_gov.service
echo "ExecStart=/usr/local/bin/cpu_gov.sh" >> cpu_gov.service
echo -en '\n' >> cpu_gov.service
echo "[Install]" >> cpu_gov.service
echo "WantedBy=default.target" >> cpu_gov.service
chmod 664 /etc/systemd/system/cpu_gov.service

systemctl daemon-reload
systemctl enable cpu_gov.service
systemctl start cpu_gov.service
