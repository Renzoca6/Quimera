timer.Simple(1, function()

    hook.Add( "PlayerSwitchWeapon", "TPerson-OnPlayerSwitchWeapons", TPerson.OnPlayerSwitchWeapons )

end )