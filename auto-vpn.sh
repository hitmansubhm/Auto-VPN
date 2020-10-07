#Author: Cipher007
#Discord: Cipher007#1099
#Credits: Rogue-CTF

#If your VPN connection pack uses an id and a password to connect then follow the commands:
#
#       ==> Store just the username and password in a file in the same directory as the VPN file in two consequent lines.
#       ==> open your VPN file in any text editor and go to the line where auth-user-pass is there. Add the file name next to the auth-user-pass line
#       ==> The adited line should look like: auth-user-pass <filename>
#       ==> Save it and exit the file.
#
#Now in this file, change the path to the openvpn config file
#Run the script as :
#                  sudo bash auto-vpn.sh

#TO-DO: Error Handling during exit and a much more interactive script

FILE="vpn_config.ovpn"            #change this
echo ""
echo ""
echo "                Auto-VPN     "
echo "                        by Cipher007"
echo ""
echo "            Discord: Cipher007#1099"
echo ""
echo ""
sleep 2
count=1
ping -c 4 google.com
echo ""
sudo openvpn $FILE > tmp.txt    
while [ 1 ]; do
	LOG=$(tail -n 1 tmp.txt)
	if [[ $LOG == "error" || $LOG == "unreachable" ]]; then
		echo "ERROR OCCURED!"
		echo ""
		echo "Reconnecting....."
		sudo openvpn $FILE > tmp.txt    
	fi
done
