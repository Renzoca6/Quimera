local crosshair = {}

function TPerson.GetCrossHairs()
    return table.Copy( crosshair )
end

function TPerson.GetChrossHair()
    return crosshair[TPerson.GetConfig()['crosshair']['style']]
end

function TPerson.RegisterCrossHair( newCrosshair )
    crosshair[ #crosshair + 1 ] = newCrosshair
end

TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        surface.SetDrawColor( color )

        surface.DrawRect( x - ( scaleSpace * 2 ), y - ( scaleSpace * 2 ), scaleWidth * 4, scaleHeight * 4 )

    end
})

TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        surface.SetDrawColor( color )

        local space = scaleSpace * 1
        w = scaleWidth * 5
        h = scaleHeight * 2

        -- LEFT
        surface.DrawRect( x - ( space + w ), y - h / 2, w, h )

        -- RIGHT
        surface.DrawRect( x + space , y - h / 2, w, h )

        -- TOP
        surface.DrawRect( x - h / 2, y - ( space + w ), h, w )

        -- BOT
        surface.DrawRect( x - h / 2, y + space, h, w )
    end
})

TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        surface.SetDrawColor( color )
        
        local space = scaleSpace * 5
        w = scaleWidth * 5
        h = scaleHeight * 2

        -- LEFT
        surface.DrawRect( x - ( space + w ), y - h / 2, w, h )

        -- RIGHT
        surface.DrawRect( x + space , y - h / 2, w, h )

        -- TOP
        surface.DrawRect( x - h / 2, y - ( space + w ), h, w )

        -- BOT
        surface.DrawRect( x - h / 2, y + space, h, w )
    end
})

TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        surface.SetDrawColor( color )

        local space = scaleSpace * 5
        w = scaleWidth * 5
        h = scaleHeight * 2

        -- LEFT
        surface.DrawRect( x - ( space + w ), y - h / 2, w, h )

        -- RIGHT
        surface.DrawRect( x + space , y - h / 2, w, h )

        -- TOP
        surface.DrawRect( x - h / 2, y - ( space + w ), h, w )

        -- BOT
        surface.DrawRect( x - h / 2, y + space, h, w )

        -- MID
        surface.DrawRect( x - h / 2, y - h / 2, h, h ) 
    end
})

TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        surface.SetDrawColor( color )

        w, h = scaleWidth * 20, scaleHeight * 1

        -- HORI
        surface.DrawRect( x - ( w / 2 ) , y - ( h / 2 ), w, h ) 

        -- VERTI
        surface.DrawRect( x - ( h / 2 ), y - ( w / 2 ), h, w )
    end
})

--  By Nogitsu : 
-- https://github.com/Nogitsu
-- https://steamcommunity.com/id/nogitsu
TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        surface.DrawCircle( x, y, scaleWidth * 1, color )
        surface.DrawCircle( x, y, scaleWidth * 10, color )
        surface.DrawCircle( x, y, scaleWidth * 11, color )
    end,
    ['whitelist'] = {
        ['vip'] = true
    }
})

--  By Nogitsu : 
-- https://github.com/Nogitsu
-- https://steamcommunity.com/id/nogitsu
local arrow = Material( "gui/point.png" )
TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        local size = scaleWidth * 10
        local space = scaleSpace * 5

        surface.SetDrawColor( color )
        surface.SetMaterial( arrow )

        surface.DrawTexturedRect( x - size / 2, y - space - size, size, size / 2 )
        surface.DrawTexturedRectRotated( x, y + space + size * 0.75, size, size / 2, 180 )
        surface.DrawTexturedRectRotated( x - space - size * 0.75, y, size, size / 2, 90 )
        surface.DrawTexturedRectRotated( x + space + size * 0.75, y, size, size / 2, -90 )
    end,
    ['whitelist'] = {
        ['vip'] = true
    }
})

--  By Nogitsu : 
-- https://github.com/Nogitsu
-- https://steamcommunity.com/id/nogitsu
TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        local size = scaleWidth * 10
        local space = scaleSpace * 5

        surface.SetDrawColor( color )
        surface.SetMaterial( arrow )

        surface.DrawCircle( x, y, 1, color ) -- Center

        surface.DrawTexturedRect( x - size / 2, y - space - size, size, size / 2 )
        surface.DrawTexturedRectRotated( x, y + space + size * 0.75, size, size / 2, 180 )
        surface.DrawTexturedRectRotated( x - space - size * 0.75, y, size, size / 2, 90 )
        surface.DrawTexturedRectRotated( x + space + size * 0.75, y, size, size / 2, -90 )
    end,
    ['whitelist'] = {
        ['vip'] = true
    }
})

-- Guess who's the creator
-- ... 
-- N O G I T S U 
TPerson.RegisterCrossHair( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth )
        local size = scaleWidth * 10
        local space = scaleSpace * 5

        surface.SetDrawColor( color )
        surface.SetMaterial( arrow )

        surface.DrawCircle( x, y, 1, color ) -- Center
        surface.DrawCircle( x, y, size + space, color ) -- Outer

        surface.DrawTexturedRect( x - size / 2, y - space - size, size, size / 2 )
        surface.DrawTexturedRectRotated( x, y + space + size * 0.75, size, size / 2, 180 )
        surface.DrawTexturedRectRotated( x - space - size * 0.75, y, size, size / 2, 90 )
        surface.DrawTexturedRectRotated( x + space + size * 0.75, y, size, size / 2, -90 )
    end,
    ['whitelist'] = {
        ['vip'] = true
    }
})
