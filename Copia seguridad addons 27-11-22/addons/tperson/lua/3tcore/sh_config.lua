-- How to configure crosshairs ?
-- Go to tperson/lua/3tcore/data/cl_crosshair.lua

-- How to configure hitmarkers ?
-- Go to tperson/lua/3tcore/data/cl_hitmarker.lua

-- Print on player chat some information
TPerson.PrintText = false

-- Command to open the settings menu
TPerson.SettingsCommand = "!configurar"

-- Command to reset the settings
TPerson.ResetCommand = "!third reset"

-- Your server name
TPerson.ServerName = '[Noire Network]'

-- Active or not the context menu for this script
TPerson.UseContextMenu = true

-- Force player to download resources when connecting to server
TPerson.ForceDownload = true

-- When the player use the setting : auto disable 3rd person near of entity
-- The entity need to be on TPerson.EntityDistance to work ?
TPerson.OnlyRegistedEntity = false

-- Distance use for the setting 'near of entity'
TPerson.BaseDistance = 9000

-- When the player use the setting : auto disable 3rd person near of entity
-- [ class of entity ] = multiplicator of distance
TPerson.EntityDistance = {
      ['player'] = 2
}

-- Force to disable third person when player is holding this weapon
-- [ class of weapon ] = true
TPerson.DisableOnHolding = {
      ['gmod_camera'] = true
}

-- Default player settings
-- (Only used when player spawn for the first time on any server who have this addon and when player reset his settings )
TPerson.DefaultSettings = {
      ['key']           = 97, -- Default binding key to enable / disable third person
      ['allow'] = {
            ['third']       = true, -- Allow player to use third person
            ['hitmarker']   = true, -- Allow player to use hitmarker

            ['crosshair1p'] = false, -- Allow crosshair on first person
            ['crosshair3p'] = false, -- Allow crosshair on third person

            ['cOnAiming']   = false, -- Allow crosshair on aiming
            ['tOnAiming']   = false, -- Allow third person on aiming

            ['tNearEntity'] = false, -- Allow third person near of entities
            ['cNearEntity'] = false, -- Allow crosshair near of entities

            ['tOnSpawn']    = false,  -- Enable third person on player spawn / respawn

            ['tOnVehicle'] = true, -- Allow player to use third person on vehicle
      },
      ['view'] = {
            ['right']       = 23,  -- Camera right / left pos
            ['up']          = 4.5, -- Camero UP pos
            ['forward']     = -55, -- Camera forward pos
            ['sFov']        = 1, -- Scale for FOV
      },
      ['crosshair'] = {
            ['style']       = 1, -- Crosshair style
            ['sSpace']      = 1, -- Scale for space
            ['sWidth']      = 1, -- Scale for width
            ['sHeight']     = 1, -- Scale for height
            ['color']       = {  -- Color in rgba format
                  ['r']          = 0,
                  ['g']          = 255,
                  ['b']          = 0,
                  ['a']          = 255,
            },
      },
      ['hitmarker'] = {
            ['style']       = 1, -- Hitmarker style
            ['sSpace']      = 1, -- Scale for space
            ['sWidth']      = 1, -- Scale for width
            ['sHeight']     = 1, -- Scale for height
            ['color']       = { -- Color in rgba format
                  ['r']          = 0,
                  ['g']          = 255,
                  ['b']          = 0,
                  ['a']          = 255,
            },
      },
}

-- Theme color for the design
TPerson.Color = {
      ['menu'] = {
            ['header']     = Color( 32, 32, 32 ),
            ['background'] = Color( 43, 43, 43),
            ['category']   = Color(123, 123, 123)
      },
      ['items'] = {
            ['background'] =  Color(83, 83, 83),
            ['text']       = Color(255, 255, 255),
            ['selector']   = Color(0, 255, 0),
            ['false']      = Color(231, 76, 60),
            ['true']       = Color( 46, 204, 113 ),
            ['import']     = Color(142, 68, 173),
            ['export']     = Color(230, 126, 34)
      }
}