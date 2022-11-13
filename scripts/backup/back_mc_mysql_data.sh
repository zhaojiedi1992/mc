#!/bin/bash
# desc 增量和全量备份脚本，天级别全备份，增量备份小时级别。
# 支持还原到任意时刻数据库数据，数据文件后面配合磁盘快照做。
# 区别数据库文件和世界存档文件可以回滚任意时刻。

# 获取basedir
basedir=`cd $(dirname $0); pwd -P`

# 基础变量
# 日期
dt=$(date "+%F")
# 小时
hour=$(date "+%H")
# 基于那个时间点的增量
before_hour=$(echo "(${hour}-1+24)%24" |bc)
# 目标备份位置
dst_dir="/mc_bak/mc_db/${dt}/${hour}"
# 基于增量的位置
base_dst_dir="/mc_bak/mc_db/${dt}/00"
# 备份前缀 这里建议写到.my.conf文件中，记录账户，密码，主机信息。
backup_prefix="  "
#backup_prefix=" --user=root --password=xxxxxxxxx --host=127.0.0.1 "

# 确保目录存在
mkdir -pv ${dst_dir} >/dev/null 2>/dev/null
mkdir -pv ${basedir}/${dt} >/dev/null 2>/dev/null

# 执行命令记录
exec_cmd_file="${basedir}/history.txt"
# 执行日志记录
exec_log_file="${basedir}/${dt}/${hour}.log"

# 全量备份的 凌晨整点开始的
if [ X"${hour}" == "X00" ] ; then 
	echo "mariabackup --backup --target-dir=${dst_dir} ${back_prefix}" >> ${exec_cmd_file}
	mariabackup --backup --target-dir=${dst_dir} ${back_prefix} >>${exec_log_file} 2>>${exec_log_file}
# 增量备份的，除了0点的其他的时间都按照增量来，基于上一个增量文件
else 
	echo "mariabackup --backup --target-dir=$dst_dir --incremental-basedir=${base_dst_dir} ${backup_prefix}" >>${exec_cmd_file}
	mariabackup --backup --target-dir=$dst_dir --incremental-basedir=${base_dst_dir} ${backup_prefix} >>${exec_log_file} 2>>${exec_log_file}
fi




