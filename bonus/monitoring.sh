#!/bin/bash

all_logs=$(tail -n15 /var/log/auth.log)

failed_logs=$(tail -n15 /var/log/auth.log | grep "Connection closed by authenticating" | wc -l)

#touch -c ./.logs

#if [ $failed_logs -ge 3 ] && [ ! "$(echo "$all_logs")" = "$(cat ./.logs)" ]; then
if [ $failed_logs -ge 3 ]; then
	echo -e "Subject: Warning!\nSomeone is attempting to log in to the server." | msmtp andranikadyan@gmail.com
fi

#echo "$all_logs" > ./.logs
