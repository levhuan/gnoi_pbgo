package main

import (
	"fmt"
	gnoi "github.com/openconfig/gnoi"
	gSystem "github.com/openconfig/gnoi/system"
)

func main() {
	d := gSystem.Package{
		Filename: "test_filename",
		Version:  "0.1",
		Activate: false,
		RemoteDownload: &gnoi.RemoteDownload{
			Path:     "user@myhost:/users/test",
			Protocol: gnoi.RemoteDownload_SCP,
			Credentials: &gnoi.Credentials{
				Username: "user_credentials",
			},
		},
	}
	fmt.Println(d)
}
