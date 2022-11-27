--[[
Generated using LAUX.
Author: Patrick Ratzow (sleeppyy)

Compile ID: 76561198921758138

This is not the source code, this is a LAUX -> Lua transpiled version.

Licensed to 76561198930750195
Under no circumstances are you allowed to share this script.
Doing so will get you banned from GmodStore.
]]

F4Menu = F4Menu or {}
F4Menu.PlayersMoney = F4Menu.PlayersMoney or 0
F4Menu.EconomySnapshot = F4Menu.EconomySnapshot or {}

local function Load()
  XeninUI.Loader():setName("Xenin F4 Menu"):setAcronym("F4Menu"):setDirectory("xenin_f4"):setColor(XeninUI.Theme.Purple):loadFile("core/config_wrapper", XENINUI_SHARED):load("configuration", XENINUI_SHARED):loadFile("core/validation", XENINUI_SERVER):loadFile("core/levels", XENINUI_SHARED):loadFile("core/item_limit", XENINUI_SHARED):load("core", XENINUI_CLIENT):load("levels", XENINUI_SHARED):loadFile("data/network_client", XENINUI_CLIENT):load("data", XENINUI_SERVER):load("ui", XENINUI_CLIENT, true):done()

  F4Menu.FinishedLoading = true

  hook.Run("F4Menu.Loaded")
end

if XeninUI then
  Load()
else
  hook.Add("XeninUI.Loaded", "F4Menu", function()
    Load()
  end)
end

if SERVER then

  resource.AddWorkshop("1900562881")

  resource.AddWorkshop("1956177393")
end
