#!/bin/sh
#set -vx

export CI=true

# Start OpenStack Swift
nohup /init &

# Wait For TCP 8080
while ! nc -vz -w 1 localhost 8080; do # DevSkim: ignore DS162092
	sleep 1
done

# Create "test.txt" File
printf "TEST" >test.txt

# Create OpenStack Swift "test" Container
swift -A http://127.0.0.1:8080/auth/v1.0 -U test:tester -K testing post test # DevSkim: ignore DS162092

# Upload "test.txt" in OpenStack Swift "test" Container
swift -A http://127.0.0.1:8080/auth/v1.0 -U test:tester -K testing upload test test.txt # DevSkim: ignore DS162092

printf "OpenStack Swift start !"

# Sleep infinity
sleep infinity
