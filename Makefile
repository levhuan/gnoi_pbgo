MY_GOPATH = $(subst /src,,$(PWD))
MY_GOROOT = /Users/huanle/opensource/go-1.8.1/go
GO = ${MY_GOROOT}/bin/go

.phony: clean

all: test_app

test_app: main.go
	GOPATH=${MY_GOPATH} GOROOT=${MY_GOROOT} ${GO} build -x -o $@ $<

clean:
	rm -f test_app
