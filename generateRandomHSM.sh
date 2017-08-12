#!/bin/bash

# This script will generate random numbers based on the Smartcard-HSM (cardcontact.de)
# It uses opensc-explorers scripting capability to chain APDU commands
# created 09.08.2017

display_usage() {
	echo -e "This script generates Smartcard-HSM generated random numbers\n"
	echo -e "Usage:\ngenerateRandomHSM [length] [output filename]\n" 
}

if [  $# -lt 1 ] 
	then 
		display_usage
		exit 1
fi
	
if [ $1 -le 256 ]
then
random=$(/usr/bin/opensc-explorer 2> /dev/null <<EOF
cd aid:E82B0601040181C31F0201
random $1
EOF
)
else
echo "Length must be in the range 0..256"
fi
random=$(sed -e 1d -e s/^.*:\ // <<< "$random" | cut -d ' ' -f 1-16 | sed -e s/\ //g | tr -d '\n')
if [ $# -le 1 ]
then
echo "$random" | xxd -r -p | hexdump -C
else
echo "$random" | xxd -r -p > $2
fi





