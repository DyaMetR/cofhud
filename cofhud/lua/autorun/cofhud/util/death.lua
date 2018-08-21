--[[
  DEATH SCREEN DRAWING
]]

if CLIENT then

  -- Parameters
  local DEATH_TIME = 2.4;
  local TITLE_W, TITLE_H = 457, 295;
  local BUTTON_W, BUTTON_H = 300, 50;
  local TITLE_TEXTURE = Material("cofhud/game_over/game_over.png");
  local RESTART_OUT = Material("cofhud/game_over/game_over_restart.png");
  local RESTART_IN = Material("cofhud/game_over/game_over_restart2.png");
  local EXIT_OUT = Material("cofhud/game_over/game_over_exit.png");
  local EXIT_IN = Material("cofhud/game_over/game_over_exit2.png");

  -- Variables
  local deathTime = 0;
  local think = 0;
  local bgThink = 0;
  local title = 0;
  local buttons = 0;
  local background = 0;
  local panel;
  local song;

  local function createButton(parent, x, y, inTexture, outTexture, func)
    local button = vgui.Create("DButton", parent);
    button:SetText("");
    button:SetSize(BUTTON_W, BUTTON_H);
    button:SetPos((parent:GetWide()/2) - (button:GetWide()/2) + x, (parent:GetTall()/2) - (button:GetTall()/2) + y);
    button.Paint = function()
      if (button:IsHovered()) then
        surface.SetMaterial(inTexture);
      else
        surface.SetMaterial(outTexture);
      end
      surface.SetDrawColor(Color(255, 255, 255, 255 * buttons));
      surface.DrawTexturedRect(0, 0, button:GetWide(), button:GetTall());
    end
    button.DoClick = func;
    return button;
  end

  local function generateGameOverScreen()
    if (panel != nil) then return end;
    panel = vgui.Create("DFrame");
    panel:MakePopup();
    panel:SetTitle("");
    panel:ShowCloseButton(false);
    panel:SetPos(0, 0);
    panel:SetSize(ScrW(), ScrH());
    panel.Paint = function()
      surface.SetMaterial(TITLE_TEXTURE);
      surface.SetDrawColor(Color(255, 255, 255, 255 * title));
      surface.DrawTexturedRect((ScrW()/2) - (TITLE_W/2), (ScrH()/2) - (TITLE_H/2.7), TITLE_W, TITLE_H);
    end
    createButton(panel, 0, TITLE_H/3, RESTART_IN, RESTART_OUT, function()
      -- Close the screen
      panel:Close();
      panel = nil;
      -- Make the player respawn
      RunConsoleCommand("+attack");
      timer.Simple(0.1, function()
        RunConsoleCommand("-attack");
      end);
    end);
    createButton(panel, 0, (TITLE_H/3) + BUTTON_H * 1.25, EXIT_IN, EXIT_OUT, function()
      RunConsoleCommand("disconnect");
    end);
  end

  local function doAnimation()
    if (song == nil) then
      song = CreateSound(LocalPlayer(), "cofhud/game_over.mp3");
    end

    if (LocalPlayer():Alive()) then
      -- Reset timers and effects
      deathTime = CurTime() + DEATH_TIME;
      title = 0;
      buttons = 0;
      background = 0;

      -- Remove main panel
      if (panel != nil) then
        panel:Remove();
        panel = nil;
      end

      -- Stop song
      if (song:IsPlaying()) then
        song:Stop();
      end
    else
      if (deathTime < CurTime()) then
        generateGameOverScreen();
        if (not song:IsPlaying()) then
          song:Play();
        end
        if (think < CurTime()) then
          if (title < 1) then title = title + 0.02; end
          if (buttons < 1 and title >= 0.5) then buttons = buttons + 0.03; end
          think = CurTime() + 0.01;
        end
      end

      if (bgThink < CurTime() and background < 1) then
        background = background + 0.01;
        bgThink = CurTime() + 0.028;
      end
    end
  end

  --[[
    Draws the game over screen
    @void
  ]]
  function COFHUD:DrawGameOverScreen()
    if (not self:IsEnabled() or not self:IsDeathScreenEnabled() or LocalPlayer():Team() == TEAM_SPECTATOR) then return end;
    doAnimation();
    draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(130, 0, 0, 166 * background));
  end

end
