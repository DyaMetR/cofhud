--[[
  CONFIGURATION MENU
]]

if CLIENT then


  --[[
    Menu options
  ]]
  local function menuComposition( panel )
  	panel:ClearControls();

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.enabled",
  		Command = "cofhud_enabled",
  		}
  	);

    panel:AddControl( "Button", {
  		Label = "#cofhud.toolmenu.reset",
  		Command = "cofhud_reset",
  		}
  	);

    -- Composition
    panel:AddControl( "Label" , { Text = ""} );
    panel:AddControl( "Label" , { Text = "#cofhud.toolmenu.features"} );

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.health",
  		Command = "cofhud_health_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.armor",
  		Command = "cofhud_armor_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.armor_icon",
  		Command = "cofhud_armor_icon",
  		}
  	);

    panel:ControlHelp( "#cofhud.toolmenu.feature.armor_icon.help" );

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.health_stack",
  		Command = "cofhud_health_mode",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.suitpower",
  		Command = "cofhud_aux_enabled",
  		}
   	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.ammo",
  		Command = "cofhud_ammo_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.ammo_clips",
  		Command = "cofhud_ammo_reserve",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.ammo_stack",
  		Command = "cofhud_ammo_clip",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.damage",
  		Command = "cofhud_damage_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.death",
  		Command = "cofhud_death_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.death_cam",
  		Command = "cofhud_death_camera_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.death_simple",
  		Command = "cofhud_death_menu_simple",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.notifications",
  		Command = "cofhud_notification_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.pickup",
  		Command = "cofhud_pickup_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "#cofhud.toolmenu.feature.intro",
  		Command = "cofhud_intro_enabled",
  		}
  	);

    panel:AddControl( "Button", {
  		Label = "#cofhud.toolmenu.feature.intro_reset",
  		Command = "cofhud_intro_reset",
  		}
  	);

    -- Positioning
    panel:AddControl( "Label" , { Text = ""} );
    panel:AddControl( "Label" , { Text = "#cofhud.toolmenu.pos"} );
    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.health.x",
      Type = "Integer",
      Min = -ScrW(),
      Max = ScrW(),
      Command = "cofhud_health_offset_x"}
    );

    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.health.y",
      Type = "Integer",
      Min = -ScrH(),
      Max = ScrH(),
      Command = "cofhud_health_offset_y"}
    );

    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.armor.x",
      Type = "Integer",
      Min = -ScrW(),
      Max = ScrW(),
      Command = "cofhud_armor_offset_x"}
    );

    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.armor.y",
      Type = "Integer",
      Min = -ScrH(),
      Max = ScrH(),
      Command = "cofhud_armor_offset_y"}
    );

    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.suitpower.x",
      Type = "Integer",
      Min = -ScrW(),
      Max = ScrW(),
      Command = "cofhud_aux_offset_x"}
    );

    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.suitpower.y",
      Type = "Integer",
      Min = -ScrH(),
      Max = ScrH(),
      Command = "cofhud_aux_offset_y"}
    );

    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.ammo.x",
      Type = "Integer",
      Min = -ScrW(),
      Max = ScrW(),
      Command = "cofhud_ammo_offset_x"}
    );

    panel:AddControl( "Slider", {
      Label = "#cofhud.toolmenu.pos.ammo.y",
      Type = "Integer",
      Min = -ScrH(),
      Max = ScrH(),
      Command = "cofhud_ammo_offset_y"}
    );

    -- Credits
    panel:AddControl( "Label",  { Text = ""});
    panel:AddControl( "Label",  { Text = string.format(language.GetPhrase("cofhud.toolmenu.version"), COFHUD.Version)});
    panel:AddControl( "Label",  { Text = ""});
  	panel:AddControl( "Label",  { Text = "#cofhud.toolmenu.credits.code"});
    panel:AddControl( "Label",  { Text = "#cofhud.toolmenu.credits.gamedev"});
    panel:AddControl( "Label",  { Text = ""});
  end

  local function menuCreation()
  	spawnmenu.AddToolMenuOption( "Utilities", "Cry of Fear HUD", "COFHUD", "#spawnmenu.utilities.settings", "", "", menuComposition );
  end
hook.Add( "PopulateToolMenu", "cofhud_menu", menuCreation );

end
