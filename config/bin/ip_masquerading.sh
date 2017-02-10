

if [ $USER != root ]
then
	echo "This script needs root privileges"
	exit 1
fi


echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

