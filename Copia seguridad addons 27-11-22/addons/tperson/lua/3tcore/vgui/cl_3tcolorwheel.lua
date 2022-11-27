-- credits : https://github.com/Nogitsu/GNLib

local PANEL = {}

AccessorFunc( PANEL, "color", "Color" )

local ColorWheel = Material( "tperson/colorwheel.png" )

function PANEL:Init()

    self.Knob:NoClipping( false )
    self.Knob.Paint = function(_, w, h )
        TPerson.draw_Circle( w / 2, h / 2, w * 0.4, 100, TPerson['Color']['items']['background'] )
    end

    self:SetLockX()
    self:SetLockY()
end

function PANEL:Paint( w, h )
    surface.SetDrawColor( color_white )
    surface.SetMaterial( ColorWheel )
    surface.DrawTexturedRect( 0, 0, w, h )
end

function PANEL:GetPosColor( x, y )
    local x, y = x * ColorWheel:Width(), y * ColorWheel:Height()

    local clr = ColorWheel:GetColor( x, y ) 

    return Color( clr.r, clr.g, clr.b )
end

function PANEL:OnColorChanged( clr )
    --  > Overwrite
end

function PANEL:TranslateValues( x, y )
    local clr = self:GetPosColor( x, y )

    self:SetColor( clr )
    self:OnColorChanged( clr )

    return math.min( x, self:GetWide() ), math.min( y, self:GetTall() ) 
end

vgui.Register( "3T:ColorWheel", PANEL, "DSlider" )