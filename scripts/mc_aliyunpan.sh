#!/bin/bash
# chkconfig: 2345 20 80
. /etc/init.d/functions
base_dir=/tmp/
start() {
	cd $base_dir
	aliyunpan login -RefreshToken=1e634d4300bd4fd19b354a5e21d29289
	nohup aliyunpan webdav start -ip "127.0.0.1" -port 23077 -webdav_user "admin" -webdav_password "admin123" -pan_drive "File" -pan_dir_path "/" &
	mount -t davfs http://localhost:23077 /mc_backup
}

stop() {
	cd $base_dir
	ps aux |grep aliyunpan |grep -v grep  |awk '{print $2}' |while read pid ; do
		kill -9 $pid
	done
}

case "$1" in 
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
       stop
       start
       ;;
    status)
       # code to check status of app comes here 
       # example: status program_name
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 
