# generateRamdomHSM
This bash script will generate random numbers up to a length of 256 byte
using the Smartcard-HSM from cardcontact.de
usage:
	./generateRandomHSM.sh <length> <filename>
length has to be in the range 1-256
use filename only if you want output to a binary file, else you get a canonical hex outout to the terminal.
