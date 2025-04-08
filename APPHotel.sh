#!/bin/bash

# Código adaptado da função que eu utilizo pra rodar games non-steam.
# Crie uma pasta raiz chamada WINE, dentro crie uma garrafa APPHotel e cole este .sh ao lado.

wd="$( cd "$(dirname "$0")" ; pwd -P )"

export WINEPREFIX=$wd/"APPHotel"
export APPPATH="/drive_c/APP/Plus/Recursos/Exe/WinHotelPlus.exe"
    
cd "/mnt/app/Plus/Recursos/Exe/Dll/"
wine "$WINEPREFIX"/"$APPPATH"
