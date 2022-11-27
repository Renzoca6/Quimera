timer.Simple(1, function()

    hook.Add( "OnPlayerChat", "TPerson-ChatCommand", TPerson.OnPlayerChat )

    hook.Add( "PlayerButtonDown", "TPerson-BindPress", TPerson.OnPlayerButtonDown )

    hook.Add( "HUDShouldDraw", "TPerson-DisableCrossHair", TPerson.HUDShouldDraw )

    hook.Add( "HUDPaint", "TPerson-HUD", TPerson.DrawCrossHair )

    hook.Add( "CalcView", "TPerson-CalcView", TPerson.CalcView )

    gameevent.Listen( "player_spawn" )

    hook.Add( "player_spawn", "TPerson-OnPlayerSpawn", TPerson.OnPlayerSpawn )

    if ( TPerson.UseContextMenu ) then
        hook.Add( "OnContextMenuClose", "TPerson-OnContextMenuClose", TPerson.OnContextMenuClose )
    end

end )