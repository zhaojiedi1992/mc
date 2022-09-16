
cat perm.txt |while read perm ; do 
	echo "perm=$perm"
	/etc/init.d/mc_hub conn "$perm"
	#bash -x /etc/init.d/mc_hub conn "$perm"
	sleep 1
done
