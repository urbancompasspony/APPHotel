#!/bin/bash

# Código adaptado da função que eu utilizo pra rodar games non-steam.
# Crie uma pasta raiz chamada WINE, dentro crie uma garrafa APPHotel e cole este .sh ao lado.

# ================ # Painel de Controle # ================= #

function init {

    folderA # Executar da pasta Main WINE
    #folderB # Executar da 'Área de Trabalho'

    export WINEPREFIX=$wd/"APPHotel"
    export GAMEPATH="/drive_c/APP/Plus/Recursos/Exe/"
    export GAMEEXE="WinHotelPlus.exe"
    
    #dll
    #gpu
    #vulkan # Padrão LogLevel OFF e HUD Full!
    
    #screen0 # Ajusta a tela antes da execução do jogo!
    #flags="/allres" # Define manualmente parâmetros/flags no Game! Descomente ao final.
    
    ExeD # exeDefault - WINE do Sistema
    winecustom=tkg-4.6-x86_64 # Caso habilitar ExeM!
    #ExeM # exeCustoM!

    #screen1 # Ajusta a tela depois da execução do jogo!
}

#========================================================== #

# Detalhes de Execução para Referencias #

# Pacotes Extras: A
# Wine Version: B
# DXVK: C

#========================================================== #

# Constante do Script
function folderA {
    wd="$( cd "$(dirname "$0")" ; pwd -P )"
}

function folderB {
    wd="/mnt/ssd/WINE" # De qualquer(*) local!
# *Se for mal montado, poderá ter problemas na execução.
}

# Variveis dll
function dll {
    export WINEDLLOVERRIDES=d3d11,dxgi=n
}

# Ajustes de GPU
function gpu {
    LD_PRELOAD="libpthread.so.0 libGL.so.1"
    export __GL_THREADED_OPTIMIZATIONS=1
    export __GL_YIELD=NOTHING
}

# Ajustes do Vulkan
function vulkan {
    #export DXVK_SPIRV_OPT=ON
    #export DXVK_SHADER_OPTIMIZE=1
    #export DXVK_DEBUG_LAYERS=0
    #export DXVK_SHADER_DUMP_PATH="/tmp"
    #export DXVK_SHADER_READ_PATH="/tmp"
    export DXVK_LOG_LEVEL=none
    export DXVK_HUD=full # ,fps,version
}

function screen0 {
    xrandr -s 1024x768
    #xgamma -gamma 0.9
    #killall mate-panel
    #killall caja
}

function screen1 {
    xrandr -s 1366x768
    xgamma -gamma 0.9
    killall mate-panel
    killall caja
}


# Execução
function ExeD {
    cd "/mnt/app/Plus/Recursos/Exe/Dll/"
    wine "$WINEPREFIX"/"$GAMEPATH"/"$GAMEEXE"
}

# Variáveis de Execução do Wine Custom
function ExeM {
    export WINEPATH=$wd"/wine/$winecustom"

    export PATH=$WINEPATH"/bin" 
    export WINELOADER=$WINEPATH"/bin/wine" 
    export LD_LIBRARY_PATH=$WINEPATH"/lib" 
    export WINESERVER=$WINEPATH"/bin/wineserver"
    export WINEDLLPATH=$WINEPATH"/lib/wine/fakedlls"
    export WINEDEBUG="-all"

    cd "/mnt/app/Plus/Recursos/Exe/Dll/"
    $WINELOADER "$WINEPREFIX"/"$GAMEPATH"/"$GAMEEXE"
}

# Inicio do Script!

init

# Fim #
