--[[
  MAIN CONFIGURATION FILE
]]

if CLIENT then

  COFHUD.Configuration = {};

  -- Default configuration
  COFHUD.Configuration.Default = {
    ["cofhud_enabled"] = 1,
    ["cofhud_health_enabled"] = 1,
    ["cofhud_health_offset_x"] = 0,
    ["cofhud_health_offset_y"] = 0,
    ["cofhud_armor_enabled"] = 1,
    ["cofhud_armor_icon"] = 0,
    ["cofhud_armor_offset_x"] = 0,
    ["cofhud_armor_offset_y"] = 0,
    ["cofhud_health_mode"] = 1,
    ["cofhud_ammo_enabled"] = 1,
    ["cofhud_ammo_offset_x"] = 0,
    ["cofhud_ammo_offset_y"] = 0,
    ["cofhud_ammo_reserve"] = 1,
    ["cofhud_ammo_clip"] = 0,
    ["cofhud_damage_enabled"] = 1,
    ["cofhud_death_enabled"] = 1,
    ["cofhud_death_camera_enabled"] = 1,
    ["cofhud_intro_enabled"] = 1,
    ["cofhud_pickup_enabled"] = 1,
    ["cofhud_notification_enabled"] = 1,
    ["cofhud_language"] = "en"
  };

  -- Configuration
  COFHUD.Configuration.Values = {};

  for name, value in pairs(COFHUD.Configuration.Default) do
    COFHUD.Configuration.Values[name] = CreateClientConVar(name, value);
  end

  --[[
    Returns whether the HUD is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsEnabled()
    return self.Configuration.Values["cofhud_enabled"]:GetInt() > 0;
  end

  --[[
    Returns whether the health panel is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsHealthEnabled()
    return self.Configuration.Values["cofhud_health_enabled"]:GetInt() > 0;
  end

  --[[
    Returns the health panel x offset
    @return {number} x
  ]]
  function COFHUD:GetHealthOffsetX()
    return self.Configuration.Values["cofhud_health_offset_x"]:GetInt();
  end

  --[[
    Returns the health panel y offset
    @return {number} y
  ]]
  function COFHUD:GetHealthOffsetY()
    return self.Configuration.Values["cofhud_health_offset_y"]:GetInt();
  end

  --[[
    Returns whether the armor panel is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsArmorEnabled()
    return self.Configuration.Values["cofhud_armor_enabled"]:GetInt() > 0;
  end

  --[[
    Returns whether the armor icon is the default in CoF
    @return {boolean} enabled
  ]]
  function COFHUD:IsArmorIconDefault()
    return self.Configuration.Values["cofhud_armor_icon"]:GetInt() <= 0;
  end

  --[[
    Returns the armor panel x offset
    @return {number} x
  ]]
  function COFHUD:GetArmorOffsetX()
    return self.Configuration.Values["cofhud_armor_offset_x"]:GetInt();
  end

  --[[
    Returns the armor panel y offset
    @return {number} y
  ]]
  function COFHUD:GetArmorOffsetY()
    return self.Configuration.Values["cofhud_armor_offset_y"]:GetInt();
  end

  --[[
    Returns whether the health and armor panels are in multiple bars
    @return {boolean} enabled
  ]]
  function COFHUD:IsHealthArmorStacked()
    return self.Configuration.Values["cofhud_health_mode"]:GetInt() > 0;
  end

  --[[
    Returns whether the ammo panel is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsAmmoEnabled()
    return self.Configuration.Values["cofhud_ammo_enabled"]:GetInt() > 0;
  end

  --[[
    Returns the ammo panel x offset
    @return {number} x
  ]]
  function COFHUD:GetAmmoOffsetX()
    return self.Configuration.Values["cofhud_ammo_offset_x"]:GetInt();
  end

  --[[
    Returns the ammo panel y offset
    @return {number} y
  ]]
  function COFHUD:GetAmmoOffsetY()
    return self.Configuration.Values["cofhud_ammo_offset_y"]:GetInt();
  end

  --[[
    Returns whether the reserve ammo is represented in clips rather than raw ammo
    @return {boolean} enabled
  ]]
  function COFHUD:IsAmmoInClips()
    return self.Configuration.Values["cofhud_ammo_reserve"]:GetInt() > 0;
  end

  --[[
    Returns whether the ammo is divided horizontally
    @return {boolean} enabled
  ]]
  function COFHUD:IsAmmoFractional()
    return self.Configuration.Values["cofhud_ammo_clip"]:GetInt() > 0;
  end

  --[[
    Returns whether the damage effect is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsDamageEffectEnabled()
    return self.Configuration.Values["cofhud_damage_enabled"]:GetInt() > 0;
  end

  --[[
    Returns whether the death screen is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsDeathScreenEnabled()
    return self.Configuration.Values["cofhud_death_enabled"]:GetInt() > 0;
  end

  --[[
    Returns whether the death camera is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsDeathCameraEnabled()
    return self.Configuration.Values["cofhud_death_camera_enabled"]:GetInt() > 0;
  end

  --[[
    Returns whether the map name intro is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsMapIntroEnabled()
    return self.Configuration.Values["cofhud_intro_enabled"]:GetInt() > 0;
  end

  --[[
    Returns whether the item pickup override is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsItemPickupEnabled()
    return self.Configuration.Values["cofhud_pickup_enabled"]:GetInt() > 0;
  end

  --[[
    Returns whether the notification override is enabled
    @return {boolean} enabled
  ]]
  function COFHUD:IsNotificationEnabled()
    return self.Configuration.Values["cofhud_notification_enabled"]:GetInt() > 0;
  end

  --[[
    Returns the currently selected language id
    @return {string} language
  ]]
  function COFHUD:CurrentLanguage()
    return self.Configuration.Values["cofhud_language"]:GetString();
  end

  --[[
    Reset the configuration to default
    @void
  ]]
  function COFHUD:ResetConfig()
    for name, value in pairs(self.Configuration.Default) do
      RunConsoleCommand(name, value);
    end
  end

  --[[
    Reset console command
  ]]
  concommand.Add("cofhud_reset", function(ply, com, args)
    COFHUD:ResetConfig();
  end);

  concommand.Add("cofhud_intro_reset", function(ply, com, args)
    COFHUD:ResetIntroSequence();
  end);

end
