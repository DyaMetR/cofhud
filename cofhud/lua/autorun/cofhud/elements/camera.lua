--[[
  CAMERA POSITIONING UPON DYING
]]

if CLIENT then

  -- Parameters
  local roll = 90;

  -- Variables
  local cameraPos = Vector(0, 0, 0);
  local cameraAngle = Angle(0, 0, 0);
  local alive = true;
  local rotation = 0;

  -- Calculate camera position and angles
  hook.Add("Think", "cofhud_death_think", function()
    if not (COFHUD:IsDeathScreenEnabled() and COFHUD:IsEnabled()) then return end;
    if not LocalPlayer():Alive() then
      local tr = util.TraceLine( {
        start = LocalPlayer():GetPos(),
        endpos = LocalPlayer():GetPos() - Vector(0,0,5)
      } );

      if not tr.Hit or alive then
        cameraPos = LocalPlayer():GetPos() + Vector(0,0,5);
      end

      alive = false;

      if (rotation ~= 1) then
        rotation = 1;
      end

      if LocalPlayer():GetRagdollEntity() ~= nil and IsValid(LocalPlayer():GetRagdollEntity()) and LocalPlayer():GetRagdollEntity().SetNoDraw != nil then
        LocalPlayer():GetRagdollEntity():SetNoDraw(true);
      end
    else
      if not alive then
        rotation = 0;
        alive = true;
      else
        cameraAngle = LocalPlayer():EyeAngles();
      end
    end
  end);

  -- Apply camera position and angle changes
  hook.Add("CalcView", "cofhud_death_camera", function(ply, origin, angles, fov, znear, zfar)
    if LocalPlayer():Alive() or not (COFHUD:IsDeathScreenEnabled() and COFHUD:IsEnabled()) then return end;
    local view = {};

    view.origin = cameraPos;
    view.angles = Angle(0, cameraAngle.y, angles.r + roll * rotation);
    view.fov = fov;

    return view;
  end);

end
