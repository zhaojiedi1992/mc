#!/bin/bash
file=groups.yml
template_file="template.res.groups.yml.template"
head_file="template.res.head.yml.template"
cp $head_file $file
cat group_list.txt |grep -v "个数" |awk '{print $1,$6,$7,$8}'|while read level max size cost ; do 
	level=$(echo $level |sed 's@default@Default@g')
	echo "level=$level max=$max size=$size cost=$cost"
	cat $template_file  |sed "s@<size>@$size@g" |sed "s@<max>@$max@g" |sed "s@<level>@$level@g" |sed "s@<cost>@$cost@g" >>$file 
done
echo result_file is   $file
echo "你可以执行如下指令"
dt=$(date "+%F")
echo "/usr/bin/cp /mc/instances/s1/plugins/Residence/groups.yml ./history/groups.yml.$dt"
echo "/usr/bin/cp groups.yml /mc/instances/s1/plugins/Residence/groups.yml"
echo "/usr/bin/cp groups.yml /mc/instances/s2/plugins/Residence/groups.yml"
