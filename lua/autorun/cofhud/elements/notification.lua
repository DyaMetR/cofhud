--[[
  GMOD NOTIFICATIONS
]]

if CLIENT then

  -- Parameters
  local BACKGROUND = Material("cofhud/misc/hint_bar.png");
  local BG_WIDTH, BG_HEIGHT = 800, 48;
  local MAX_TIME = 7;

  -- Variables
  local amount = 0;
  local time = 0;
  local tick = 0;
  local show = false;
  local list = {};

  local function doAnimation()
    if (table.Count(list) > 0) then
      if (show) then
        if (amount < 1) then
          if (tick < CurTime()) then
            amount = amount + 0.04;
            tick = CurTime() + 0.01;
          end
        else
          show = false;
          time = CurTime() + math.Clamp(list[1].time, 0, MAX_TIME);
        end
      else
        if (amount > 0 and time < CurTime()) then
          if (tick < CurTime()) then
            amount = amount - 0.04;
            tick = CurTime() + 0.01;
          end
        elseif (amount <= 0) then
          table.remove(list, 1);
          show = true;
        end
      end
    end
  end

  --[[
    Draws the notification box with the current string
    @void
  ]]
  surface.SetFont("cofhud_dialog");
  function COFHUD:DrawNotification()
    if (not COFHUD:IsEnabled() or not COFHUD:IsNotificationEnabled()) then return end;
    doAnimation();
    if (table.Count(list) > 0) then
      local width = math.Clamp((BG_WIDTH/4) + (surface.GetTextSize(list[1].string)), BG_WIDTH, ScrW());
      surface.SetDrawColor(Color(255, 255, 255));
      surface.SetMaterial(BACKGROUND);
      surface.DrawTexturedRect((ScrW()/2) - (width/2), BG_HEIGHT * (amount-1), width, BG_HEIGHT);
      draw.SimpleText(list[1].string, "cofhud_dialog", ScrW()/2, (BG_HEIGHT/2) + (BG_HEIGHT * (amount-1)), Color(255, 255, 255), 1, 1);
    end
  end

  --[[
    Adds a notification to the queue
    @param {string} string
    @void
  ]]
  function COFHUD:AddNotification(string, time)
    table.insert(list, {string = string, time = time});
    show = true;
  end

  -- Override old system
  local legacy = notification.AddLegacy;
  function notification.AddLegacy(text, icon, time)
    if (not COFHUD:IsEnabled() or not COFHUD:IsNotificationEnabled()) then legacy(text, icon, time); return end;
    COFHUD:AddNotification(language.GetPhrase(text), time);
  end

end
