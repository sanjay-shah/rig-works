sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y dist-upgrade
echo "Installing oh-my-zsh"
sudo apt-get install zsh git-core -y
sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
echo "Installing sensors"
sudo apt-get install lm-sensors
echo "Installing amdgpu-pro"
tar xf amdgpu-pro_16.30.3-315407.tar.xz 
sudo amdgpu-pro-driver/amdgpu-pro-install
sudo sensors-detect
sudo reboot

tar xf AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2
sudo ./AMD-APP-SDK-v3.0.130.136-GA-linux64.sh
exit

sudo usermod -a -G video $LOGNAME

sudo apt-get install build-essential -y
git clone https://github.com/mbevand/silentarmy.git && cd silentarmy && make