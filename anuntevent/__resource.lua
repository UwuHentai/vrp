description "Transport Medical"

dependency "vrp"

client_scripts{ 
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "npc.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}

files {
  "html/uwuhentai.html",
  "html/restart.ogg"
}

ui_page 'html/uwuhentai.html'