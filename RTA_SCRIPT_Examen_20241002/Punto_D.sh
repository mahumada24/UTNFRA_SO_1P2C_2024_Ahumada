#!/bin/bash

USUARIO=$(whoami) #Creamos una variable que contenga el usuario

#Creamos en el home, una carpeta que contenga lo solicitado en el examen, con el -p para que, si no existe la direccion, se cree.
mkdir -p /home/${USUARIO}/Estructura_Asimetrica/{correo/{cartas{1..100},carterps{1..10}},clientes/cartas{1..100}}
