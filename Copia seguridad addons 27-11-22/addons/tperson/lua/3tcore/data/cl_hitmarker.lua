local hitmarkers = {}

function TPerson.GetHitMarkers()
    return table.Copy( hitmarkers )
end

function TPerson.GetHitMarker()
    return hitmarkers[TPerson.GetConfig()['hitmarker']['style']]
end

function TPerson.RegisterHitMarker( newHitMarker )
    hitmarkers[ #hitmarkers + 1 ] = newHitMarker
end

TPerson.RegisterHitMarker( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleLength, scaleWidth )
        surface.SetDrawColor( color )

        local Height = scaleLength * 10
        local Space  = scaleSpace  * 5

        surface.DrawLine( x - Height - Space, y - Height - Space, x - Space, y - Space )
        surface.DrawLine( x - Height - Space, y + Height + Space, x - Space, y + Space )
        surface.DrawLine( x + Height + Space, y - Height - Space, x + Space, y - Space )
        surface.DrawLine( x + Height + Space, y + Height + Space, x + Space, y + Space )

    end
})
          
TPerson.RegisterHitMarker( {
    ['paint'] = function( x, y, w, h, color, scaleSpace, scaleLength, scaleWidth )
        surface.SetDrawColor( color )

        local Height = scaleLength * 15

        surface.DrawLine( x - Height, y, x, y + Height )
        surface.DrawLine( x + Height, y, x, y - Height )
        surface.DrawLine( x, y + Height, x + Height, y)
        surface.DrawLine( x, y - Height, x - Height, y)
    end,
    ['whitelist'] = {
        ['vip'] = true
    }
})