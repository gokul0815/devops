#!/bin/bash

# The service we want to check (according to systemctl)
SERVICE=nginx.service
SER=unicorn_freshgrc-server
# Where to send the restart mail to
MAILBOX=gokulk@fixnix.co

if [ "`systemctl is-active $SERVICE`" != "active" ] 
then 
	echo "$SERVICE wasnt running so attempting restart"
	systemctl restart $SERVICE
	echo "Mailing $MAILBOX with current status"
	systemctl status $SERVICE | mail -s "$SERVICE was restarted" $MAILBOX
	exit 0
else if [ "`systemctl is-active $SER`" != "active" ] 
then 
	echo "$SER wasnt running so attempting restart"
	systemctl restart $SERVICE
	echo "Mailing $MAILBOX with current status"
	systemctl status $SER | mail -s "$SER was restarted" $MAILBOX
	exit 0
	
fi 
echo "nginx and unicorn services are running"
exit 0

