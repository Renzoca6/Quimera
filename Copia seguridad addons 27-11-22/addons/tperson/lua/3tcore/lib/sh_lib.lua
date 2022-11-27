function TPerson.OnPlayerSwitchWeapons( ply, oldWeapon, newWeapon )
	if ( CLIENT && ply != LocalPlayer() ) then return end

	-- Force to disable the weapon crosshair
	if ( newWeapon ) then
		if ( newWeapon.DrawCrossHair != nil ) then
			newWeapon.DrawCrossHair = false
		elseif ( newWeapon.DrawCrosshair != nil ) then
			newWeapon.DrawCrosshair = false
		end
		
		if ( newWeapon.CrosshairEnabled != nil ) then
			newWeapon.CrosshairEnabled = false
		end

	end

end