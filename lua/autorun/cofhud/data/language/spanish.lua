if CLIENT then

  -- Parameters
  local LANGUAGE = "es";
  local SINGLE = "ammo_pickup_single";
  local BOX = "ammo_pickup_box";
  local BOLTS = "ammo_pickup_bolts";
  local SLAM = "ammo_pickup_slam";

  -- Create language
  COFHUD:AddLanguage(LANGUAGE, "Español");

  -- Generic pickup
  COFHUD:AddString(LANGUAGE, "ammo_pickup", "Recogido cargador de %s con %s cartuchos");
  COFHUD:AddString(LANGUAGE, "weapon_pickup", "Has obtenido %s");

  -- Items
  COFHUD:AddString(LANGUAGE, "item_healthkit", "Recogido botiquín");
  COFHUD:AddString(LANGUAGE, "item_healthvial", "Recogido vial médico");
  COFHUD:AddString(LANGUAGE, "item_battery", "Recogida batería para el traje");

  -- Ammo pickups
  COFHUD:AddString(LANGUAGE, SINGLE, "Recogido %s %s", {2, 1});
  COFHUD:AddString(LANGUAGE, BOX, "Recogida caja de %s con %s cartuchos");
  COFHUD:AddString(LANGUAGE, BOLTS, "Recogido paquete de %s con %s varillas");
  COFHUD:AddString(LANGUAGE, SLAM, "Recogidas %s cargas de %s", {2, 1});

  -- Ammo types
  COFHUD:AddAmmoType(LANGUAGE, "SMG1_Grenade", SINGLE);
  COFHUD:AddAmmoType(LANGUAGE, "AR2AltFire", SINGLE);
  COFHUD:AddAmmoType(LANGUAGE, "Grenade", SINGLE);
  COFHUD:AddAmmoType(LANGUAGE, "RPG_Round", SINGLE);
  COFHUD:AddAmmoType(LANGUAGE, "Buckshot", BOX);
  COFHUD:AddAmmoType(LANGUAGE, "XBowBolt", BOLTS);
  COFHUD:AddAmmoType(LANGUAGE, "357", BOX);
  COFHUD:AddAmmoType(LANGUAGE, "slam", SLAM);

end
