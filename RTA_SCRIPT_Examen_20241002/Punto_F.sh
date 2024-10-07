#!/bin/bash
echo "Mi IP publica es: $(curl -s ifconfig.me)" | tee -a ~/repogit/UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Avanzado.txt

echo "Mi usuario es: $(whoami)" | tee -a ~/repogit/UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Avanzado.txt

echo -n "El hash de mi Usuario es: " | sudo tee -a UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Avanzado.txt && sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}' | tee -a UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Avanzado.txt

cd ~/repogit/UTNFRA_SO_1P2C_2024_Ahumada && echo -n "La URL de mi repositorio es: $(git remote get-url origin)" |tee -a ~/repogit/UTNFRA_SO_1P2C_2024_Ahumada/RTA_ARCHIVOS_Examen_20241005/Filtro_Avanzado.txt

