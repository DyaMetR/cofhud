--[[
  CURRENT WEAPON CLIP
]]

if CLIENT then

  -- Parameters
  local DEFAULT_CLIP_SIZES = {
    ["weapon_pistol"] = 18,
    ["weapon_357"] = 6,
    ["weapon_smg1"] = 45,
    ["weapon_ar2"] = 30,
    ["weapon_shotgun"] = 6,
    ["weapon_crossbow"] = 1,
    ["weapon_annabelle"] = 2
  };

  -- Weapons database
  COFHUD.CustomAmmoScript = {}; -- Custom script to display ammo
  COFHUD.CustomWeaponAmmoDisplay = {}; -- Linked weapons to a custom script

  --[[
    Adds a script to display ammunition.
    Function must accept a weapon entity as first parameter.
    @param {string} id
    @param {function(weapon, ...)} func
  ]]
  function COFHUD:AddCustomAmmoScript(id, func)
    self.CustomAmmoScript[id] = func;
  end

  --[[
    Links a previously added custom ammo script to a certain weapon
    @param {string} weaponClass
    @param {string} scriptId
    @void
  ]]
  function COFHUD:AddCustomWeaponAmmoDisplay(weaponClass, scriptId)
    self.CustomWeaponAmmoDisplay[weaponClass] = scriptId;
  end

  --[[
    Returns whether a weapon has a custom ammo display script linked to it
    @param {string} weaponClass
    @return {boolean} weaponHasScript
  ]]
  function COFHUD:WeaponHasCustomScript(weaponClass)
    return self.CustomWeaponAmmoDisplay[weaponClass] != nil;
  end

  --[[
    Returns the unique weapon display script attached to a weapon
    @param {string} weaponClass
    @return {function} func
  ]]
  function COFHUD:GetWeaponCustomScript(weaponClass)
    return self.CustomWeaponAmmoDisplay[weaponClass];
  end

  --[[
    Gets the height that the clip texture will require based on ammo type and
    amount of bullets.
    @param {string} ammoType
    @param {number} amount
    @return {number} height
  ]]
  function COFHUD:GetClipHeight(ammoType, amount)
    return self:GetBulletIcon(ammoType).h * amount;
  end

  --[[
    Returns the clip size of a weapon
    @param {Weapon} weapon
    @return {number} clipSize
  ]]
  function COFHUD:GetClipSize(weapon)
    if (DEFAULT_CLIP_SIZES[weapon:GetClass()]) then
      return DEFAULT_CLIP_SIZES[weapon:GetClass()];
    else
      if (weapon.Primary) then
        return weapon.Primary.ClipSize;
      else
        return 0;
      end
    end
  end

  --[[
    Draws a bullet stream based on the ammo type and amount of bullets
    @param {number} ammoType
    @param {number} amount
    @param {number} x
    @param {number} y
  ]]
  function COFHUD:DrawBulletStream(x, y, amount, ammoType)
    ammoType = ammoType or "";
    amount = amount or 0;

    for i=1, amount do
      local icon = self:GetBulletIcon(ammoType);
      self:DrawBulletIcon(ammoType, x, y - (icon.h * i));
    end
  end

end
