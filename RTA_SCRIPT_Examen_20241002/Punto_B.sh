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
#####DISCO PARTICIONADO#
EOF

for i in {1..11}
do
sudo mkfs.ext4 /dev/sdc$i <<EOF
y
EOF
done



