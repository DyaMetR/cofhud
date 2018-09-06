--[[
  LANGUAGE MANAGEMENT
]]

if CLIENT then

  -- Parameters
  local DEFAULT = "en";

  -- Language database
  COFHUD.Language = {};

  --[[
    Returns the language table
    @return {table} languages
  ]]
  function COFHUD:GetLanguages()
    return self.Language;
  end

  --[[
    Adds a language
    @param {string} id
    @param {string} name
    @param {table} strings
    @void
  ]]
  function COFHUD:AddLanguage(id, name, strings, ammo)
    if (strings == nil) then strings = {} end;
    if (ammo == nil) then ammo = {} end;
    self.Language[id] = {name = name, strings = strings, ammo = ammo}
  end

  --[[
    Returns whether the specified language exists
    @param {string} id
    @param {boolean} exists
  ]]
  function COFHUD:HasLanguage(id)
    return self.Language[id] != nil;
  end

  --[[
    Returns the given language entry on the database
    @param {string} id
    @return {table} language
  ]]
  function COFHUD:GetLanguage(id)
    if (self.Language[id]) == nil then return self.Language[DEFAULT] end;
    return self.Language[id];
  end

  --[[
    Returns the name from a language
    @param {string} id
    @return {table} language
  ]]
  function COFHUD:GetLanguageName(id)
    return self:GetLanguage(id).name;
  end

  --[[
    Adds a string to a language, use last parameters to setup value order.
    @param {table} language
    @param {string} id
    @param {string} string
  ]]
  function COFHUD:AddString(language, id, string, order)
    self.Language[language].strings[id] = {string = string, order = order};
  end

  --[[
    Returns a string from an existing language
    @param {string} idLanguage
    @param {string} idString
  ]]
  function COFHUD:GetStringFromLanguage(idLanguage, idString)
    if (self.Language[idLanguage].strings[idString] == nil) then return idString; end
    return self.Language[idLanguage].strings[idString].string;
  end

  --[[
    Return whether a string exists in the default language
    @param {string} id
    @return {boolean} exists
  ]]
  function COFHUD:StringExists(id)
    return self.Language[DEFAULT].strings[id] != nil;
  end

  --[[
    Returns whether the ammo type exists in the default language
    @param {string} ammoType
    @return {boolean} exists
  ]]
  function COFHUD:HasAmmoType(ammoType)
    return self.Language[DEFAULT].ammo[ammoType] != nil;
  end

  --[[
    Returns an ammo type string
    @param {string} ammoType
    @return {string} string
  ]]
  function COFHUD:GetAmmoType(language, ammoType)
    return self.Language[language].ammo[ammoType];
  end

  --[[
    Adds an ammo type equivalence with a language string to the language
    @param {string} language
    @param {string} ammoType
    @param {string} id
    @void
  ]]
  function COFHUD:AddAmmoType(language, ammoType, id)
    self.Language[language].ammo[ammoType] = id;
  end

  --[[
    Returns the string with parameters applied
    @param {string} id
    @param {string...} ...
    @return {string} string
  ]]
  function COFHUD:GetString(id, ...)
    local language = self:CurrentLanguage();
    if (not self:HasLanguage(language)) then language = DEFAULT end;

    local string = self:GetStringFromLanguage(language, id);
    if (not self:StringExists(id)) then return id end;

    local params = {...};
    if (params == nil or table.Count(params) <= 0) then return string end;

    local order = self.Language[language].strings[id].order;
    if (order != nil) then -- If a string has a custom order for parameters, apply them
      local old = table.Copy(params); -- Get the default params
      for k, i in pairs(order) do
        params[k] = old[i];
      end
    end
    return string.format(string, unpack(params));
  end

end
