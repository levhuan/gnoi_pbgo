## Notes
- Install protoc (v3.2.0) and change src/Makefile to invoke the installed protoc
- Reproducing step:
```bash
# remove all the pb.go in src/github.com/openconfig/gnoi
make -C src clean

# regnerate all pb.go from gnoi proto files
make -C src all

# compile the test application
make all
GOPATH=/Users/huanle/opensource/gnoi_pbgo GOROOT=/Users/huanle/opensource/go-1.8.1/go /Users/huanle/opensource/go-1.8.1/go/bin/go build -x -o test_app main.go
WORK=/var/folders/_8/rmfb2mqx40q_8srm6fgswx0r0000gn/T/go-build998198343
import cycle not allowed
package main
        imports github.com/openconfig/gnoi
        imports github.com/openconfig/gnoi
make: *** [test_app] Error 1
```
