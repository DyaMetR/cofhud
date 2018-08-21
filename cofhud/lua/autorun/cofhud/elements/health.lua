--[[
  HEALTH AND ARMOR INDICATORS
]]

if CLIENT then

  -- Parameters
  local DEFAULT_ICON_WIDTH, DEFAULT_ICON_HEIGHT = 32, 32;
  local X_OFFSET, Y_OFFSET, MARGIN_HORIZONTAL = 38, 1, 14;
  local X_NUMBER, Y_NUMBER = 10, 15;

  -- Textures
  local BG_HEALTH = Material("cofhud/bar/bg_health.png");
  local FG_HEALTH = Material("cofhud/bar/fg_health.png");
  local ICON_HEALTH = Material("cofhud/misc/health_icon.png");

  local FG_SCARE = Material("cofhud/bar/fg_scare.png");
  local ICON_SCARE = Material("cofhud/misc/scare_icon.png");
  local ICON_SHIELD = Material("cofhud/misc/shield_icon.png");

  --[[
    Draws a bar with an icon below it
    @param {number} x
    @param {number} y
    @param {number} value
    @param {Material|number|nil} filler
    @param {Material|number|nil} background
    @param {Material|number|nil} icon
    @param {boolean} isMaterial
    @param {number|nil} max
    @param {number|nil} w
    @param {number|nil} h
    @void
  ]]
  function COFHUD:DrawIconBar(x, y, value, filler, background, icon, isMaterial, max, w, h)
    w = w or DEFAULT_ICON_WIDTH;
    h = h or DEFAULT_ICON_HEIGHT;
    isMaterial = isMaterial or true;
    max = max or 1;
    COFHUD:DrawBar(x, y, value, filler, background);
    if (icon != nil) then
      if (isMaterial) then
        surface.SetMaterial(icon);
      else
        surface.SetTexture(icon);
      end
      surface.SetDrawColor(Color(255, 255, 255));
      surface.DrawTexturedRect(x + (self.BAR_WIDTH/2) - (w/2), y + self.BAR_HEIGHT, w, h);
    end
  end

  --[[
    Draws the health bar
    @param {number} x
    @param {number} y
    @void
  ]]
  function COFHUD:DrawHealth(x, y)
    if (not self:IsHealthEnabled()) then return; end
    local hp = LocalPlayer():Health()/100;
    local max = LocalPlayer():GetMaxHealth()/100;
    self:DrawIconBar(x, y - (self.BAR_HEIGHT + DEFAULT_ICON_HEIGHT), hp, FG_HEALTH, BG_HEALTH, ICON_HEALTH, nil, max);
    if (self:IsHealthArmorStacked()) then
      for i=1, math.ceil(hp)-1 do
        self:DrawBar(x + self.BAR_WIDTH * i, y - (self.BAR_HEIGHT + DEFAULT_ICON_HEIGHT), hp-i, FG_HEALTH, BG_HEALTH);
      end
    else
      if (hp > 1) then
        draw.SimpleTextOutlined("x"..math.ceil(hp), "default", x + X_NUMBER, y - Y_NUMBER, Color(255, 255, 255), 0, 0, 1, Color(0, 0, 0));
      end
    end
  end

  --[[
    Draws the armor bar
    @param {number} x
    @param {number} y
    @void
  ]]
  function COFHUD:DrawArmor(x, y)
    if (not self:IsArmorEnabled()) then return; end
    local icon = ICON_SCARE;
    local hp = math.Clamp(math.ceil(LocalPlayer():Health()/100) - 1, 0, LocalPlayer():Health()/100);
    local ap = LocalPlayer():Armor()/100;
    local offset = 0;
    if (self:IsHealthArmorStacked()) then offset = (self.BAR_WIDTH * hp) end;
    -- Draw main bar
    if (not self:IsArmorIconDefault()) then icon = ICON_SHIELD; end;
    self:DrawIconBar(x + offset, y - (self.BAR_HEIGHT + DEFAULT_ICON_HEIGHT), ap, FG_SCARE, nil, icon);

    -- Draw extra bars
    if (self:IsHealthArmorStacked()) then
      for i=1, math.ceil(ap)-1 do
        self:DrawBar(x + (self.BAR_WIDTH * hp) + self.BAR_WIDTH * i, y - (self.BAR_HEIGHT + DEFAULT_ICON_HEIGHT), ap-i, FG_SCARE, nil);
      end
    else
      if (ap > 1) then
        draw.SimpleTextOutlined("x"..math.ceil(ap), "default", x + X_NUMBER, y - Y_NUMBER, Color(255, 255, 255), 0, 0, 1, Color(0, 0, 0));
      end
    end
  end

  --[[
    Draws both health and armor bars
    @void
  ]]
  function COFHUD:DrawStatusDisplay()
    self:DrawHealth(X_OFFSET + self:GetHealthOffsetX(), ScrH() - Y_OFFSET - self:GetHealthOffsetY());
    self:DrawArmor(X_OFFSET  + self:GetArmorOffsetX() + self.BAR_WIDTH + MARGIN_HORIZONTAL, ScrH() - Y_OFFSET - self:GetArmorOffsetY());
  end

end
