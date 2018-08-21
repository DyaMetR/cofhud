--[[
  PICK UP STRINGS
]]

if CLIENT then

  -- Parameters
  local AMMO_SUFIX = "_ammo";
  local AMMO_STR = "ammo_pickup";
  local WEAPON_STR = "weapon_pickup";
  local ITEM_COLOR = Color(255, 255, 255);
  local AMMO_COLOR = Color(255, 0, 0);
  local ITEM_SOUND = "cofhud/item_get.wav";
  local WEAPON_SOUND = "cofhud/weapon_get.wav";

  -- Database
  COFHUD.ItemStrings = {};

  --[[
    Adds an item string upon picking it up
    @param {string} item
    @param {string} string
    @void
  ]]
  function COFHUD:AddItemString(item, string)
    self.ItemStrings[item] = string;
  end

  --[[
    Returns an item string
    @param {string} item
    @param {table|null} args
    @return {string} string
  ]]
  function COFHUD:GetItemString(item, ...)
    if (self.ItemStrings[item] == nil) then return item end;
    return string.format(self.ItemStrings[item], ...);
  end


  --[[
    Pickup history override
  ]]
  hook.Add("HUDDrawPickupHistory", "cofhud_pickup_override", function()
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    if (COFHUD:IsItemPickupEnabled()) then return true end;
  end);

  --[[
    HUDWeaponPickedUp hook
  ]]
  hook.Add("HUDWeaponPickedUp", "cofhud_pickup_weapon", function(weapon)
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    surface.PlaySound(WEAPON_SOUND);
    COFHUD:SendDialog(COFHUD:GetItemString(WEAPON_STR, language.GetPhrase(weapon:GetPrintName())), ITEM_COLOR);
  end);

  --[[
    HUDAmmoPickedUp hook
  ]]
  hook.Add("HUDAmmoPickedUp", "cofhud_pickup_ammo", function(item, amount)
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    surface.PlaySound(ITEM_SOUND);
    COFHUD:SendDialog(COFHUD:GetItemString(AMMO_STR, language.GetPhrase(item..AMMO_SUFIX), amount), AMMO_COLOR);
  end);

  --[[
    HUDItemPickedUp hook
  ]]
  hook.Add("HUDItemPickedUp", "cofhud_pickup_item", function(item)
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    surface.PlaySound(ITEM_SOUND);
    COFHUD:SendDialog(COFHUD:GetItemString(item) or language.GetPhrase(item), ITEM_COLOR);
  end);

end
