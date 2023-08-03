#!/bin/sh

# sensors output depends on hardware (your mileage may vary)
host=$(hostname)
if [ "$host" = "Nbook" ]; then
  cpu_temp=$(sensors | awk '/CPU/{printf "%.0f°C\n", $2}')
  gpu_temp=$(sensors | awk '/edge/{printf "%.0f°C\n", $2}')
  mem_temp=$(sensors | awk '/SODIMM/{printf "%.0f°C\n", $2}')
  ssd_temp=$(sensors | awk '/Composite/{printf "%.0f°C\n", $2}')
  echo "C:$cpu_temp G:$gpu_temp M:$mem_temp D:$ssd_temp"
elif [ "$host" = "PC" ]; then
  cpu_temp=$(sensors | awk '/Package id 0/{printf "%.0f°C\n", $4}')
  gpu_temp=$(sensors | grep temp1 | awk 'NR==2 {printf "%.0f°C\n", $2}')
  hdd_temp=$(hddtemp /dev/sda | awk '{printf "%.0f°C\n", $4}')
  echo "C:$cpu_temp G:$gpu_temp D:$hdd_temp"
else
  echo "Unknown host"
fi
