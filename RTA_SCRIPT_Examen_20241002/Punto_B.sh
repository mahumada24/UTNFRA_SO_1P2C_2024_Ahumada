#!/bin/bash

#!/bin/bash

DISCO="/dev/sdc"

sudo fdisk $DISCO << EOF
n
p


+1G
n
p


+1G
n
p


+1G
n
e


n

+900M
n

+900M
n

+900M
n

+900M
n

+900M
n

+900M
n

+900M

w
EOF
