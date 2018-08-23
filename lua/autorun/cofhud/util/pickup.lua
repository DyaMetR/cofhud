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

  --[[
    Returns a custom ammo pickup string if it's available
    @param {string} ammoType
    @return {string} string
  ]]
  function COFHUD:GetAmmoString(ammoType)
    local string = self:GetAmmoType(self:CurrentLanguage(), ammoType);
    if (not self:HasAmmoType(ammoType) or string == nil) then return AMMO_STR end;
    return string;
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
    COFHUD:SendDialog(COFHUD:GetString(WEAPON_STR, language.GetPhrase(weapon:GetPrintName())), ITEM_COLOR);
  end);

  --[[
    HUDAmmoPickedUp hook
  ]]
  hook.Add("HUDAmmoPickedUp", "cofhud_pickup_ammo", function(item, amount)
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    surface.PlaySound(ITEM_SOUND);
    COFHUD:SendDialog(COFHUD:GetString(COFHUD:GetAmmoString(item), language.GetPhrase(item..AMMO_SUFIX), amount), AMMO_COLOR);
  end);

  --[[
    HUDItemPickedUp hook
  ]]
  hook.Add("HUDItemPickedUp", "cofhud_pickup_item", function(item)
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    surface.PlaySound(ITEM_SOUND);
    COFHUD:SendDialog(COFHUD:GetString(item) or language.GetPhrase(item), ITEM_COLOR);
  end);

end
