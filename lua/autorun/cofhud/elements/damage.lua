--[[
  DAMAGE
]]

if CLIENT then

  -- Parameters
  local DAMAGE_TIME = 0;

  -- Variables
  local tick = 0;
  local damage = 0;
  local lastHp = 100;

  local function doAnimation()
    local hp = LocalPlayer():Health();

    if (hp != lastHp) then
      if (hp < lastHp) then
        damage = 1;
      end
      lastHp = hp;
    end

    if (tick < CurTime() and damage > 0) then
      damage = damage - 0.03;
      tick = CurTime() + 0.01;
    end
  end

  --[[
    Draws the damage effect
    @void
  ]]
  function COFHUD:DrawDamageEffect()
    if (not self:IsDamageEffectEnabled()) then damage = 0; return end;
    doAnimation();
    local alpha = math.Clamp(255 * damage, 0, 255);
    draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(100, 0, 0, alpha * 0.33));
    surface.SetTexture(surface.GetTextureID("cofhud/misc/damaged_vision"));
    surface.SetDrawColor(Color(255, 255, 255, alpha));
    surface.DrawTexturedRect(0, 0, ScrW(), ScrH());
  end

  hook.Add("RenderScreenspaceEffects", "cofhud_damage_blur", function()
    DrawMotionBlur( 0.3, 0.8 * damage, 0.02 );
  end);

end
