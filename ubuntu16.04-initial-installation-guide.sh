#on the localhost
scp ~/Downloads/amdgpu-pro-16.40-348864.tar.xz sanjay@192.168.0.109:/home/sanjay
scp ~/Downloads/AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 sanjay@192.168.0.109:/home/sanjay

scp AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 amdgpu-pro-16.40-348864.tar.xz claymore-v12.5.tar.gz claymore-eth-9.7.tar.gz snj@10.0.0.33:/home/snj

#on the remote host

sudo apt-get update

sudo apt-get upgrade -y

sudo apt-get install lm-sensors -y

tar -xf amdgpu-pro-16.40-348864.tar.xz 

cd ~/amdgpu-pro-16.40-348864

sudo ./amdgpu-pro-install -y

# for amdgpu 16.30 sudo ./amdgpu-pro-install -y --allow-unauthenticated


sudo reboot

ssh sanjay@192.168.0.109

