--[[------------
  CRY OF FEAR
Heads Up Display
 Version 1.1.2
    05/09/18
By DyaMetR
]]--------------

-- Main framework table
COFHUD = {};

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
