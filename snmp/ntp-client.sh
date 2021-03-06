#!/usr/bin/env bash
################################################################
# copy this script to somewhere like /opt and make chmod +x it #
# edit your snmpd.conf and include                             #
# extend ntp-client /opt/ntp-client.sh                         #
# restart snmpd and activate the app for desired host          #
# please make sure you have the path/binaries below            #
################################################################
# Binaries and paths required                                  #
################################################################ 
BIN_NTPQ='/usr/sbin/ntpq'
BIN_GREP='/usr/bin/grep'
BIN_TR='/usr/bin/tr'
BIN_CUT='/usr/bin/cut'
################################################################
# Don't change anything unless you know what are you doing     #
################################################################
CMD1=`$BIN_NTPQ -c rv | $BIN_GREP 'jitter' | $BIN_TR '\n' ' '`
IFS=', ' read -r -a array <<< "$CMD1"

for value in 2 3 4 5 6
do
	echo ${array["$value"]} | $BIN_CUT -d "=" -f 2
done

