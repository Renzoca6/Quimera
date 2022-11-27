local PANEL = {}

function PANEL:Init()
    self:GetVBar():SetWide( 0 )

    self.Layout = vgui.Create('DIconLayout', self )
    self.Layout:Dock( FILL )
    self.Layout:SetSpaceY( 5 )
    self.Layout:SetSpaceX( 5 )

    self.Choice = nil

    self.CrossHairColor = TPerson['Color']['items']['selector']

end

function PANEL:Add()
    local btn = self.Layout:Add( 'DCheckBox' )

    return btn
end

function PANEL:SetCrossHairColor( color )
    if ( !color || !IsColor( color ) ) then return end
    self.CrossHairColor = color
end

vgui.Register( "3T:Selector", PANEL, "DScrollPanel" )