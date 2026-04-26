--[[------------
  CRY OF FEAR
Heads Up Display
 Version 1.4.1
    26/04/26
By DyaMetR
]]--------------

-- Main framework table
COFHUD = {};

-- Version
COFHUD.Version = "1.4.1";

--[[
  METHODS
]]

--[[
  Correctly includes a file
  @param {string} file
  @void
]]--
function COFHUD:IncludeFile(file)
  if SERVER then
    include(file);
    AddCSLuaFile(file);
  end
  if CLIENT then
    include(file);
  end
end

--[[
  INCLUDES
]]
COFHUD:IncludeFile("cofhud/core.lua");
