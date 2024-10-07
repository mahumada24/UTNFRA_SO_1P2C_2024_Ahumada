#!/bin/bash		

#Indicamos cual va a ser el interprete con el que se debe ejecutar el script


#El script crea varias carpetas, el -p se usa para que, si no esta creada, la cree en ese momento.
#El sudo fue usado ya que, normalmente, en la carpeta raiz "/", solo los superusuarios pueden realizar cambios

sudo mkdir -p /Examenes-UTN/{alumno_1/parcial_{1..3},alumno_2/parcial_{1..3},alumno_3/parcial_{1..3},profesores}


