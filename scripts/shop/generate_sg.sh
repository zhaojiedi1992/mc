#!/bin/bash
file=sell.yml
template_file="template.trmenu.sell.body.yml.template"
head_file="template.trmenu.sell.head.yml.template"
/usr/bin/cp $head_file $file
cat sg.txt |grep -v "个数" |awk '{print $1,$2,$3,$4,$5,$6}'|while read name cname price left_cnt right_cnt sleft_cnt ; do 
	echo "name=$name cname=$cname price=$price left_cnt=$left_cnt right_cnt=$right_cnt sleft_cnt=$sleft_cnt "
	cat $template_file  |sed "s@<sleft_cnt>@$<sleft_cnt@g"  |sed "s@<left_cnt>@$left_cnt@g" \
    |sed "s@<right_cnt>@$right_cnt@g"  |sed "s@<price>@$price@g" \
    |sed "s@<cname>@$cname@g"  |sed "s@<name>@$name@g" >>$file

echo result_file is   $file
echo "你可以执行如下指令"
dt=$(date "+%F")
# echo "/usr/bin/cp /mc/instances/s1/plugins/Residence/groups.yml ./history/groups.yml.$dt"
# echo "/usr/bin/cp groups.yml /mc/instances/s1/plugins/Residence/groups.yml"
# echo "/usr/bin/cp groups.yml /mc/instances/s2/plugins/Residence/groups.yml"
