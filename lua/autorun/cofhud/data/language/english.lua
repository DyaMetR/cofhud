--[[
  DEFAULT LANGUAGE

  You can use this language as a template. But do not erase it please!

  Create your new language with:
  COFHUD:AddLanguage(id, name, strings, ammo);

  Both 'strings' and 'ammo' are optional fields, which are tables.

  Now if you've got no strings you can start with:
  COFHUD:AddString(language, id, string, order);
    > language: The language id
    > id: Id of the string
    > string: The text itself
    > order: A table to change the order parameters are used when formatting
    the texts. Right now by default the orders are:
      - Ammo: Ammo name, amount

  If you want to create your own strings for an ammo type, first you need
  to create the string itself, then link it to any ammo type you want with:
  COFHUD:AddAmmoType(language, ammoType, id);
    > language: The language id
    > ammoType: The ammo type name
    > id: The string id to link

  Moreover, if you like to add more strings as an add-on, you can do it too!

  Have fun!
]]

if CLIENT then

  -- Parameters
  local LANGUAGE = "en";
  local SINGLE = "ammo_pickup_single";
  local BOX = "ammo_pickup_box";
  local BOLTS = "ammo_pickup_bolts";
  local SLAM = "ammo_pickup_slam";

  -- Create language
  COFHUD:AddLanguage(LANGUAGE, "English");

  -- Generic pickup
  COFHUD:AddString(LANGUAGE, "ammo_pickup", "Picked up a %s magazine with %s rounds");
  COFHUD:AddString(LANGUAGE, "weapon_pickup", "You got the %s");

  -- Items
  COFHUD:AddString(LANGUAGE, "item_healthkit", "Picked up a health kit");
  COFHUD:AddString(LANGUAGE, "item_healthvial", "Picked up a health vial");
  COFHUD:AddString(LANGUAGE, "item_battery", "Picked up a suit battery");

  -- Ammo pickups
  COFHUD:AddString(LANGUAGE, SINGLE, "Picked up %s %s", {2, 1});
  COFHUD:AddString(LANGUAGE, BOX, "Picked up a box of %s with %s rounds");
  COFHUD:AddString(LANGUAGE, BOLTS, "Picked up a package of %s with %s rounds");
  COFHUD:AddString(LANGUAGE, SLAM, "Picked up %s %s rounds", {2, 1});

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
