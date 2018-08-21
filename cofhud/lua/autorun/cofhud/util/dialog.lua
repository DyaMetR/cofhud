--[[
  CENTER SCREEN DIALOG
]]

if CLIENT then

  surface.CreateFont( "cofhud_dialog", {
  	font = "Arial",
  	size = 22,
  	weight = 400,
  	antialias = true,
    additive = true
  });

  -- Parameters
  local BASE_TIME = 3;

  -- Variables
  local string = "";
  local show = false;
  local alpha = 0;
  local textColor = Color(255, 255, 255);
  local time = 0;
  local tick = 0;

  -- Do the fade in/fade out animation
  local function doAnimation()
    if (show) then
      if (alpha < 1) then
        if (tick < CurTime()) then
          alpha = alpha + 0.02;
          tick = CurTime() + 0.01;
        end
      else
        time = CurTime() + BASE_TIME;
        show = false;
      end
    else
      if (alpha > 0 and time < CurTime()) then
        if (tick < CurTime()) then
          alpha = alpha - 0.02;
          tick = CurTime() + 0.01;
        end
      end
    end
  end

  --[[
    Draws the pick up dialog
    @void
  ]]
  function COFHUD:DrawDialog()
    doAnimation();
    draw.SimpleText(string, "cofhud_dialog", ScrW()/2, ScrH()/1.2, Color(textColor.r, textColor.g, textColor.b, 255 * alpha), 1, 1);
  end

  --[[
    Writes a message on the screen for some time
    @param {string} message
    @param {Color} color
    @void
  ]]
  function COFHUD:SendDialog(message, color)
    alpha = 0;
    string = message;
    textColor = color;
    show = true;
  end

end
