# AndroidLibV2rayLite

## 编译太难了！

* 首先，需要将本地的go安装调整成对应版本(查看文件[go.mod](./go.mod)中，go 1.19则是1.19)

* 其次调整对应变量，如本地有安卓环境修改

```
ANDROID_HOME=/Users/sanbo/tools/sdk
export ANDROID_HOME
ANDROID_NDK_HOME=/Users/sanbo/tools/sdk/ndk/19.2.5345600
PATH:=$(PATH):$(GOPATH)/bin
export PATH

```
* 最后挨个开始编译
1. make pb
2. make asset
3. make fetchDep
4. make BuildMobile

* 更新`libtun2socks.so`, 调用指令: bash compile-tun2socks.sh