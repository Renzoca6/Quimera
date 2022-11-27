util.AddNetworkString('TPerson:ToServer')
util.AddNetworkString('TPerson:ToClient')

-- In futur i will add function
local UIntToFunc = {
    [1] = function( ply ) 
            ply.TSettings = net.ReadTable()
        end,

}

net.Receive('TPerson:ToServer', function( len, ply )

    UIntToFunc[ net.ReadUInt( 3 ) ]( ply )

end )

timer.Simple(2, function()
    -- DarkRP Enable the basic crosshair on spawn
    if ( DarkRP ) then
        hook.Add('PlayerSpawn', 'DisableBaseCrosshair',  function( ply )
            ply:CrosshairDisable()
        end )   
    end

    function GAMEMODE:VehicleMove( ply, vehicle, mv )
        --
        -- On duck toggle third person view
        --
        if ( mv:KeyPressed( IN_DUCK ) && vehicle.SetThirdPersonMode && ply.TSettings['allow']['tOnVehicle'] ) then
            vehicle:SetThirdPersonMode( !vehicle:GetThirdPersonMode() )
        end

        --
        -- Adjust the camera distance with the mouse wheel
        --
        local iWheel = ply:GetCurrentCommand():GetMouseWheel()
        if ( iWheel != 0 && vehicle.SetCameraDistance ) then
            -- The distance is a multiplier
            -- Actual camera distance = ( renderradius + renderradius * dist )
            -- so -1 will be zero.. clamp it there.
            local newdist = math.Clamp( vehicle:GetCameraDistance() - iWheel * 0.03 * ( 1.1 + vehicle:GetCameraDistance() ), -1, 2 )
            vehicle:SetCameraDistance( newdist )
        end

    end
end )

hook.Add('EntityTakeDamage', 'TPerson:HitMarkers', function( tr, info )
    if ( !tr:IsPlayer() ) && ( !tr:IsNPC() ) then return end

    local ply = info:GetAttacker()
    if ( !ply:IsPlayer() ) then return end

    net.Start('TPerson:ToClient')
    net.Send( ply )
end )

hook.Add( 'PlayerEnteredVehicle', 'TPerson:PlayerEnteredVehicle', function( ply, vehicle )
    if ( !ply.TSettings ) then return end

    vehicle:SetThirdPersonMode( ply.TSettings['allow']['tOnVehicle'] )
    ply:CrosshairDisable()
    
end )

hook.Add( 'PlayerLeaveVehicle', 'TPerson:PlayerEnteredVehicle', function( ply, vehicle )
    if ( !ply.TSettings ) then return end

    ply:CrosshairDisable()
end )

hook.Add( 'PlayerButtonDown', 'TPerson:PlayerButtonDown', function( ply, key )
    if ( !ply:InVehicle() ) then return end
    if ( !ply.TSettings ) then return end

    local vehicle = ply:GetVehicle()

    if ( key == ply.TSettings['key'] && vehicle.SetThirdPersonMode && ply.TSettings['allow']['tOnVehicle'] ) then
        vehicle:SetThirdPersonMode( !vehicle:GetThirdPersonMode() )
    end
end )
