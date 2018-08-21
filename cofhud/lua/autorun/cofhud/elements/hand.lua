--[[
  DRAW HAND UPON DYING
]]

if CLIENT then

  -- Variables
  local model;
  local pos = Vector(0, 0, 0);

  local function generateModel()
    if (model == nil) then
      model = ClientsideModel("models/weapons/v_grenade.mdl", RENDERGROUP_VIEWMODEL);
    end
  end

  -- Draw hand
  --[[hook.Add("PostDrawOpaqueRenderables", "cofhud_death_hand", function(viewModel, player, weapon)
    local ang = LocalPlayer():EyeAngles();
    generateModel();
    model:SetPos(pos);
    model:SetAngles(Angle(0, ang.y, ang.r));
    model:ManipulateBonePosition(0, Vector(23, 20, 20));
    model:ManipulateBoneAngles( 2 , Angle(0, -60, -80) );
  --  model:ManipulateBoneScale(0, Vector(0, 0, 0));
  end);

  hook.Add("CalcView", "cofhud_death_hand_pos", function(ply, origin, angles, fov, znear, zfar)
    pos = origin;
  end);]]

end
