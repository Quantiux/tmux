#!/bin/sh

mem_load=$(free -m | awk '/Mem/{printf $3"/"$2}')mb
cpu_load=$(vmstat 1 2 | tail -1 | awk '{ printf 100-$15; }')%
sys_load=$(uptime | awk '{printf $(NF)}')
echo "$mem_load $cpu_load $sys_load"
