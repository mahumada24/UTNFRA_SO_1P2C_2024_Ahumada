#!/bin/bash

USUARIO=$(whoami)

sudo mkdir -p /home/${USUARIO}/Estructura_Asimetrica/{correo/{cartas{1..100},carterps{1..10}},clientes/cartas{1..100}}
