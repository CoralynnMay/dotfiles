echo "deb http://repo.sinew.in/ stable main" > \
       	/etc/apt/sources.list.d/enpass.list
wget -O - https://dl.sinew.in/keys/enpass-linux.key | apt-key add -
apt update
apt install enpass
