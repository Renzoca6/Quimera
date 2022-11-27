local config
local Lang = TPerson['Lang']

-- Return user config
function TPerson.GetConfig()
    return config
end

-- Save config given in parameters
function TPerson.SaveConfig( newConfig )
    if ( !newConfig || !TPerson.IsValidConfig( newConfig ) ) then return false end

    config = newConfig

    file.Write( 'third_config.json', util.TableToJSON( config ) )

    TPerson.AddText( Color(255, 255, 255), Lang['settingsSaved'] )

    net.Start('TPerson:ToServer')
        net.WriteUInt( 1, 3 )
        net.WriteTable( config )
    net.SendToServer()
end

-- Check if the config given in parameters is valid
function TPerson.IsValidConfig( config )
    if ( !config || !istable( config ) ) then return false end

    if ( !config['key']  || !isnumber( config['key'] ) ) then return false end
    if ( !config['view'] || !istable( config['view'] ) ) then return false end

    if ( !config['crosshair'] || !istable( config['crosshair'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['style'] ) ) then return false end

    local crosshairs = TPerson.GetCrossHairs()
    if ( crosshairs ) then
        local tr = crosshairs[ config['crosshair']['style'] ] 

        if ( !tr || tr['whitelist'] && !tr['whitelist'][ LocalPlayer():GetUserGroup() ] ) then return false end
    end

    if ( !config['crosshair'] || !istable( config['crosshair']['color'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['sSpace'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['sWidth'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['sHeight'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['color']['r'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['color']['g'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['color']['b'] ) ) then return false end
    if ( !config['crosshair'] || !isnumber( config['crosshair']['color']['a'] ) ) then return false end

    if ( !config['hitmarker'] || !istable( config['hitmarker'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['style'] ) ) then return false end
    
    local hitMarkers = TPerson.GetHitMarkers()
    if ( hitMarkers ) then
        local tr = hitMarkers[ config['hitmarker']['style'] ] 

        if ( !tr || tr['whitelist'] && !tr['whitelist'][ LocalPlayer():GetUserGroup() ] ) then return false end
    end

    if ( !config['hitmarker'] || !istable( config['hitmarker']['color'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['sSpace'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['sWidth'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['sHeight'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['color']['r'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['color']['g'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['color']['b'] ) ) then return false end
    if ( !config['hitmarker'] || !isnumber( config['hitmarker']['color']['a'] ) ) then return false end

    if ( !config['view']['right']   || !isnumber( config['view']['right'] ) )   then return false end
    if ( !config['view']['up']      || !isnumber( config['view']['forward'] ) ) then return false end
    if ( !config['view']['forward'] || !isnumber( config['view']['forward'] ) ) then return false end
    if ( !config['view']['sFov'] || !isnumber( config['view']['sFov'] ) ) then return false end

    if ( !config['allow'] || !istable( config['allow'] ) ) then return false end
    if (  config['allow']['third'] == nil  || !isbool( config['allow']['third'] ) )             then return false end
    if (  config['allow']['crosshair1p'] == nil  || !isbool( config['allow']['crosshair1p'] ) ) then return false end
    if (  config['allow']['crosshair3p'] == nil || !isbool( config['allow']['crosshair3p'] ) ) then return false end
    if (  config['allow']['cOnAiming'] == nil || !isbool( config['allow']['cOnAiming'] ) ) then return false end
    if (  config['allow']['tOnAiming'] == nil || !isbool( config['allow']['tOnAiming'] ) ) then return false end
    if (  config['allow']['tNearEntity'] == nil || !isbool( config['allow']['tNearEntity'] ) ) then return false end
    if (  config['allow']['cNearEntity'] == nil || !isbool( config['allow']['cNearEntity'] ) ) then return false end
    if (  config['allow']['hitmarker'] == nil || !isbool( config['allow']['hitmarker'] ) ) then return false end
    if (  config['allow']['tOnSpawn'] == nil || !isbool( config['allow']['tOnSpawn'] ) ) then return false end
    if (  config['allow']['tOnVehicle'] == nil || !isbool( config['allow']['tOnVehicle'] ) ) then return false end

    return true
end

-- Restore config to default values
function TPerson.ResetConfig()

    file.Write( 'third_config.json', util.TableToJSON( TPerson.DefaultSettings ) )

    config = TPerson.DefaultSettings
    
    config['crosshair']['color'] = Color(config['crosshair']['color']['r'], config['crosshair']['color']['g'], config['crosshair']['color']['b'], config['crosshair']['color']['a'] )
    config['hitmarker']['color'] = Color(config['hitmarker']['color']['r'], config['hitmarker']['color']['g'], config['hitmarker']['color']['b'], config['hitmarker']['color']['a'] )

    TPerson.AddText( Color(255, 255, 255), Lang['settingsReset'] )
end

local function Recursive( tbl1, tbl2 )
    local equal = true

    for _, data in pairs( tbl1 ) do
        if ( istable( data ) ) then
            equal = Recursive( data, tbl2[_] )
            if ( !equal ) then break end
        else
            if ( tbl2[_] == nil || tbl2[_] != data ) then equal = false break end
        end

    end

    return equal
end

function TPerson.EqualToActual( newConfig )
    if ( !newConfig || !istable( newConfig ) ) then return false end

    return Recursive( newConfig, config )
end

local function loadDefaultConfig()
    -- Init config
    if ( !file.Exists( 'third_config.json', 'DATA' ) ) then
        TPerson.ResetConfig()
    else
        local userC = util.JSONToTable( file.Read( 'third_config.json', 'DATA' ) )
        if TPerson.IsValidConfig( userC ) then
            config = userC
            config['crosshair']['color'] = Color(config['crosshair']['color']['r'], config['crosshair']['color']['g'], config['crosshair']['color']['b'], config['crosshair']['color']['a'] )
            config['hitmarker']['color'] = Color(config['hitmarker']['color']['r'], config['hitmarker']['color']['g'], config['hitmarker']['color']['b'], config['hitmarker']['color']['a'] )
        else
            TPerson.ResetConfig()
        end
    end

    net.Start('TPerson:ToServer')
        net.WriteUInt( 1, 3 )
        net.WriteTable( config )
    net.SendToServer()

    -- Work like player initial spawn
    TPerson.OnPlayerSpawn( { ['userid'] = LocalPlayer():UserID() } )
end

hook.Add('InitPostEntity', 'TPerson:InitSystem', loadDefaultConfig )