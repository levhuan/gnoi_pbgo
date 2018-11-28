GOPATH = $(subst /src,,$(PWD))
GNOI = ${GOPATH}/src/github.com/openconfig/gnoi
PROTOC = ${GOPATH}/protoc-3.2.0/bin/protoc

.phony: clean

all: ${GNOI}/types.pb.go \
	${GNOI}/common.pb.go \
	${GNOI}/bgp/bgp.pb.go \
	${GNOI}/cert/cert.pb.go \
	${GNOI}/file/file.pb.go \
	${GNOI}/interface/interface.pb.go \
	${GNOI}/layer2/layer2.pb.go \
	${GNOI}/mpls/mpls.pb.go \
	${GNOI}/system/system.pb.go

fix: ${GNOI}/types.pb.go \
	${GNOI}/bgp/bgp.pb.go \
	${GNOI}/cert/cert.pb.go \
	${GNOI}/file/file.pb.go \
	${GNOI}/interface/interface.pb.go \
	${GNOI}/layer2/layer2.pb.go \
	${GNOI}/mpls/mpls.pb.go \
	${GNOI}/system/system.pb.go

%.pb.go: %.proto
	${PROTOC} -I=${GOPATH}/src:${GNOI} \
		--plugin=${GOPATH}/bin/protoc-gen-go \
		--go_out=plugins=grpc:. $<

clean:
	find ${GNOI} -name "*.pb.go" | xargs -n1 rm -f
