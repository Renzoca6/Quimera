local PANEL = {}

function PANEL:Init()

	self:SetText( "" ) 
	self.Activate = true

	-- UI
	self.CirclePos = self:GetWide() * 0.25
	self.CircleRed = TPerson['Color']['items']['false']
	self.CircleGreen = TPerson['Color']['items']['true']
	self.Spd = FrameTime() * 2
end

function PANEL:SetActivate( boolean )

	self.Activate = boolean

end

function PANEL:GetActivate()

	return self.Activate

end

function PANEL:Update()
	
	self:SetActivate( !self:GetActivate() )

end

function PANEL:DoClickInternal()
	self:Update()
end

function PANEL:OnSizeChanged( w, h )
	self.CirclePos = self.Activate && w * 0.75 || w * 0.25
end

function PANEL:Paint(w, h)
	self.CirclePos = Lerp( self.Spd, self.CirclePos, self.Activate && w * 0.75 || w * 0.25 )
	self.CircleColor = TPerson.LerpColor( self.Spd, self.Activate && self.CircleGreen || self.CircleRed, self.Activate && self.CircleRed || self.CircleGreen )

	draw.RoundedBox(6, w * 0.25, h * 0.375, w * 0.5, h * 0.25, TPerson['Color']['items']['background'] )	

	TPerson.draw_Circle( self.CirclePos, h * 0.5, w * 0.20, 200, self.CircleColor )
end

vgui.Register( "3T:Switch", PANEL, "DButton" )