--[[
  ITEM STRINGS
]]

if CLIENT then

  -- Weapon and ammo pickups
  COFHUD:AddItemString("ammo_pickup", "Picked up a %s magazine with %d rounds");
  COFHUD:AddItemString("weapon_pickup", "You got the %s");

  -- Healthkit and healthvial
  COFHUD:AddItemString("item_healthkit", "Picked up a health kit");
  COFHUD:AddItemString("item_healthvial", "Picked up a health vial");

  -- Armor battery
  COFHUD:AddItemString("item_battery", "Picked up a suit battery");

end
