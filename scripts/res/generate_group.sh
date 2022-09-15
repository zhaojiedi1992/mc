#!/bin/bash
file=groups.yml
template_file="template.res.groups.yml.template"
head_file="template.res.head.yml.template"
cp $head_file $file
cat group_list.txt  |awk '{print $1,$6,$7,$8}'|while read level max size cost ; do 
	echo "level=$level max=$max size=$size cost=$cost"
	cat $template_file  |sed "s@<size>@$size@g" |sed "s@<max>@$max@g" |sed "s@<level>@$level@g" |sed "s@<cost>@$cost@g" >>$file 
done
echo result_file is   $file
