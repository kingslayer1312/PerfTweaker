#!/bin/bash

# Getting a list of available governors
modes=($(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors))
echo "Your CPU supports the following modes: "
echo ${modes[*]}

echo "Choose a mode: "
read selected_mode

cd /usr/local/bin/
rm -f perf_prof.sh
echo "#!/bin/bash" >> perf_prof.sh
echo "echo $selected_mode | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> perf_prof.sh
chmod 744 /usr/local/bin/perf_prof.sh

cd /etc/systemd/system/
rm -f perf_prof.service
echo "[Unit]" >> perf_prof.service
echo "After=network.target" >> perf_prof.service
echo -en '\n' >> perf_prof.service
echo "[Service]" >> perf_prof.service
echo "ExecStart=/usr/local/bin/perf_prof.sh" >> perf_prof.service
echo -en '\n' >> perf_prof.service
echo "[Install]" >> perf_prof.service
echo "WantedBy=default.target" >> perf_prof.service
chmod 664 /etc/systemd/system/perf_prof.service

systemctl daemon-reload
systemctl enable perf_prof.service
systemctl start perf_prof.service