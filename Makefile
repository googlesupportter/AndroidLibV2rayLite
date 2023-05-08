pb:
	  go get -u github.com/golang/protobuf/protoc-gen-go
		@echo "pb Start"
asset:
	bash gen_assets.sh download
	mkdir assets
	cp -v data/*.dat assets/
	#cd assets;curl https://raw.githubusercontent.com/2dust/AndroidLibV2rayLite/master/data/geosite.dat > geosite.dat		
	#cd assets;curl https://raw.githubusercontent.com/2dust/AndroidLibV2rayLite/master/data/geoip.dat > geoip.dat

fetchDep:
	go get -v golang.org/x/mobile/cmd/...
	mkdir -p $(shell go env GOPATH)/src/v2ray.com/core
	git clone https://github.com/v2fly/v2ray-core.git $(shell go env GOPATH)/src/v2ray.com/core
	go get -d github.com/2dust/AndroidLibV2rayLite

ANDROID_HOME=/Users/sanbo/tools/sdk
export ANDROID_HOME
ANDROID_NDK_HOME=/Users/sanbo/tools/sdk/ndk/19.2.5345600
PATH:=$(PATH):$(GOPATH)/bin
export PATH

BuildMobile:
	gomobile init
	#go mod tidy -v
	gomobile bind -v -androidapi 19 -ldflags='-s -w' ./

all: asset pb fetchDep
	@echo DONE
