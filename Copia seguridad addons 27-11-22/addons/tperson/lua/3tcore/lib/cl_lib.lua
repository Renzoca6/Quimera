local Lang = TPerson['Lang']

function TPerson.AddText( ... )
	if ( TPerson['PrintText'] ) then
		chat.AddText( Color(255, 0, 0), TPerson['ServerName'] .. ' ', ... )
	end
end

local TActive = true
function TPerson.Update()
	if ( LocalPlayer():InVehicle() ) then return end

	TActive = not TActive

end

function TPerson.IsActive()
	if ( !TPerson.GetConfig()['allow']['third'] ) then return false end

	return TActive
end

function TPerson.IsScopping()
	local swep = LocalPlayer():GetActiveWeapon()

	if ( !IsValid( swep ) ) then return end

	local isTableSwepDT = istable( swep.dt )

	-- DarkRP && M9K
	if ( type( swep.GetIronsights ) == 'function' ) then
		return swep:GetIronsights()
	
	-- FAS ( swep.dt.Status == 0 is using by TFA Weapons but not for scopping )
	elseif ( isTableSwepDT && swep.dt.Status && swep.dt.Status != 0 ) then
		return swep.dt.Status == FAS_STAT_ADS

	--	CW 2.0
	elseif ( string.find( swep:GetClass(), "cw_", 0 ) && swep.dt && swep.dt.State ) then
		return swep.dt.State == 2

	-- ARcCW
	elseif ( swep.ArcCW ) then
		return swep:GetState() == ArcCW.STATE_SIGHTS

	-- TFA
	elseif ( type( swep.GetIronSights ) == 'function' ) then
		return swep:GetIronSights()

	else 
		return false
	end

end

function TPerson.OnPlayerChat( ply, text )
	if ply != LocalPlayer() then return end
	
	text = string.lower( text )

	if ( text == TPerson.SettingsCommand ) then
		TPerson.Menu()
		return true
	elseif ( text == TPerson.ResetCommand ) then
		TPerson.ResetConfig()
		return true
	end

end

function TPerson.OnPlayerSpawn( data )
	if ( LocalPlayer():UserID() != data['userid'] ) then return end

	local config = TPerson.GetConfig()
	if ( !config ) then return end

	if ( config['allow']['tOnSpawn'] && !TPerson.IsActive() || !config['allow']['tOnSpawn'] && TPerson.IsActive() ) then
		TPerson.Update()
	end

end

-- On player button press
function TPerson.OnPlayerButtonDown( ply, button )
	if ( LocalPlayer() != ply ) then return end
	if ( !IsFirstTimePredicted() ) then return end

	local config = TPerson.GetConfig()
	if ( !config ) then return end

	local trKey  = config['key']

    if ( config['allow']['third'] ) then 
        if ( button == trKey && input.IsButtonDown(trKey) ) then
            TPerson.Update()
            return true
        end
    end

end

if ( TPerson.UseContextMenu ) then 
	function TPerson.OnContextMenuClose()
		if ( TPerson.IsEditing() ) then
			TPerson.GetMenu():Remove()
		end
	end
end

function TPerson.IsNearOfEntity()

	local pPlayer = LocalPlayer()
	local tr = pPlayer:GetEyeTrace().Entity

	if ( IsValid( tr ) ) then

		local multiplicator = 1
		if ( TPerson['EntityDistance'][ tr:GetClass() ] ) then
			multiplicator = TPerson['EntityDistance'][ tr:GetClass() ]
		end

		if ( TPerson['OnlyRegistedEntity'] && TPerson['EntityDistance'][ tr:GetClass() ]  || !TPerson['OnlyRegistedEntity'] ) then
			if ( pPlayer:GetPos():DistToSqr( tr:GetPos() ) <= TPerson.BaseDistance * multiplicator ) then return true end
		end

	end

	return false
end

