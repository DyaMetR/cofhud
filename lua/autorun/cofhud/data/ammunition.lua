--[[
  AMMUNITION ICONS DATA
]]

if CLIENT then

  --[[
    HL2 default ammunition
  ]]
  -- Pistol
  COFHUD:AddBulletIcon("Pistol", Material("cofhud/ammo/pistol_b.png", "noclamp"), 11, 5, true);
  COFHUD:AddAmmoIcon("Pistol", Material("cofhud/ammo/pistol_c.png", "noclamp"), 32, 32, true);

  -- 357
  COFHUD:AddBulletIcon("357", Material("cofhud/ammo/357_b.png", "noclamp"), 11, 6, true);
  COFHUD:AddAmmoIcon("357", Material("cofhud/ammo/357_c.png", "noclamp"), 32, 32, true);
  COFHUD:AddAmmoPickupString("357", "ammo_pickup_box");

  -- SMG1
  COFHUD:AddBulletIcon("SMG1", Material("cofhud/ammo/smg_b.png", "noclamp"), 11, 3, true);
  COFHUD:AddAmmoIcon("SMG1", Material("cofhud/ammo/smg_c.png", "noclamp"), 32, 32, true);
  COFHUD:AddAmmoPickupString("SMG1_Grenade", "ammo_pickup_single");

  -- AR2
  COFHUD:AddBulletIcon("AR2", Material("cofhud/ammo/ar_b.png", "noclamp"), 11, 4, true);
  COFHUD:AddAmmoIcon("AR2", Material("cofhud/ammo/ar_c.png", "noclamp"), 32, 32, true);
  COFHUD:AddAmmoPickupString("AR2AltFire", "ammo_pickup_single");

  -- Shotgun
  COFHUD:AddBulletIcon("Buckshot", Material("cofhud/ammo/shotgun_b.png", "noclamp"), 11, 6, true);
  COFHUD:AddAmmoIcon("Buckshot", Material("cofhud/ammo/shotgun_c.png", "noclamp"), 32, 32, true);
  COFHUD:AddAmmoPickupString("Buckshot", "ammo_pickup_box");

  -- Crossbow
  COFHUD:AddBulletIcon("XBowBolt", Material("cofhud/ammo/xbow_b.png", "noclamp"), 11, 65, true);
  COFHUD:AddAmmoIcon("XBowBolt", Material("cofhud/ammo/xbow_c.png", "noclamp"), 32, 32, true);
  COFHUD:AddAmmoPickupString("XBowBolt", "ammo_pickup_bolts");

  -- Frag
  COFHUD:AddBulletIcon("Grenade", Material("cofhud/ammo/frag_b.png", "noclamp"), 11, 28, true);
  COFHUD:AddAmmoIcon("Grenade", Material("cofhud/ammo/frag_c.png", "noclamp"), 32, 32, true);
  COFHUD:AddAmmoPickupString("Grenade", "ammo_pickup_single");

  -- RPG
  COFHUD:AddBulletIcon("RPG_Round", Material("cofhud/ammo/rpg_b.png", "noclamp"), 11, 93, true);
  COFHUD:AddAmmoIcon("RPG_Round", Material("cofhud/ammo/rpg_c.png", "noclamp"), 32, 32, true);
  COFHUD:AddAmmoPickupString("RPG_Round", "ammo_pickup_single");

  -- SLAM
  COFHUD:AddAmmoPickupString("slam", "ammo_pickup_slam");

end
