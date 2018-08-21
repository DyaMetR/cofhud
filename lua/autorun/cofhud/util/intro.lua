--[[
  MAP INTRODUCTION
]]

if CLIENT then

  local gamemodeName = nil;

  -- Get gamemode name
  local function getGamemodeName()
    if (gamemodeName != nil) then return gamemodeName end;
    gamemodeName = engine.ActiveGamemode();
    for k, v in pairs(engine.GetGamemodes()) do
      if (v.name == engine.ActiveGamemode()) then
        gamemodeName = v.title;
      end
    end
  end

  -- Initialize gamemode name
  timer.Simple(0.1, function()
    getGamemodeName();
  end);

  --[[
    Returns a map name sanitized
    @return {string} mapName
  ]]
  function COFHUD:GetMapName()
    local mapName = game.GetMap();
    local gamemode = getGamemodeName();
    local startPos, endPos = string.find(mapName, "_");
    local nameOnly = string.Replace(string.sub(mapName, endPos+1), "_", " ");
    local upped = string.upper(string.sub(nameOnly, 1, 1))..string.sub(nameOnly, 2);
    return gamemode.." - "..upped;
  end

  --[[
    Draw black bars on the top and bottom of the screen
    @param {number} h
    @void
  ]]
  function COFHUD:DrawBlackBars(h)
    draw.RoundedBox(0, 0, 0, ScrW(), h, Color(0, 0, 0));
    draw.RoundedBox(0, 0, ScrH() - h, ScrW(), h, Color(0, 0, 0));
  end

end
