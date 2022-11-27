--[[
Generated using LAUX.
Author: Patrick Ratzow (sleeppyy)

Compile ID: 76561198921758138

This is not the source code, this is a LAUX -> Lua transpiled version.

Licensed to 76561198930750195
Under no circumstances are you allowed to share this script.
Doing so will get you banned from GmodStore.
]]

local PANEL = {}

function PANEL:OnSwitchedTo(tbl)
  if (!self.Set) then
    self.Set = true

    self:OpenURL(tbl.url)
  end
end

function PANEL:Paint(w, h)
  XeninUI:DrawLoadingCircle(w / 2, h / 2, 128, XeninUI.Theme.Green)
end

vgui.Register("F4Menu.Website", PANEL, "DHTML")
