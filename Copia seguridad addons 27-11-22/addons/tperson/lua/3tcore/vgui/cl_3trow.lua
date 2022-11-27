local PANEL = {}

function PANEL:Init()

	self:SetText( "" ) 

	-- UI
    self.Title = 'My Row'
    self.Font = 'Trebuchet24'
    self.Color = TPerson['Color']['items']['text']
    self.Description = ''
    self.titleWidth = 0

    self.Info = vgui.Create('DButton', self )
    self.Info:SetSize( 0, 0 )
    self.Info:SetPos( 0, 0 )
    self.Info:SetText( '' )

    self.Info.Paint = function(_, w, h )
        draw.SimpleText('?', 'comfortaa15', w / 2 - 3, h / 2, Color( 255, 255, 255), nil, TEXT_ALIGN_CENTER )
    end

    self.Info.OnCursorEntered = function()
        local body = vgui.Create( 'DPanel' )
    
        local x, y = self:LocalToScreen( self.Info:GetPos() )

        surface.SetFont('comfortaa15')
        local wT, hT = surface.GetTextSize( self.Description )
        local margin = 5
        local wide = 300
        local tall = ( hT + margin * 2 ) * ( ( wT / wide > 1 && wT / wide || 1 ) )

        body:SetSize( wide + margin * 2, tall )
        body:SetPos( x + self.Info:GetWide(), y + self.Info:GetTall() )
        body:MakePopup()

        local desc = vgui.Create('DLabel', body )
        desc:SetSize( wide, tall )
        desc:SetPos( margin, 0 )
        desc:SetText( self.Description )
        desc:SetFont( 'comfortaa15' )
        desc:SetWrap( true )
        
        body.Paint = function(_, w, h )
            draw.RoundedBox(6, 0, 0, w, h, Color(32, 32, 32) )
        end

        self.Info.Menu = body
    end

     self.Info.OnCursorExited = function()
        if ( IsValid( self.Info.Menu ) ) then
            self.Info.Menu:Remove()
        end
    end

    self.Info:SetVisible( false )

    self.OnRemove = function()
        if ( IsValid( self.Info.Menu ) ) then
            self.Info.Menu:Remove()
        end
    end
    
end

function PANEL:SetTitle( title )
    if ( !title || !isstring( title ) ) then return end
    self.Title = title

    surface.SetFont( self.Font )
    self.titleWidth = surface.GetTextSize(self.Title)

    self.Info:SetPos( self.titleWidth, 0 )

end

function PANEL:SetTitleColor( color )
    if ( !color || !IsColor( color ) ) then return end
    self.Color = color
end

function PANEL:SetFont( font )
    if ( !font || !isstring( font ) ) then return end
    self.Font = font

    surface.SetFont( self.Font )
    self.titleWidth = surface.GetTextSize(self.Title)

    self.Info:SetPos( self.titleWidth, self:GetTall() * 0.125 )
end

function PANEL:SetDescription( sText )
    if ( !sText || !isstring( sText ) ) then return end

    self.Description = sText

    self.Info:SetVisible( self.Description != '' )
end

function PANEL:Paint(w, h)
    draw.SimpleText( self.Title, self.Font, 0, h / 2, self.Color, nil, TEXT_ALIGN_CENTER )
end

function PANEL:PerformLayout(w, h)
    self.Info:SetSize( h * 0.5, h * 0.5 )
end


vgui.Register( "3T:Row", PANEL, "DPanel" )