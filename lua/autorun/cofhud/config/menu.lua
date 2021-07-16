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
  		Label = "Enabled",
  		Command = "cofhud_enabled",
  		}
  	);

    panel:AddControl( "Button", {
  		Label = "Reset settings to default",
  		Command = "cofhud_reset",
  		}
  	);

    -- Localization
    local combobox, label = panel:ComboBox("Language", "cofhud_language");
      for id, language in pairs(COFHUD:GetLanguages()) do
    		combobox:AddChoice(language.name, id);
      end

    -- Composition
    panel:AddControl( "Label" , { Text = ""} );
    panel:AddControl( "Label" , { Text = "Composition"} );

    panel:AddControl( "CheckBox", {
  		Label = "Health panel enabled",
  		Command = "cofhud_health_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Armor panel enabled",
  		Command = "cofhud_armor_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Use unofficial icon for armor",
  		Command = "cofhud_armor_icon",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Stack health and armor bars",
  		Command = "cofhud_health_mode",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Ammo panel enabled",
  		Command = "cofhud_ammo_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Show reserve ammo in clip count",
  		Command = "cofhud_ammo_reserve",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Divide clip indicator on oversize",
  		Command = "cofhud_ammo_clip",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Enable damage overlay",
  		Command = "cofhud_damage_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Enable death screen",
  		Command = "cofhud_death_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Enable first person death camera",
  		Command = "cofhud_death_camera_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Simplify death menu",
  		Command = "cofhud_death_menu_simple",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Enable notifications",
  		Command = "cofhud_notification_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Enable item pickup dialog",
  		Command = "cofhud_pickup_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Enable map intro",
  		Command = "cofhud_intro_enabled",
  		}
  	);

    panel:AddControl( "Button", {
  		Label = "Reset map intro",
  		Command = "cofhud_intro_reset",
  		}
  	);

    -- Positioning
    panel:AddControl( "Label" , { Text = ""} );
    panel:AddControl( "Label" , { Text = "Positioning"} );
    panel:AddControl( "Slider", {
      Label = "Health panel X offset",
      Type = "Integer",
      Min = -ScrW(),
      Max = ScrW(),
      Command = "cofhud_health_offset_x"}
    );

    panel:AddControl( "Slider", {
      Label = "Health panel Y offset",
      Type = "Integer",
      Min = -ScrH(),
      Max = ScrH(),
      Command = "cofhud_health_offset_y"}
    );

    panel:AddControl( "Slider", {
      Label = "Armor panel X offset",
      Type = "Integer",
      Min = -ScrW(),
      Max = ScrW(),
      Command = "cofhud_armor_offset_x"}
    );

    panel:AddControl( "Slider", {
      Label = "Armor panel Y offset",
      Type = "Integer",
      Min = -ScrH(),
      Max = ScrH(),
      Command = "cofhud_armor_offset_y"}
    );

    panel:AddControl( "Slider", {
      Label = "Ammo panel X offset",
      Type = "Integer",
      Min = -ScrW(),
      Max = ScrW(),
      Command = "cofhud_ammo_offset_x"}
    );

    panel:AddControl( "Slider", {
      Label = "Ammo panel Y offset",
      Type = "Integer",
      Min = -ScrH(),
      Max = ScrH(),
      Command = "cofhud_ammo_offset_y"}
    );

    -- Credits
    panel:AddControl( "Label",  { Text = ""});
    panel:AddControl( "Label",  { Text = "Version 1.3.1"});
    panel:AddControl( "Label",  { Text = ""});
  	panel:AddControl( "Label",  { Text = "Credits"});
    panel:AddControl( "Label",  { Text = "Main script: DyaMetR"});
    panel:AddControl( "Label",  { Text = "Textures from: Team Psykskallar"});
    panel:AddControl( "Label",  { Text = ""});
  end

  local function menuCreation()
  	spawnmenu.AddToolMenuOption( "Options", "DyaMetR", "COFHUD", "Cry of Fear HUD", "", "", menuComposition );
  end
hook.Add( "PopulateToolMenu", "cofhud_menu", menuCreation );

end
