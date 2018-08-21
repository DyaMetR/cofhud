--[[
  AMMUNITION ICONS

  There are basically two icons required to draw a full ammo indicator, which
  are the bullets filling the clip, and below the clip another icon (which by
  default will be the ammo pickups) that can be a secondary representation
  of the ammunition used.

  Alternatively, if you want to give your SWEP a unique indicator, you can
  code it and add it to the script database with:

    COFHUD:AddCustomWeaponAmmoDisplay

  And then you can queue it to render when the weapon is selected by using:

    COFHUD:AddCustomAmmoScript
]]

if CLIENT then
  -- Parameters
  local DEFAULT_ICON = "Pistol";

  -- Icons database
  COFHUD.AmmoIcons = {}; -- Ammunition type display
  COFHUD.BulletIcons = {}; -- Current clip display

  --[[
    Adds a new ammunition type icon, accepts a texture and a material
    @param {string} ammoType
    @param {IMaterial|number} texture
    @param {number} w
    @param {number} h
    @param {boolean|null} isMaterial
    @void
  ]]
  function COFHUD:AddAmmoIcon(ammoType, texture, w, h, isMaterial)
    self.AmmoIcons[ammoType] = {texture = texture, w = w, h = h, isMaterial = isMaterial or false};
  end

  --[[
    Returns whether an ammunition icon exists
    @param {string} ammoType
    @return {boolean} hasAmmo
  ]]
  function COFHUD:HasAmmoIcon(ammoType)
    return self.AmmoIcons[ammoType] != nil;
  end

  --[[
    Returns icon data of an ammunition type
    @param {string} ammoType
    @return {table} iconData
  ]]
  function COFHUD:GetAmmoIcon(ammoType)
    if (not self:HasAmmoIcon(ammoType)) then ammoType = DEFAULT_ICON end;
    return self.AmmoIcons[ammoType];
  end

  --[[
    If icon exists, will draw it on the given position
    @param {string} ammoType
    @param {number} x
    @param {number} y
    @void
  ]]
  function COFHUD:DrawAmmoIcon(ammoType, x, y, centered)
    centered = centered or false;
    if (!self:HasAmmoIcon(ammoType)) then ammoType = DEFAULT_ICON end;
    local icon = self:GetAmmoIcon(ammoType);

    surface.SetDrawColor(Color(255, 255, 255)); -- Default colour

    -- Set texture
    if (icon.isMaterial) then
      surface.SetMaterial(icon.texture);
    else
      surface.SetTexture(icon.texture);
    end

    -- Draw element
    if (centered) then
      surface.DrawTexturedRect(x + (self.BAR_WIDTH/2) - (icon.w/2), y, icon.w, icon.h);
    else
      surface.DrawTexturedRect(x, y, icon.w, icon.h);
    end
  end

  --[[
    Adds a new bullet icon for clip display, accepts a texture and a material
    @param {IMaterial|number} ammoType
    @param {string} texture
    @param {number} w
    @param {number} h
    @param {boolean|null} isMaterial
    @void
  ]]
  function COFHUD:AddBulletIcon(ammoType, texture, w, h, isMaterial)
    self.BulletIcons[ammoType] = {texture = texture, w = w, h = h, isMaterial = isMaterial or false};
  end

  --[[
    Returns whether the given ammo type has a bullet icon
    @param {string} ammoType
    @return {boolean} hasBulletIcon
  ]]
  function COFHUD:HasBulletIcon(ammoType)
    return self.BulletIcons[ammoType] != nil;
  end

  --[[
    Returns bullet icon data of an ammunition type
    @param {string} ammoType
    @return {table} iconData
  ]]
  function COFHUD:GetBulletIcon(ammoType)
    if (not self:HasBulletIcon(ammoType)) then ammoType = DEFAULT_ICON end;
    return self.BulletIcons[ammoType];
  end

  --[[
    If icon exists, will draw it on the given position
    @param {string} ammoType
    @param {number} x
    @param {number} y
    @void
  ]]
  function COFHUD:DrawBulletIcon(ammoType, x, y)
    local icon = self:GetBulletIcon(ammoType);

    -- Set texture
    if (icon.isMaterial) then
      surface.SetMaterial(icon.texture);
    else
      surface.SetTexture(icon.texture);
    end

    -- Draw element
    surface.SetDrawColor(Color(255, 255, 255)); -- Default colour
    surface.DrawTexturedRect(x, y, icon.w, icon.h);
  end

end
