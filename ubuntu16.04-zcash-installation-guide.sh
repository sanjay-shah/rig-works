scp ~/Downloads/AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 ~/Downloads/claymore-v12.5.tar.gz ~/Downloads/amdgpu-pro-16.40-348864.tar.xz snj@10.0.0.28:/home/snj

sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y

sudo apt autoremove

echo "Installing oh-my-zsh"
sudo apt-get install zsh git-core -y
sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
echo "Installing sensors"
sudo apt-get install lm-sensors -y
echo "Installing amdgpu-pro"
# Need amd-16.4 for optiminer
tar xf amdgpu-pro-16.40-348864.tar.xz 
sudo amdgpu-pro-driver/amdgpu-pro-install -y
sudo sensors-detect
sudo reboot

tar xf AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2
sudo ./AMD-APP-SDK-v3.0.130.136-GA-linux64.sh
sudo usermod -a -G video $LOGNAME
exit

tar xf claymore-v12.5.tar.gz
mv Claymore\'s\ ZCash\ AMD\ GPU\ Miner\ v12.5\ -\ LINUX/ claymore-v12.5
vi claymore-v12.5/start-ml.sh


