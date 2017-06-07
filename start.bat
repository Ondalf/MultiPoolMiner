setx GPU_FORCE_64BIT_PTR 1
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

powershell -version 5.0 -noexit -executionpolicy bypass -windowstyle maximized -command "&.\multipoolminer.ps1 -wallet 1Gug2546jAsdfRecuw4P3Ciqg6kXtHYjsb -username aaronsace -workername multipoolminer -interval 60 -location europe -type nvidia -pool zpool -currency btc,usd -donate 10"
