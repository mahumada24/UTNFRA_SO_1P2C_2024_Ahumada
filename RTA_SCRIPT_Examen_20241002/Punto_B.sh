#!/bin/bash

#!/bin/bash

DISCO="/dev/sdc"

#ARRANCAMOS A PARTICIONAR, COLOCANDO DENTRO DEL EOF, LAS LETRAS Y MONTOS QUE DEBEMOS COLOCAR EN LAS PARTICIONES
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
#ACA TERMINAMOS EL PARTICIONAMIENTO

for i in {1..11} #REALIZAMOS UN FOR, QUE VAYA PASANDO POR CADA PARTICION, UTILIZANDO EL VALOR i COMO NUMERO DE PARTICION
do
#UTILIZAMOS EL EOF PARA PONER LA y QUE NOS VA A PERMITIR DARLE QUE SI AUTOMATICAMENTE A LA HORA DE PARTICIONAR
sudo mkfs.ext4 /dev/sdc$i <<EOF
y
EOF 
done

set -x

#CREAMOS UNA VARIABLE, CON VALOR 1, QUE VA A TOMAR EL PAPEL DE CONTADOR. ESTO PARA USARLO COMO NUMERO DE PARTICION MAS ABAJO
particion=1

for i in {1..3} #ESTE FOR RECORRE LA CARPETA ALUMNOS, UNA VEZ QUE TERMINA CON LOS PARCIALES, VUELVE Y SUMA 1, PASANDO DE alumno_1 A alumno_2, Y ASI CON TODOS
do

	for j in {1..3} #ESTE FOR RECORRE LOS PARCIALES, PARCIALES, CUANDO TERMINA DE RECORRER LOS 3, SALE PARA QUE ALUMNO SUME 1
	do

		if [[ $particion == 4 ]]; then #ESTE IF SE SALTEA LA PARTICION 4, LA MISMA ES UNA EXTENDIDA, LA CUAL NO ES POSIBLE MONTAR, PERO SI SE MONTARAN LAS LOGICAS DENTRO DE ESTA
			((particion++))
		fi
	echo "/dev/sdc${particion} /Examenes-UTN/alumno_${i}/parcial_${j} ext4 defaults 0   0 " | sudo tee -a /etc/fstab #ESTE ES EL COMANDO PARA ESCRIBIR DONDE SE MONTARAN LAS PARTICIONES EN EL ARCHIVO /etc/fstab

	((particion++))  

        done
done

echo "/dev/sdc${particion} /Examenes-UTN/profesores ext4 defaults 0   0 " | sudo tee -a /etc/fstab  #AQUI, LA PARTICION QUE FALTA, SE AVISARA QUE SE MONTE EN LA CARPETA PROFESORES


<<EOF
#######################AGREGAMOS AL ARCHIVO /dev/sdc LAS PARTICIONES#############################################
EOF

sudo mount -a #MONTAMOS LO QUE SE ENCUENTRA EN LA CARPETA /etc/fstab

<<EOF
################################MONTAMOS LAS PARTICIONES#########################################################
EOF
