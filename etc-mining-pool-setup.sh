
# Install go 1.8
sudo add-apt-repository ppa:gophers/archive
sudo apt-get update
sudo apt-get install golang-1.8
sudo ln -s /usr/lib/go-1.8/bin/go /usr/bin/go
go version

go get -v github.com/ethereumproject/go-ethereum/...
go install github.com/ethereumproject/go-ethereum/cmd/...
screen
~/go/bin/geth --fast --cache=512 console

~/go/bin/geth --rpc console

cd open-ethereum-pool 

./build/bin/open-ethereum-pool config.json

cd open-ethereum-pool/www/

ember server --port 8082 --environment development

