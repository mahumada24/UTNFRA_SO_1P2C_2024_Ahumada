#!/bin/bash

ALUMNOS=p1c2_2024_A  #Creamos y asignamos el valor correspondiente a la variable ALUMNOS
PROFESORES=p1c2_2024_P1 #Creamos y asignamos el valor correspondiente a la variable PROFESORES

#Realizamos la creacion de los dos grupos solicitados
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

#Con un FOR, vamos recorriendo cada alumno y, gracias a que ya creamos los grupos, en el mismo comando les asignamos uno
#Tambien, le establecemos la contraseña, siendo igual a su nombre de Usuario
for i in {1..3}
do

    sudo useradd -m -s /bin/bash -c "$ALUMNOS$i" -g p1c2_2024_gAlumno $ALUMNOS$i -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print$2}')" $ALUMNOS$i
    sudo grep -E 'vagrant|$ALUMNOS$i' /etc/shadow |awk -F ':' '{print $2}'   

done
#En el caso del usuario profesor, no usamos el for ya que hay uno solo
sudo useradd -m -s /bin/bash -c "$PROFESORES" -g p1c2_2024_gProfesores -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print$2}')" $PROFESORES
sudo grep -E 'vagrant|p1c2_2024_P1' /etc/shadow |awk -F ':' '{print $2}'


#Cambiamos el dueño de las carpetas solicitadas
sudo chown p1c2_2024_A1  /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A2  /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A3  /Examenes-UTN/alumno_3
sudo chown ${PROFESORES} /Examenes-UTN/profesores

#Realizamos la modificacion de los permisos
sudo chmod 730 /Examenes-UTN/alumno_1
sudo chmod 760 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_3
sudo chmod 773 /Examenes-UTN/profesores

#Sin acceder al usuario de cada uno, realizamos la creacion y escritura de un usuario "validar.txt"
donde iria con el comando "whoami", el nombre de usuario de cada dueño de la carpeta alumno_x
sudo su -c "whoami" p1c2_2024_A1 | sudo tee /Examenes-UTN/alumno_1/validar1.txt
sudo su -c "whoami" p1c2_2024_A2 | sudo tee /Examenes-UTN/alumno_2/validar2.txt
sudo su -c "whoami" p1c2_2024_A3 | sudo tee /Examenes-UTN/alumno_3/validar3.txt
sudo su -c "whoami" p1c2_2024_P1 | sudo tee /Examenes-UTN/profesores/profesores.txt

