--[[
  NUMBERS
]]

if CLIENT then

  -- Global parameters
  COFHUD.NUMBER_WIDTH = 20;
  COFHUD.NUMBER_HEIGHT = 24;

  -- Parameters
  local CROSS_WIDTH, CROSS_HEIGHT = 16, 16;
  local CROSS = Material("cofhud/misc/cross.png");
  local FILE_WIDTH, FILE_HEIGHT = 256, 128;
  local NUMBERS_TEXTURE = surface.GetTextureID("cofhud/misc/numbers");
  local NUMBERS = {
    ["0"] = {x = 0, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["1"] = {x = 24, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["2"] = {x = 48, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["3"] = {x = 72, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["4"] = {x = 96, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["5"] = {x = 120, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["6"] = {x = 144, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["7"] = {x = 168, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["8"] = {x = 192, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT},
    ["9"] = {x = 216, y = 0, w = COFHUD.NUMBER_WIDTH, h = COFHUD.NUMBER_HEIGHT}
  }; -- I know this looks incredibly dumb but I made it in case you wanted to put your own textures

  --[[
    Draws a number
    @param {number} x
    @param {number} y
    @param {number} value
    @param {boolean} cross
  ]]
  function COFHUD:DrawNumber(x, y, value, cross)
    value = tostring(value);
    cross = cross or false;

    -- Set color as default
    surface.SetDrawColor(Color(255, 255, 255));

    -- Draw cross if enabled
    if (cross) then
      surface.SetMaterial(CROSS);
      surface.DrawTexturedRect(x, y, CROSS_WIDTH, CROSS_HEIGHT);
      x = x + CROSS_WIDTH;
    end;

    -- Draw the actual number
    surface.SetTexture(NUMBERS_TEXTURE);
    local nums = string.ToTable(value);
    local i = #nums;
    local offset = 2;

    -- Move number offset if count is higher than 2
    if (table.Count(nums) > 2) then
      offset = table.Count(nums);
    end

      while (i>0) do
        local k = (#nums - i)+1;
        local num = nums[i];
        if (NUMBERS[num]) then
          surface.DrawTexturedRectUV(x + (self.NUMBER_WIDTH * offset) - (NUMBERS[num].w*k), y - (CROSS_HEIGHT/2), self.NUMBER_WIDTH, self.NUMBER_HEIGHT,
                                    NUMBERS[num].x/FILE_WIDTH,
                                    NUMBERS[num].y/FILE_HEIGHT,
                                    (NUMBERS[num].x + NUMBERS[num].w)/FILE_WIDTH,
                                    (NUMBERS[num].y + NUMBERS[num].h)/FILE_HEIGHT);
        end
        i = i - 1;
      end
  end

end
