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

function PANEL:OnSwitchedTo()

  LocalPlayer():ConCommand("my_command")


  F4Menu.Frame:Hide()
end

vgui.Register("F4Menu.Command.MyCommand", PANEL, "Panel")
