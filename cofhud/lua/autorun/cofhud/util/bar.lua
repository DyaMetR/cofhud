--[[
  BARS
]]

if CLIENT then

  -- Global parameters
  COFHUD.BAR_WIDTH = 17;
  COFHUD.BAR_HEIGHT = 126;

  -- Parameters
  local LIMIT_HEIGHT = 3;

  -- Textures
  local BG_GENERIC = Material("cofhud/bar/bg_generic.png");
  local BG_TOP = Material("cofhud/bar/bg_topless.png");
  local BG_BOTTOM = Material("cofhud/bar/bg_bottomless.png");
  local BG_MIDDLE = Material("cofhud/bar/bg_open.png");

  local FG_GENERIC = Material("cofhud/bar/fg_ammo.png");
  local BG_LIMIT = Material("cofhud/bar/bg_limit.png");

  --[[
    Draws a resizable empty bar
    @param {number} x
    @param {number} y
    @param {number} h
    @param {IMaterial|number|nil} filler
    @void
  ]]
  function COFHUD:DrawResizableBar(x, y, h, filler)
    filler = filler or FG_GENERIC;

    -- All elements shown will have default colour
    surface.SetDrawColor(Color(255, 255, 255));

    -- Choose a texture based on how long is the default bar
    local texture = BG_GENERIC;
    if (h > self.BAR_HEIGHT) then
        texture = BG_TOP;
    end

    -- Draw base
    surface.SetMaterial(texture);
    surface.DrawTexturedRect(x, y, self.BAR_WIDTH, self.BAR_HEIGHT);

    -- Draw the limiter when bar is shorter than maximum
    if (h < self.BAR_HEIGHT) then
        -- Draw filler
        local fillerSize = self.BAR_HEIGHT - h;
        surface.SetMaterial(FG_GENERIC);
        surface.DrawTexturedRectUV(x, y, self.BAR_WIDTH, fillerSize - 1, 0, 0, 1, fillerSize/self.BAR_HEIGHT);

        -- Draw limiter
        surface.SetMaterial(BG_LIMIT);
        surface.DrawTexturedRect(x, y + fillerSize, self.BAR_WIDTH, LIMIT_HEIGHT);
    elseif (h > self.BAR_HEIGHT) then
        -- Draw extra bars
        local bars = math.ceil(h/self.BAR_HEIGHT);
        for i=2, bars do
            local texture = BG_MIDDLE;
            if (i == bars) then
                texture = BG_BOTTOM;
            end
            local additional = math.Clamp(h - self.BAR_HEIGHT, 0, self.BAR_HEIGHT * (i-1));
            surface.SetMaterial(texture);
            surface.DrawTexturedRect(x, y - additional, self.BAR_WIDTH, self.BAR_HEIGHT);
        end
    end
  end

  --[[
    Draws a traditional vertical bar with a foreground
    @param {number} x
    @param {number} y
    @param {number} value
    @param {IMaterial|number|nil} filler
    @param {IMaterial|number|nil} background
    @void
  ]]
  function COFHUD:DrawBar(x, y, value, filler, background)
      filler = filler or FG_GENERIC;
      background = background or BG_GENERIC;

      -- All elements shown will have default colour
      surface.SetDrawColor(Color(255, 255, 255));

      -- Draw base
      surface.SetMaterial(background);
      surface.DrawTexturedRect(x, y, self.BAR_WIDTH, self.BAR_HEIGHT);

      -- Foreground
      local height = self.BAR_HEIGHT * value;
      surface.SetMaterial(filler);
      surface.DrawTexturedRectUV(x, y + (self.BAR_HEIGHT - height), self.BAR_WIDTH, height, 0, 1 - (height/self.BAR_HEIGHT), 1, 1);
  end

end
