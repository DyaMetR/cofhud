--[[
  MAP INTRODUCTION
]]

if CLIENT then

  surface.CreateFont( "cofhud_intro", {
  	font = "Arial",
  	size = 40,
  	weight = 900,
  	antialias = true,
  });

  -- Parameters
  local BAR_SIZE_H = 48;
  local TIME = 4;

  -- Variables
  local blackBars = 1;
  local underline = 0;
  local alpha = 0;
  local shown = false;
  local background = 1.2;
  local think = 0;
  local time = 0;

  local function doAnimation()
    if (think < CurTime()) then
      if (background > 0) then
        background = background - 0.01;
      end
      if (blackBars > 0 and background < 0.5) then
        blackBars = blackBars - 0.02;
      end
      if (blackBars < 1 and not shown and alpha < 1) then
        alpha = alpha + 0.02;
        underline = math.Clamp(alpha * 1.25, 0, 1);
      elseif (alpha >= 1 and not shown) then
        time = CurTime() + TIME;
        shown = true;
      elseif (shown and alpha > 0 and time < CurTime()) then
        alpha = alpha - 0.02;
      end
      think = CurTime() + 0.02;
    end
  end

  --[[
    Draws the map introduction sequence
    @void
  ]]
  function COFHUD:DrawMapIntroSequence()
    if (not COFHUD:IsMapIntroEnabled() or (alpha <= 0 and shown)) then return end;
    doAnimation();

    -- Get values
    surface.SetFont("cofhud_intro");
    local size = surface.GetTextSize(self:GetMapName());
    local underlineAlpha = 1;
    if (shown) then
      underlineAlpha = alpha;
    end

    -- Draw
    self:DrawBlackBars(BAR_SIZE_H * blackBars);
    draw.SimpleText(self:GetMapName(), "cofhud_intro", ScrW()/2, ScrH()/2, Color(255, 255, 255, 255 * alpha), 1, 1);
    draw.RoundedBox(0, (ScrW()/2) - (size/2), (ScrH()/2) + 17, size * underline, 3, Color(255, 255, 255, 255 * underlineAlpha));
    draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(0, 0, 0, 255 * background));
  end

  --[[
    Resets the map intro sequence
    @void
  ]]
  function COFHUD:ResetIntroSequence()
    background = 1.2;
    blackBars = 1;
    underline = 0;
    alpha = 0;
    shown = false;
  end

end
