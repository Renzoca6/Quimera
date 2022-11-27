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

function PANEL:Init()
  self:SetName("ammo")
  self:Cache()
end

function PANEL:Cache()
  self.Lookup = {}
  for i, v in pairs(CustomShipments) do
    if (!istable(v)) then continue end
    if v.separate then continue end

    self.Lookup[v.name] = table.Copy(v)
    self.Lookup[v.name].keywords = (self.Lookup[v.name].keywords or ""):lower():Trim()
  end
end

vgui.Register("F4Menu.Items.Ammo", PANEL, "F4Menu.Items.Base")
