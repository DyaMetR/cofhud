--[[
  DRAW WEAPON AMMUNITION
]]

if CLIENT then

  -- Parameters
  local X_OFFSET, Y_OFFSET = 143, 1;
  local X_MARGIN, TOP_MARGIN, BOTTOM_MARGIN = 3, 5, 2;
  local X_NUMBER_MARGIN = 10;

  --[[
    Renders an ammo clip for the given weapon
    @param {string} ammoType
    @param {number} clipSize
    @param {number} clip1
    @param {number} x
    @param {number} y
    @void
  ]]
  function COFHUD:DrawClip(ammoType, clipSize, clip1, x, y)
    y = y - (self.BAR_HEIGHT + self:GetAmmoIcon(ammoType).h);
    local bulletSize = ScrH()/self:GetBulletIcon(ammoType).h;
    if (clip1 > clipSize) then clipSize = clip1; end;
    if (clip1 > -1) then
      self:DrawResizableBar(x, y, math.Clamp(self:GetClipHeight(ammoType, clipSize) + TOP_MARGIN, 0, ScrH()));
      self:DrawBulletStream(x + X_MARGIN, y - BOTTOM_MARGIN + self.BAR_HEIGHT, math.Clamp(clip1, 0, bulletSize), ammoType);
    end
  end

  --[[
    Draws a stream of clips horizontally
    @param {string} ammoType
    @param {number} clipSize
    @param {number} clip1
    @param {number} x
    @param {number} y
    @void
  ]]
  function COFHUD:DrawHorizontalClip(ammoType, clipSize, clip1, x, y)
    y = y - (self.BAR_HEIGHT + self:GetAmmoIcon(ammoType).h);
    if (clip1 > clipSize) then clipSize = clip1 end;
    local height = self:GetClipHeight(ammoType, clipSize);
    local iconHeight = self:GetBulletIcon(ammoType).h;
    local innerSize = self.BAR_HEIGHT - TOP_MARGIN;
    local bulletsSize = height/innerSize;
    local bulletsPerClip = math.floor(innerSize/iconHeight);
    local bulletSize = bulletsPerClip * iconHeight;
    local whiteSpace = (innerSize - bulletSize) * math.ceil(bulletsSize);
    local amount = math.ceil((height + whiteSpace)/innerSize);
    local max = amount - 1;

    for i=0, math.Clamp(max, 0, ScrW()/self.BAR_WIDTH) do
      local offset = x - (self.BAR_WIDTH * max) + (self.BAR_WIDTH * (max - i));
      local clip = clip1 - (bulletsPerClip * i);
      local size = clipSize - (bulletsPerClip * i);
      -- math.Clamp(self:GetClipHeight(ammoType, size), 0, innerSize)
      local emptySpace = innerSize - math.Clamp(size * iconHeight, 0, bulletSize);
      self:DrawResizableBar(offset, y, math.Clamp((innerSize - emptySpace) + TOP_MARGIN, 0, self.BAR_HEIGHT));
      self:DrawBulletStream(offset + X_MARGIN, y - BOTTOM_MARGIN + self.BAR_HEIGHT, math.Clamp(clip, 0, bulletsPerClip), ammoType);
    end
  end

  --[[
    Draws the default full ammunition indicator display
    @param {Weapon} weapon
    @param {number} x
    @param {number} y
    @void
  ]]
  function COFHUD:DrawDefaultAmmoDisplay(weapon, x, y)
    if (!IsValid(weapon) or weapon:GetPrimaryAmmoType() <= -1 and weapon:GetSecondaryAmmoType() <= -1) then return end;
    local ammoType = game.GetAmmoName(weapon:GetPrimaryAmmoType());
    local ammo = LocalPlayer():GetAmmoCount(weapon:GetPrimaryAmmoType());
    local ammoIconHeight = self:GetAmmoIcon(weapon:GetPrimaryAmmoType()).h;
    local reserve = math.ceil(ammo/self:GetClipSize(weapon));
    local alt = weapon:GetSecondaryAmmoType();
    local secondary = LocalPlayer():GetAmmoCount(alt);
    local clip1 = weapon:Clip1();
    if (not self:IsAmmoInClips() or weapon:Clip1() <= -1) then reserve = ammo; end;
    if (alt > -1 and weapon:GetPrimaryAmmoType() <= -1) then reserve = secondary; clip1 = -1; alt = -1; end;
    if (self:IsAmmoFractional()) then
      self:DrawHorizontalClip(game.GetAmmoName(weapon:GetPrimaryAmmoType()), self:GetClipSize(weapon), clip1, x, y);
    else
      self:DrawClip(game.GetAmmoName(weapon:GetPrimaryAmmoType()), self:GetClipSize(weapon), clip1, x, y);
    end
    self:DrawAmmoIcon(ammoType, x, y - self:GetAmmoIcon(ammoType).h, true);
    self:DrawNumber(x + self.BAR_WIDTH + X_NUMBER_MARGIN, y - ammoIconHeight, reserve, true);
    if (alt > -1) then
      self:DrawNumber(x + self.BAR_WIDTH + X_NUMBER_MARGIN, y - (ammoIconHeight + self.NUMBER_HEIGHT * 1.2), secondary, true);
    end
  end

  --[[
    Draws the main ammunition component on the HUD
    @void
  ]]
  function COFHUD:DrawAmmoDisplay()
    if (not self:IsAmmoEnabled()) then return; end
    local weapon = LocalPlayer():GetActiveWeapon();
    if (!IsValid(weapon)) then return end;
    if (self:WeaponHasCustomScript(weapon:GetClass())) then
      self:GetWeaponCustomScript(weapon:GetClass())(weapon);
    else
      self:DrawDefaultAmmoDisplay(weapon, ScrW() - X_OFFSET  + self:GetAmmoOffsetX(), ScrH() - Y_OFFSET - self:GetAmmoOffsetY());
    end
  end

end
