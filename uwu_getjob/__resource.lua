
author 'envox#3274'

description 'onDuty script'

version '0.1'

client_scripts{
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
