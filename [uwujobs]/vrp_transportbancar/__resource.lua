description "Transport Medical"

dependency "vrp"

client_scripts{ 
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "npc.lua",
  "client.lua",
  "bonus.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}