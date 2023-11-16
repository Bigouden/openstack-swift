#!/bin/sh
#set -vx

if [ -z "${CI}" ]; then
	if ! swift -A http://127.0.0.1:8080/auth/v1.0 -U test:tester -K testing stat >/dev/null 2>&1; then # DevSkim: ignore DS162092
		printf "OpenStack Swift KO"
	else
		printf "OpenStack Swift OK"
	fi
else
	if ! swift -A http://127.0.0.1:8080/auth/v1.0 -U test:tester -K testing list test >/dev/null 2>&1; then # DevSkim: ignore DS162092
		printf "OpenStack Swift KO"
	else
		printf "OpenStack Swift OK"
	fi
fi
