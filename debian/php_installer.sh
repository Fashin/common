sudo apt install ca-certificates apt-transport-https 
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
sudo echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install php7.0
