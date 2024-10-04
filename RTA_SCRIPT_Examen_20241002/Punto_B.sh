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

set -x

particion=1

for i in {1..3}
do

	for j in {1..3}
	do

		if [[ $particion == 4 ]]; then
			((particion++))
		fi
	echo "/dev/sdc${particion} Examenes-UTN/alumno_${i}/parcial_${j} ext4 defaults 0   0 " | sudo tee -a /etc/fstab

	((particion++)) 

        done
done

echo "/dev/sdc${particion} Examenes-UTN/profesores ext4 defaults 0   0 " | sudo tee -a /etc/fstab

