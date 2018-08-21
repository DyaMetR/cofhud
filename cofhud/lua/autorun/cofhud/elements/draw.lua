--[[
  DRAW HUD ELEMENTS
]]

if CLIENT then

  --[[
    HUDPaint hook
  ]]
  hook.Add("HUDPaint", "cofhud_draw", function()
    if (not COFHUD:IsEnabled() or (IsValid(LocalPlayer():GetActiveWeapon()) and LocalPlayer():GetActiveWeapon():GetClass() == "gmod_camera")) then return end;
    COFHUD:DrawMapIntroSequence();
    COFHUD:DrawDamageEffect();
    COFHUD:DrawAmmoDisplay();
    COFHUD:DrawStatusDisplay();
    COFHUD:DrawGameOverScreen();
    COFHUD:DrawDialog();
    COFHUD:DrawNotification();
  end);

end
