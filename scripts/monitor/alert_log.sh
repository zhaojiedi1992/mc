find /home/mc/instances/ -name "latest.log" |while read file; do 
	grep ERR -c -H  $file; 
done


