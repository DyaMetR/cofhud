--[[
  CORE
]]


if CLIENT then
  -- Hide default HUD
  local hide = {
  	CHudHealth = true,
  	CHudBattery = true,
    CHudDamageIndicator = true,
    CHudAmmo = true,
    CHudSecondaryAmmo = true,
    CHudHistoryResource = true
  }

  hook.Add( "HUDShouldDraw", "cofhud_hide_default_hud", function( name )
    if (not COFHUD:IsEnabled()) then return end;
    hide.CHudHealth = COFHUD:IsHealthEnabled();
    hide.CHudBattery = COFHUD:IsArmorEnabled();
    hide.CHudAmmo = COFHUD:IsAmmoEnabled();
    hide.CHudSecondaryAmmo = COFHUD:IsAmmoEnabled();
    hide.CHudDamageIndicator = COFHUD:IsDamageEffectEnabled();
  	if ( hide[ name ] ) then return false end;
  end )
end

-- Config
COFHUD:IncludeFile("config/config.lua");
COFHUD:IncludeFile("config/menu.lua");

-- Utils
COFHUD:IncludeFile("util/numbers.lua");
COFHUD:IncludeFile("util/ammunition.lua");
COFHUD:IncludeFile("util/bar.lua");
COFHUD:IncludeFile("util/clip.lua");
COFHUD:IncludeFile("util/death.lua");
COFHUD:IncludeFile("util/intro.lua");
COFHUD:IncludeFile("util/dialog.lua");
COFHUD:IncludeFile("util/pickup.lua");

-- Elements
COFHUD:IncludeFile("elements/ammunition.lua");
COFHUD:IncludeFile("elements/draw.lua");
COFHUD:IncludeFile("elements/health.lua");
COFHUD:IncludeFile("elements/damage.lua");
COFHUD:IncludeFile("elements/camera.lua");
//COFHUD:IncludeFile("elements/hand.lua");
COFHUD:IncludeFile("elements/intro.lua");
COFHUD:IncludeFile("elements/notification.lua");

-- Data
COFHUD:IncludeFile("data/ammunition.lua");
COFHUD:IncludeFile("data/items.lua");

-- Load add-ons
local files, directories = file.Find("autorun/cofhud/add-ons/*.lua", "LUA");
for _, file in pairs(files) do
  COFHUD:IncludeFile("add-ons/"..file);
end
