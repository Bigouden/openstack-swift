#!/bin/sh
#set -vx

export CI=true

# Start OpenStack Swift
nohup /init &

# Wait For TCP 8080
while ! nc -vz -w 1 127.0.0.1 8080 >/dev/null 2>&1; do # DevSkim: ignore DS162092
	sleep 1
done

# Create "test.txt" File
printf "TEST" >test.txt

# Create OpenStack Swift "test" Container
swift -A http://127.0.0.1:8080/auth/v1.0 -U test:tester -K testing post test >/dev/null 2>&1 # DevSkim: ignore DS162092

# Upload "test.txt" in OpenStack Swift "test" Container
swift -A http://127.0.0.1:8080/auth/v1.0 -U test:tester -K testing upload test test.txt >/dev/null 2>&1 # DevSkim: ignore DS162092

echo "OpenStack Swift start !"

# Sleep infinity
sleep infinity
