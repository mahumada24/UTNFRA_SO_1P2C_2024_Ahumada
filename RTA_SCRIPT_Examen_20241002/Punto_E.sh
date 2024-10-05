#!/bin/bash

touch repogit/UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Basico.txt

head -n 1 /proc/meminfo > repogit/UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Basico.txt

sudo dmidecode -t chassis | head -n 7 | tail -n 2 >> repogit/UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Basico.txt
