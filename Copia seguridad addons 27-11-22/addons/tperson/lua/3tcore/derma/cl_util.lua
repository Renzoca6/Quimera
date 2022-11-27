function TPerson.draw_Circle( x, y, radius, seg, color )
	local cir = {}

	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	draw.NoTexture()
	surface.SetDrawColor( color )
	surface.DrawPoly( cir )

end

function TPerson.LerpColor( spd, c1, c2 )
	return Color( Lerp( spd, c1.r, c2.r), Lerp( spd, c1.g, c2.g), Lerp( spd, c1.b, c2.b) )
end