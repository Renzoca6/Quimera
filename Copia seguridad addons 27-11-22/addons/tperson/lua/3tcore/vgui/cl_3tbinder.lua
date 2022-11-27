local PANEL = {}

AccessorFunc( PANEL, "m_iSelectedNumber", "SelectedNumber" )

Derma_Install_Convar_Functions( PANEL )

function PANEL:Init()

    self:SetSelectedNumber( 0 )

	-- UI
    self:SetText('')
    self.Font = 'Trebuchet24' 

end

function PANEL:SetFont( font )
    self.Font = font
end

function PANEL:PerformLayout()
	self:UpdateFont()
end

function PANEL:UpdateFont()

    self.Font = 'comfortaa33'
    surface.SetFont(self.Font)

    if ( surface.GetTextSize( self.Text ) > self:GetWide() ) then
        self.Font = 'comfortaa27'
        surface.SetFont( self.Font )

        if ( surface.GetTextSize( self.Text ) > self:GetWide() ) then
            self.Font = 'comfortaa20'
        end

    end

end

function PANEL:UpdateText()

	local str = input.GetKeyName( self:GetSelectedNumber() )
	if ( !str ) then str = "NONE" end

	str = language.GetPhrase( str )

    self.Text = str
    
    self:UpdateFont()

end

function PANEL:DoClick()

	self.Text = 'PRESS A KEY'
	input.StartKeyTrapping()
	self.Trapping = true

end

function PANEL:DoRightClick()

	self.Text = 'NONE'
	self:SetValue( 0 )

end

function PANEL:SetSelectedNumber( iNum )

	self.m_iSelectedNumber = iNum
	self:ConVarChanged( iNum )
    self:UpdateText()
	self:OnChange( iNum )

end

function PANEL:Think()

	if ( input.IsKeyTrapping() && self.Trapping ) then

		local code = input.CheckKeyTrapping()
		if ( code ) then

			if ( code == KEY_ESCAPE ) then

				self:SetValue( self:GetSelectedNumber() )

			else

				self:SetValue( code )

			end

			self.Trapping = false

		end

	end

	self:ConVarNumberThink()

end

function PANEL:SetValue( iNumValue )

	self:SetSelectedNumber( iNumValue )

end

function PANEL:GetValue()

	return self:GetSelectedNumber()

end

function PANEL:OnChange()
end

function PANEL:Paint( w , h )
    draw.RoundedBox( 8, 0, 0, w, h, TPerson['Color']['items']['background'] )
    draw.SimpleText( self.Text, self.Font, w / 2, h / 2, TPerson['Color']['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end


vgui.Register( "3T:Binder", PANEL, "DButton" )