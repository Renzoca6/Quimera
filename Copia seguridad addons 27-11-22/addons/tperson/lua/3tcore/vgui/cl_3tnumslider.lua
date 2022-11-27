local PANEL = {}

AccessorFunc( PANEL, "m_fDefaultValue", "DefaultValue" )

function PANEL:Init()

	self.Slider = self:Add( "DSlider", self )
	self.Slider:SetLockY( 0.5 )
	self.Slider.TranslateValues = function( slider, x, y ) return self:TranslateSliderValues( x, y ) end
	self.Slider:SetTrapInside( true )
	self.Slider:Dock( FILL )
	self.Slider:SetHeight( 26 )
	self.Slider.Knob.OnMousePressed = function( panel, mcode )
		if ( mcode == MOUSE_MIDDLE ) then
			self:ResetToDefaultValue()
			return
		end
		self.Slider:OnMousePressed( mcode )
	end

	self.Slider.Knob:SetSize( 20, 20 )

	function self.Slider.Knob:Paint( w, h )
		TPerson.draw_Circle( w / 2, h * 0.25, w / 2, 200, TPerson['Color']['items']['false'] )
	end

	self.Label = vgui.Create ( "DLabel", self )
	self.Label:Dock( LEFT )
    self.Label:SetMouseInputEnabled( true )

	self.Scratch = self.Label:Add( "DNumberScratch" )
    self.Scratch:Dock( FILL )
	self.Scratch.OnValueChanged = function() 
		self:ValueChanged( self.Scratch:GetFloatValue() ) 
	end

	self:SetTall( 32 )

	self:SetMin( 0 )
	self:SetMax( 1 )
	self:SetDecimals( 2 )
	self:SetText( "" )
	self:SetValue( 0.5 )
    
	local Scratch = self.Scratch
	function self.Slider:Paint( w, h )
		local x, y = self.Knob:GetPos()
		local h025 = h * 0.25

        draw.RoundedBox( 6, 0, h025, w, h025, TPerson['Color']['items']['background'] )
		draw.RoundedBox( 6, 0, h025, x + 6, h025, TPerson['Color']['items']['false'] )

		if ( self:IsEditing() || self:IsHovered() || self.Knob:IsHovered() ) then 
			draw.SimpleText( math.Round( Scratch:GetFloatValue(), 1 ), 'comfortaa20', x + self.Knob:GetWide() / 2, h - 18, TPerson['Color']['items']['text'], TEXT_ALIGN_CENTER)
		end
    end

	--
	-- You really shouldn't be messing with the internals of these controls from outside..
	-- .. but if you are, this might stop your code from fucking us both.
	--
	self.Wang = self.Scratch

end

function PANEL:SetMinMax( min, max )
	self.Scratch:SetMin( tonumber( min ) )
	self.Scratch:SetMax( tonumber( max ) )
	self:UpdateNotches()
end

function PANEL:SetDark( b )
	self.Label:SetDark( b )
end

function PANEL:GetMin()
	return self.Scratch:GetMin()
end

function PANEL:GetMax()
	return self.Scratch:GetMax()
end

function PANEL:GetRange()
	return self:GetMax() - self:GetMin()
end

function PANEL:ResetToDefaultValue()
	if ( !self:GetDefaultValue() ) then return end
	self:SetValue( self:GetDefaultValue() )
end

function PANEL:SetMin( min )

	if ( !min ) then min = 0 end

	self.Scratch:SetMin( tonumber( min ) )
	self:UpdateNotches()

end

function PANEL:SetMax( max )

	if ( !max ) then max = 0 end

	self.Scratch:SetMax( tonumber( max ) )
	self:UpdateNotches()

end

function PANEL:SetValue( val )

	val = math.Clamp( tonumber( val ) || 0, self:GetMin(), self:GetMax() )

	if ( self:GetValue() == val ) then return end

	self.Scratch:SetValue( val ) -- This will also call ValueChanged

	self:ValueChanged( self:GetValue() ) -- In most cases this will cause double execution of OnValueChanged

end

function PANEL:GetValue()
	return self.Scratch:GetFloatValue()
end

function PANEL:SetDecimals( d )
	self.Scratch:SetDecimals( d )
	self:UpdateNotches()
	self:ValueChanged( self:GetValue() ) -- Update the text
end

function PANEL:GetDecimals()
	return self.Scratch:GetDecimals()
end

--
-- Are we currently changing the value?
--
function PANEL:IsEditing()

	return self.Scratch:IsEditing() || self.Slider:IsEditing()

end

function PANEL:IsHovered()

	return self.Scratch:IsHovered() || self.Slider:IsHovered() || vgui.GetHoveredPanel() == self

end

function PANEL:PerformLayout()

	self.Label:SetWide( self:GetWide() / 2.4 )

end

function PANEL:OnSizeChanged( w, h )
	self.Slider.Knob:SetSize( h * 0.5, h * 0.5 )
end

function PANEL:SetConVar( cvar )
	self.Scratch:SetConVar( cvar )
end

function PANEL:SetText( text )
	self.Label:SetText( text )
end

function PANEL:GetText()
	return self.Label:GetText()
end

function PANEL:ValueChanged( val )

	val = math.Clamp( tonumber( val ) || 0, self:GetMin(), self:GetMax() )

	self.Slider:SetSlideX( self.Scratch:GetFraction( val ) )

	self:OnValueChanged( val )

end

function PANEL:OnValueChanged( val )

	-- For override

end

function PANEL:TranslateSliderValues( x, y )

	self:SetValue( self.Scratch:GetMin() + ( x * self.Scratch:GetRange() ) )

	return self.Scratch:GetFraction(), y

end

function PANEL:UpdateNotches()

	local range = self:GetRange()
	self.Slider:SetNotches( nil )

	if ( range < self:GetWide() / 4 ) then
		return self.Slider:SetNotches( range )
	else
		self.Slider:SetNotches( self:GetWide() / 4 )
	end

end

function PANEL:SetEnabled( b )
	self.Slider:SetEnabled( b )
	self.Scratch:SetEnabled( b )
	FindMetaTable( "Panel" ).SetEnabled( self, b ) -- There has to be a better way!
end

function PANEL:PostMessage( name, _, val )

	if ( name == "SetInteger" ) then
		if ( val == "1" ) then
			self:SetDecimals( 0 )
		else
			self:SetDecimals( 2 )
		end
	end

	if ( name == "SetLower" ) then
		self:SetMin( tonumber( val ) )
	end

	if ( name == "SetHigher" ) then
		self:SetMax( tonumber( val ) )
	end

	if ( name == "SetValue" ) then
		self:SetValue( tonumber( val ) )
	end

end

function PANEL:PerformLayout()

	self.Scratch:SetVisible( false )
	self.Label:SetVisible( false )

	self.Slider:StretchToParent( 0, 0, 0, 0 )
	self.Slider:SetSlideX( self.Scratch:GetFraction() )

end

function PANEL:SetActionFunction( func )

	self.OnValueChanged = function( self, val ) func( self, "SliderMoved", val, 0 ) end

end

-- Compat
derma.DefineControl( "3T:NumSlider", "Backwards Compatibility", PANEL, "Panel" )