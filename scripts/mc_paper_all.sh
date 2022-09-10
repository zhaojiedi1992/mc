#!/bin/bash
# chkconfig: 2345 20 80
. /etc/init.d/functions

start() {
	service mc_paper_20000 start
	service mc_paper_20010 start
}

stop() {
	service mc_paper_20000 stop
	service mc_paper_20010 stop
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
