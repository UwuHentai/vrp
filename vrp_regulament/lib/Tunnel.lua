Tools = {}

local IDGenerator = {}

function Tools.newIDGenerator()
  local r = setmetatable({}, { __index = IDGenerator })
  r:construct()
  return r
end

function IDGenerator:construct()
  self:clear()
end

function IDGenerator:clear()
  self.max = 0
  self.ids = {}
end

-- return a new id
function IDGenerator:gen()
  if #self.ids > 0 then
    return table.remove(self.ids)
  else
    local r = self.max
    self.max = self.max+1
    return r
  end
end

function IDGenerator:free(id)
  table.insert(self.ids,id)
end

Tunnel = {}

local function tunnel_resolve(itable,key)
  local mtable = getmetatable(itable)
  local iname = mtable.name
  local ids = mtable.tunnel_ids
  local callbacks = mtable.tunnel_callbacks
  local identifier = mtable.identifier

  local fcall = function(args,callback)
    if args == nil then
      args = {}
    end
    
    if type(callback) == "function" then 
      local rid = ids:gen()
      callbacks[rid] = callback
      TriggerServerEvent(iname..":tunnel_req",key,args,identifier,rid)
    else
      TriggerServerEvent(iname..":tunnel_req",key,args,"",-1)
    end

  end

  itable[key] = fcall 
  return fcall
end
function Tunnel.bindInterface(name,interface)
  -- receive request
  RegisterNetEvent(name..":tunnel_req")
  AddEventHandler(name..":tunnel_req",function(member,args,identifier,rid)
    local f = interface[member]

    local delayed = false

    local rets = {}
    if type(f) == "function" then
      TUNNEL_DELAYED = function()
        delayed = true
        return function(rets)
          rets = rets or {}
          if rid >= 0 then
            TriggerServerEvent(name..":"..identifier..":tunnel_res",rid,rets)
          end
        end
      end

      rets = {f(table.unpack(args))} 
    end

    if not delayed and rid >= 0 then
      TriggerServerEvent(name..":"..identifier..":tunnel_res",rid,rets)
    end
  end)
end
function Tunnel.getInterface(name,identifier)
  local ids = Tools.newIDGenerator()
  local callbacks = {}

  -- build interface
  local r = setmetatable({},{ __index = tunnel_resolve, name = name, tunnel_ids = ids, tunnel_callbacks = callbacks, identifier = identifier })

  -- receive response
  RegisterNetEvent(name..":"..identifier..":tunnel_res")
  AddEventHandler(name..":"..identifier..":tunnel_res",function(rid,args)
    local callback = callbacks[rid]
    if callback ~= nil then
      ids:free(rid)
      callbacks[rid] = nil

      callback(table.unpack(args))
    end
  end)

  return r
end
