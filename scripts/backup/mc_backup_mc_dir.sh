#!/bin/bash

dt=$(date "+%Y-%m-%d-%H-%M-%S")
tar cf /mc_bak/mc_instances/mc.${dt}.tar /home/mc
#mysqldump -h 127.0.0.1 -ppanda142857 --databases  PlayerDataSQL VentureChat authme minecraft money quickshop tab trixey trmenu >/mc_bak/mc_db/mc.core.${dt}.sql
#mysqldump -h 127.0.0.1 -ppanda142857 --databases  CoreProtect >/mc_bak/mc_db/mc.cp.${dt}.sql
