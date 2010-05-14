#!/bin/bash

export PATH=$PATH:/opt/ruby1.8/bin/:/opt/ruby1.8/sbin/

puppet --modulepath=/root/mypuppet-recipes/modules/ -v /root/mypuppet-recipes/manifests/site.pp

