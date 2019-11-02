--[[
----------------------------------------------------------------------------
____________________________________________________________________________
						
						AUTHOR : GiZz

						Maj FXServer
						Update FXServer

						Linux only
____________________________________________________________________________
						
---------------------------------------------------------------------------
]]--


#!/bin/sh
 
BASEURL="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"
BUILD=$(wget -qO- $BASEURL | xargs -I {} echo {} | grep '<a href' | grep -oE '[0-9]*-[A-Za-z0-9]{40}' | sort -u | tail -n -1)
URL="$BASEURL/$BUILD/fx.tar.xz"
 
wget -O /tmp/fx.tar.xz $URL
 
rm -rf /opt/fx-server/*
 
cd /opt/fxserver
 
tar -xf /tmp/fx.tar.xz