function TPerson.IsHoldingWeapon()
	local swep = LocalPlayer():GetActiveWeapon()

	if ( !IsValid( swep ) ) then return false end
	
	if ( TPerson.DisableOnHolding[ swep:GetClass() ] ) then return true end
end

local hAlpha = 0
net.Receive( 'TPerson:ToClient', function() 
	local config = TPerson.GetConfig()

	hAlpha = config['hitmarker']['color'].a
end )

function TPerson.DrawCrossHair()

	local config = table.Copy( TPerson.GetConfig() )
	if ( !config ) then return end

	local CrossHair = TPerson.GetChrossHair()
	local HitMarker = TPerson.GetHitMarker()

	local w, h = ScrW(), ScrH()
	local x, y = w / 2, h / 2

	if ( TPerson.IsActive() ) then
		local tr = LocalPlayer():GetEyeTraceNoCursor()
		if ( tr.HitPos ) then
			local scr = tr.HitPos:ToScreen()
			x,y = scr.x, scr.y
		end
	end

	if ( HitMarker && TPerson.IsEditing() && config['allow']['hitmarker'] ) then
		HitMarker['paint']( x, y, w, h, config['hitmarker']['color'], config['hitmarker']['sSpace'], config['hitmarker']['sHeight'], config['hitmarker']['sWidth'] )
	end

	if ( CrossHair ) then

		local shouldDraw = true
		if ( !config['allow']['cOnAiming'] && TPerson.IsScopping() ) then shouldDraw = false end
		if ( !config['allow']['cNearEntity'] && TPerson.IsNearOfEntity() ) then shouldDraw = false end

		if ( TPerson.IsActive() ) then
			if ( !config['allow']['crosshair3p'] ) then shouldDraw = false end
		else
			if ( !config['allow']['crosshair1p'] ) then shouldDraw = false end
		end
		
		if ( shouldDraw ) then
			CrossHair['paint']( x, y, w, h, config['crosshair']['color'], config['crosshair']['sSpace'], config['crosshair']['sWidth'], config['crosshair']['sHeight'] )
		end
	end

	if ( HitMarker && config['allow']['hitmarker'] ) then

		if ( hAlpha >= 0 ) then

			hAlpha = math.Approach(hAlpha, 0, 5 )
			local hColor = config['hitmarker']['color']
			hColor.a = hAlpha

			HitMarker['paint']( x, y, w, h, hColor, config['hitmarker']['sSpace'], config['hitmarker']['sHeight'], config['hitmarker']['sWidth'] )
		end
	end

end

function TPerson.HUDShouldDraw( element )
	if ( element == 'CHudCrosshair' ) then return false end

end

function TPerson.CalcView( ply, pos, angles, fov )
	if ( !TActive ) then return end
	if ( ply:InVehicle() ) then return end

	local config = TPerson.GetConfig()
	if ( !config ) then return end

	if ( !config['allow']['tNearEntity'] && TPerson.IsNearOfEntity() ) then return end
	if ( TPerson.IsHoldingWeapon() ) then return end

	if ( config['allow']['third'] ) then

		local bl = TPerson.IsScopping()
		if ( bl && !config['allow']['tOnAiming'] ) then return end

		local right = !bl && -config['view']['right']   || -17.7
		local fw    = !bl && -config['view']['forward'] || 15
		local up    = !bl && -config['view']['up']      || 2.5

		local newPos = pos
		newPos = newPos - ( angles:Right()   * right )
		newPos = newPos - ( angles:Forward() * fw )
		newPos = newPos - ( angles:Up()      * up )

		local tr = util.TraceHull( {
				start = pos,
				endpos = newPos,
				filter = ply,
				maxs = Vector(5, 5, 5),
				mins = Vector(-5, -5, -5)
			} )
			
		pos = tr.HitPos

		local view = {}
		view.origin = pos 
		view.angles = angles
		view.fov = fov * config['view']['sFov']
		view.drawviewer = true

		return view
	end
end