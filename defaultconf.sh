#!/bin/bash

export PATH=$PATH:/opt/ruby1.8/bin/:/opt/ruby1.8/sbin/

puppet --modulepath=./modules/ -v ./manifests/site.pp
