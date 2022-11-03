#!/bin/bash
file=sell.yml
template_file="template.trmenu.sell.body.yml"
head_file="template.trmenu.sell.head.yml"
/usr/bin/cp $head_file $file
cat sg.txt |grep -v "个数" |awk '{print $1,$2,$3,$4,$5,$6}'|while read name cname price left_cnt right_cnt sleft_cnt ; do 
	echo "name=$name cname=$cname price=$price left_cnt=$left_cnt right_cnt=$right_cnt sleft_cnt=$sleft_cnt "
	cat $template_file  |sed "s@<sleft_cnt>@$sleft_cnt@g"  |sed "s@<left_cnt>@$left_cnt@g" |sed "s@<right_cnt>@$right_cnt@g"  |sed "s@<price>@$price@g" |sed "s@<cname>@$cname@g"  |sed "s@<name>@$name@g" >>$file
done
echo result_file is   $file
echo "你可以执行如下指令"
dt=$(date "+%F%H-%M-%S")
/usr/bin/cp /mc/instances/d1/plugins/TrMenu/menus/$file ./history/$file.$dt
echo "/usr/bin/cp $file /mc/instances/hub/plugins/TrMenu/menus/"
echo "/usr/bin/cp $file /mc/instances/d1/plugins/TrMenu/menus/"
echo "/usr/bin/cp $file /mc/instances/d2/plugins/TrMenu/menus/"
echo "/usr/bin/cp $file /mc/instances/s1/plugins/TrMenu/menus/"
echo "/usr/bin/cp $file /mc/instances/s2/plugins/TrMenu/menus/"
echo "/usr/bin/cp $file /mc/instances/s3/plugins/TrMenu/menus/"
echo "/usr/bin/cp $file /mc/instances/s4/plugins/TrMenu/menus/"
echo "/usr/bin/cp $file /mc/instances/z1/plugins/TrMenu/menus/"
