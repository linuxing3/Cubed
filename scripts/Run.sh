#!/bin/bash

export LD_LIBRARY_PATH=`realpath bin/Debug-linux-ARM64/Cubed-Server`

exec bin/Debug-linux-ARM64/Cubed-Server/Cubed-Server
