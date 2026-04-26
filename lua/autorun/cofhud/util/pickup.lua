--[[
  PICK UP STRINGS
]]

if CLIENT then

  -- Parameters
  local AMMO_SUFFIX = "_ammo";
  local AMMO_STR = "ammo_pickup";
  local WEAPON_STR = "weapon_pickup";
  local ITEM_COLOR = Color(255, 255, 255);
  local AMMO_COLOR = Color(255, 0, 0);
  local ITEM_SOUND = "cofhud/item_get.wav";
  local WEAPON_SOUND = "cofhud/weapon_get.wav";
  local AMMO_PICKUPS = {
      ammo_pickup = function(ammo, amount) return string.format(language.GetPhrase("cofhud.pickup.ammo_mag"), ammo, amount); end,
      ammo_pickup_single = function(ammo, amount) return string.format(language.GetPhrase("cofhud.pickup.ammo"), amount, ammo); end,
      ammo_pickup_box = function(ammo, amount) return string.format(language.GetPhrase("cofhud.pickup.ammo_box"), ammo, amount); end,
      ammo_pickup_bolts = function(ammo, amount) return string.format(language.GetPhrase("cofhud.pickup.ammo_pack"), ammo, amount); end,
      ammo_pickup_slam = function(ammo, amount) return string.format(language.GetPhrase("cofhud.pickup.ammo_alt"), amount, ammo); end
  };

  COFHUD.AmmoPickupStrings = {};

  --[[
    Adds a unique pickup string for an ammo type.
    @param {string} ammoType
    @param {string} str
  ]]
  function COFHUD:AddAmmoPickupString(ammoType, str)
      self.AmmoPickupStrings[ammoType] = str;
  end

  --[[
    Returns a custom ammo pickup string if it's available
    @param {string} ammoType
    @return {function} function
  ]]
  function COFHUD:GetAmmoStringFunction(ammoType)
      return AMMO_PICKUPS[self.AmmoPickupStrings[ammoType] or AMMO_STR];
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
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled() or not IsValid(weapon)) then return end;
    local printName = weapon:GetClass();
    if (weapon.GetPrintName) then printName = weapon:GetPrintName() end
    surface.PlaySound(WEAPON_SOUND);
    COFHUD:SendDialog(string.format(language.GetPhrase("cofhud.pickup.weapon"), language.GetPhrase(printName)), ITEM_COLOR);
  end);

  --[[
    HUDAmmoPickedUp hook
  ]]
  hook.Add("HUDAmmoPickedUp", "cofhud_pickup_ammo", function(ammotype, amount)
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    surface.PlaySound(ITEM_SOUND);
    COFHUD:SendDialog(COFHUD:GetAmmoStringFunction(ammotype)(language.GetPhrase(ammotype .. AMMO_SUFFIX), amount), AMMO_COLOR);
  end);

  --[[
    HUDItemPickedUp hook
  ]]
  hook.Add("HUDItemPickedUp", "cofhud_pickup_item", function(item)
    if (not COFHUD:IsEnabled() or not COFHUD:IsItemPickupEnabled()) then return end;
    surface.PlaySound(ITEM_SOUND);
    COFHUD:SendDialog(string.format(language.GetPhrase("cofhud.pickup.item"), language.GetPhrase(item)), ITEM_COLOR);
  end);

end
