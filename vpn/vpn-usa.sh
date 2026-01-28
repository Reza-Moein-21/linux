VPN_USER=pre1m2019605
VPN_PASS=32925

echo -e $VPN_PASS | sudo openconnect --user=$VPN_USER --passwd-on-stdin cmhous.goodfst.com

