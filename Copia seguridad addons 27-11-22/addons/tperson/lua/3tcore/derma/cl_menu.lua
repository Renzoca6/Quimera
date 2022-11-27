--[[--------------------[[--

	SCRIPT BY O S M O S

--]]------------------]]--

local config = TPerson
local Lang   = config['Lang']
local Theme  = config['Color']

surface.CreateFont( "comfortaa33", { font = "Comfortaa", size = 33, } )
surface.CreateFont( "comfortaa40", { font = "Comfortaa", size = 40, } )
surface.CreateFont( "comfortaa27", { font = "Comfortaa", size = 27, } )
surface.CreateFont( "comfortaa20", { font = "Comfortaa", size = 20, } )
surface.CreateFont( "comfortaa15", { font = "Comfortaa", size = 15, } )

local function saveNewConfig( callback )

	local body = vgui.Create('DFrame')
	body:SetSize( 400, 75 )
	body:Center()
	body:MakePopup()
	body:ShowCloseButton( false )
	body:SetTitle('')

	function body:Paint( w , h )
		-- Header
		draw.RoundedBoxEx( 16, 0, 0, w, h * 0.4, Theme['menu']['header'], true, true, false, false )

		draw.SimpleText( Lang['saveNewConfig'], 'comfortaa27', w / 2, h * 0.2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

		-- Body
		draw.RoundedBoxEx( 16, 0, h * 0.4, w, h * 0.6, Theme['menu']['background'], false, false, true, true )
	end

	local yes = vgui.Create('DButton', body )
	yes:SetSize( body:GetWide() * 0.4, body:GetTall() * 0.3 )
	yes:SetPos( body:GetWide() * 0.05, body:GetTall() * 0.55  )
	yes:SetText('')

	function yes:Paint( w , h )
		draw.RoundedBox( 6, 0, 0, w, h, Theme['items']['true'] )

		draw.SimpleText( Lang['yes'], 'comfortaa33', w / 2, h / 2 - 2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	function yes:DoClick()
		body:Remove()
		if ( callback ) then
			callback( true )
		end
	end

	local no = vgui.Create('DButton', body )
	no:SetSize( body:GetWide() * 0.4, body:GetTall() * 0.3 )
	no:SetPos( body:GetWide() * 0.55, body:GetTall() * 0.55  )
	no:SetText('')

	function no:Paint( w , h )
		draw.RoundedBox( 6, 0, 0, w, h, Theme['items']['false'] )

		draw.SimpleText( Lang['no'], 'comfortaa33', w / 2, h / 2 - 2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	function no:DoClick()
		body:Remove()
		if ( callback ) then
			callback( false )
		end
	end

end

local function importConfig()

	local body = vgui.Create('DFrame')
	body:SetSize( 400, 150 )
	body:Center()
	body:MakePopup()
	body:ShowCloseButton( false )
	body:SetTitle('')

	function body:Paint( w , h )
		-- Header
		draw.RoundedBoxEx( 16, 0, 0, w, h * 0.3, Theme['menu']['header'], true, true, false, false )

		draw.SimpleText( Lang['importNewConfig'], 'comfortaa27', w * 0.05, h * 0.15, Theme['items']['text'], nil, TEXT_ALIGN_CENTER )

		-- Body
		draw.RoundedBoxEx( 16, 0, h * 0.3, w, h * 0.7, Theme['menu']['background'], false, false, true, true )
	end

	local close = vgui.Create('DButton', body )
	close:SetSize( body:GetTall() * 0.2, body:GetTall() * 0.2 )
	close:SetPos(  body:GetWide() - body:GetTall() * 0.25, body:GetTall() * 0.05 )
	close:SetText( 'X' )
	close:SetFont( 'comfortaa27' )
	close:SetTextColor( Color(255, 255, 255) )

	function close:Paint( w, h )
	end

	function close:DoClick()
		body:Remove()
	end

	local canImport = false

	local save = vgui.Create('DButton', body )
	save:SetSize( body:GetWide() * 0.6, body:GetTall() * 0.15 )
	save:SetPos( body:GetWide() * 0.2, body:GetTall() * 0.75 )
	save:SetText('')
	save:SetEnabled( canImport )
	save:SetCursor('no')

	function save:Paint( w, h )

		draw.RoundedBox( 6, 0, 0, w, h, Theme['items']['true'] )

		draw.SimpleText( Lang['import'], 'comfortaa27', w / 2, h / 2 - 2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

		if ( !self:IsEnabled() ) then
			draw.RoundedBox( 6, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
		end

	end

	local textentry = vgui.Create('DTextEntry', body )
	textentry:SetSize( body:GetWide() * 0.8, body:GetTall() * 0.3 )
	textentry:SetPos( body:GetWide() * 0.1, body:GetTall() * 0.4 )
	textentry:SetMultiline( true )
	textentry:SetDrawLanguageID( false )
	textentry:SetFont( 'comfortaa15' )

	function textentry:OnChange()
		local value = self:GetValue()

		if ( !value ) then save:SetCursor('no') save:SetEnabled( false ) return end

		value = util.JSONToTable( value )

		if ( !istable( value ) ) then save:SetCursor('no') save:SetEnabled( false ) return end
		if ( !TPerson.IsValidConfig( value ) ) then save:SetCursor('no') save:SetEnabled( false ) return end

		save:SetEnabled( true )
		save:SetCursor('hand')
	end

	function save:DoClick()
		TPerson.SaveConfig( util.JSONToTable( textentry:GetValue() ) )

		body:Remove()
		if ( IsValid( TPerson.body) ) then 
			TPerson.body:Remove()
		end
	end

end

TPerson.body = TPerson.body or nil
function TPerson.IsEditing()
	return IsValid( TPerson.body )
end

function TPerson.GetMenu()
	return TPerson.body
end

function TPerson.Menu()
	
	if ( TPerson.IsEditing() ) then
		TPerson.GetMenu():Remove()
	end

	local userC = TPerson.GetConfig()
	local oldConfig = table.Copy( userC )
	
	local bodyWide, bodyTall = ScrW() * 0.35, ScrH() * 0.8

	TPerson.body = vgui.Create('DFrame')
	TPerson.body:SetSize( bodyWide, bodyTall )
	TPerson.body:Center()
	TPerson.body:MakePopup()
	TPerson.body:ShowCloseButton( false )
	TPerson.body:SetTitle( '' )

	function TPerson.body:Paint( w, h )

		-- Header
		draw.RoundedBoxEx( 16, 0, 0, w, h * 0.1, Theme['menu']['header'], true, true, false, false )

		draw.SimpleText( Lang['settings'], 'comfortaa33', w * 0.05, h * 0.05, Theme['items']['text'], nil, TEXT_ALIGN_CENTER )

		-- Body
		draw.RoundedBoxEx( 16, 0, h * 0.1, w, h * 0.9, Theme['menu']['background'], false, false, true, true )

	end

	local close = vgui.Create('DButton', TPerson.body )
	close:SetSize( 40, 40 )
	close:SetPos(  bodyWide * 0.95 - 40, bodyTall * 0.05 - 20 )
	close:SetText( 'X' )
	close:SetFont( 'comfortaa40' )
	close:SetTextColor( Color(255, 255, 255) )

	function close:Paint( w, h )
	end

	function close:DoClick()
		if ( !TPerson.EqualToActual( oldConfig ) ) then
			saveNewConfig( function( save )
				if ( !save ) then 
					userC = oldConfig
				end
				TPerson.SaveConfig( userC )
				TPerson.body:Remove()
			end )
		else
			TPerson.body:Remove()
		end
	end

	local core = vgui.Create('DScrollPanel', TPerson.body )
	core:SetPos( bodyWide * 0.05, bodyTall * 0.11 )
	core:SetSize( bodyWide * 0.9, bodyTall * 0.87 )

	core:GetVBar():SetWide( 0 )

	local rowWide, rowTall = core:GetWide(), core:GetTall() / 12

	-- Third person categ
	local title = core:Add('3T:Row')
	title:Dock( TOP )
	title:SetSize( rowWide, rowTall )
	title:SetTitle(Lang['3rd person'])
	title:SetFont('comfortaa27')
	title:SetTitleColor( Theme['menu']['category'] )

		-- Binder row
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['key'] )
		row:SetFont('comfortaa33')
		row:SetDescription( Lang['dKey'] )

		local binder = vgui.Create('3T:Binder', row )
		binder:SetSize( rowWide / 3, rowTall )
		binder:SetPos( rowWide - binder:GetWide(), 0 )
		binder:SetValue( userC['key'] )
		binder:SetFont('comfortaa33')

		function binder:OnChange( key )
			userC['key'] = key
		end

		-- Slider 1
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['forward'] )
		row:SetFont('comfortaa33')
		row:DockMargin( 0, core:GetTall() / 12 * 0.25, 0, 0 )

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 2, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
        slider:SetMinMax( -100, 100 )
		slider:SetValue( userC['view']['forward'] )
		
		function slider:OnValueChanged( value )
			userC['view']['forward'] = value
		end

		-- Slider 2
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['width'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
        slider:SetPos( rowWide - binder:GetWide(), 0 )
        slider:SetMinMax( -100, 100 )
		slider:SetValue( userC['view']['right'] )
		
		function slider:OnValueChanged( value )
			userC['view']['right'] = value
		end

		-- Slider 3
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['height'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
        slider:SetPos( rowWide - binder:GetWide(), 0 )
        slider:SetMinMax( -100, 100 )
		slider:SetValue( userC['view']['up'] )
		
		function slider:OnValueChanged( value )
			userC['view']['up'] = value
		end

		-- Slider 3
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['fov'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
        slider:SetPos( rowWide - binder:GetWide(), 0 )
        slider:SetMinMax( 0, 2 )
		slider:SetValue( userC['view']['sFov'] )
		
		function slider:OnValueChanged( value )
			userC['view']['sFov'] = value
		end

	-- Crosshair categ
	local title = core:Add('3T:Row')
	title:Dock( TOP )
	title:SetSize( rowWide, rowTall )
	title:SetTitle( Lang['crosshair'] )
	title:SetFont('comfortaa27')
	title:SetTitleColor( Theme['menu']['category'] )
	
		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, core:GetTall() / 6 )
		row:SetTitle( Lang['style'] )
		row:SetFont('comfortaa33')
		row:SetDescription( Lang['dStyle'] )

		local selector = vgui.Create( "3T:Selector", row )
		selector:SetSize( rowWide / 3, row:GetTall() )
		selector:SetPos( rowWide - selector:GetWide(), 0 )
		selector:SetCrossHairColor( userC['crosshair']['color'] )
		for i, v in ipairs( TPerson.GetCrossHairs() ) do

			local show = true
			if ( v['whitelist'] ) then
				show = v['whitelist'][ LocalPlayer():GetUserGroup() ]
			end

			local choice = selector:Add()
			choice:SetSize( selector:GetWide() / 3 - 5, 40 )
			choice:SetText( '' )
			choice:SetValue( false )

			choice.Paint = function( _, w, h )
				_.Color = _:GetChecked() && Theme['items']['true'] || Theme['items']['background']
		
				draw.RoundedBox(6, 0, 0, w, h, _.Color )
		
				draw.RoundedBox(6, 1, 1, w-2, h-2, Theme['menu']['background'] )

				choice.Color = show && selector.CrossHairColor || Theme['items']['background']
				v['paint']( w / 2, h / 2, w, h, choice.Color, 1, 1, 1 )
			end

			choice.OnChange = function( _, state )
				if ( !show ) then choice:SetChecked( false ) return end
				if ( choice == selector.Choice  ) then choice:SetChecked( true ) return end

				if ( state ) then
					selector.Choice:SetChecked( false )
					selector.Choice = choice

					userC['crosshair']['style'] = i
				end 
			end

			if ( i == userC['crosshair']['style'] ) then 
				choice:SetChecked( true )
				selector.Choice = choice
			end
		end

		-- Invisible row
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('')
		row:SetFont('comfortaa33')

		-- Color picker
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, core:GetTall() / 4 )
		row:SetTitle( Lang['color'] )
		row:SetFont('comfortaa33')

		local colorPicker = vgui.Create( "3T:ColorWheel", row )
		colorPicker:SetSize( rowWide / 3, row:GetTall() )
		colorPicker:SetPos( rowWide - colorPicker:GetWide(), 0 )
		colorPicker:SetColor( userC['crosshair']['color'] )

		function colorPicker:OnColorChanged( color )
			selector:SetCrossHairColor( color )
			userC['crosshair']['color'] = color
		end

		-- Invisible row
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('')
		row:SetFont('comfortaa33')

		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['alpha'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 255 )
		slider:SetValue( userC['crosshair']['color'].a )
		
		function slider:OnValueChanged( value )
			userC['crosshair']['color'].a = value
			selector:SetCrossHairColor( userC['crosshair']['color'] )
		end

		-- Slider 3
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['length'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 15 )
		slider:SetValue( userC['crosshair']['sHeight'] )
		
		function slider:OnValueChanged( value )
			userC['crosshair']['sHeight'] = value
		end


		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['size'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 15 )
		slider:SetValue( userC['crosshair']['sWidth'] )
		
		function slider:OnValueChanged( value )
			userC['crosshair']['sWidth'] = value
		end

		-- Slider 3
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['space'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 15 )
		slider:SetValue( userC['crosshair']['sSpace'] )
		
		function slider:OnValueChanged( value )
			userC['crosshair']['sSpace'] = value
		end
		
	-- 	Hit marker categ
	local title = core:Add('3T:Row')
	title:Dock( TOP )
	title:SetSize( rowWide, rowTall )
	title:SetTitle( Lang['hitmarker'] )
	title:SetFont('comfortaa27')
	title:SetTitleColor( Theme['menu']['category'] )
	
		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, core:GetTall() / 6 )
		row:SetTitle( Lang['style'] )
		row:SetFont('comfortaa33')
		row:SetDescription( Lang['dStyle'] )

		local selector = vgui.Create( "3T:Selector", row )
		selector:SetSize( rowWide / 3, row:GetTall() )
		selector:SetPos( rowWide - selector:GetWide(), 0 )
		selector:SetCrossHairColor( userC['hitmarker']['color'] )
		for i, v in ipairs( TPerson.GetHitMarkers() ) do

			local show = true
			if ( v['whitelist'] ) then
				show = v['whitelist'][ LocalPlayer():GetUserGroup() ]
			end

			local choice = selector:Add()
			choice:SetSize( selector:GetWide() / 3 - 5, 40 )
			choice:SetText( '' )
			choice:SetValue( false )

			choice.Paint = function( _, w, h )
				_.Color = _:GetChecked() && Theme['items']['true'] || Theme['items']['background']
		
				draw.RoundedBox(6, 0, 0, w, h, _.Color )
		
				draw.RoundedBox(6, 1, 1, w-2, h-2, Theme['menu']['background'] )
				
				choice.Color = show && selector.CrossHairColor || Theme['items']['background']
				v['paint']( w / 2, h / 2, w, h, choice.Color, 1, 1, 1 )
			end

			choice.OnChange = function( _, state )
				if ( !show ) then choice:SetChecked( false ) return end
				if ( choice == selector.Choice ) then choice:SetChecked( true ) return end

				if ( state ) then
					selector.Choice:SetChecked( false )
					selector.Choice = choice

					userC['hitmarker']['style'] = i
				end 
			end

			if ( i == userC['hitmarker']['style'] ) then 
				choice:SetChecked( true )
				selector.Choice = choice
			end
		end

		-- Invisible row
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('')
		row:SetFont('comfortaa33')

		-- Color picker
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, core:GetTall() / 4 )
		row:SetTitle( Lang['color'] )
		row:SetFont('comfortaa33')

		local colorPicker = vgui.Create( "3T:ColorWheel", row )
		colorPicker:SetSize( rowWide / 3, row:GetTall() )
		colorPicker:SetPos( rowWide - colorPicker:GetWide(), 0 )
		colorPicker:SetColor( userC['hitmarker']['color'] )

		function colorPicker:OnColorChanged( color )
			selector:SetCrossHairColor( color )
			userC['hitmarker']['color'] = color
		end

		-- Invisible row
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('')
		row:SetFont('comfortaa33')

		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['alpha'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 255 )
		slider:SetValue( userC['hitmarker']['color'].a )
		
		function slider:OnValueChanged( value )
			userC['hitmarker']['color'].a = value
			selector:SetCrossHairColor( userC['hitmarker']['color'] )
		end

		-- Slider 3
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['length'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 15 )
		slider:SetValue( userC['hitmarker']['sHeight'] )
		
		function slider:OnValueChanged( value )
			userC['hitmarker']['sHeight'] = value
		end


		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['size'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 15 )
		slider:SetValue( userC['hitmarker']['sWidth'] )
		
		function slider:OnValueChanged( value )
			userC['hitmarker']['sWidth'] = value
		end

		-- Slider 3
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['space'] )
		row:SetFont('comfortaa33')

		local slider = vgui.Create('3T:NumSlider', row )
		slider:SetSize( rowWide / 3, rowTall )
		slider:SetPos( rowWide - binder:GetWide(), 0 )
		slider:SetMinMax( 0, 15 )
		slider:SetValue( userC['hitmarker']['sSpace'] )
		
		function slider:OnValueChanged( value )
			userC['hitmarker']['sSpace'] = value
		end

	-- Allow categ
	local title = core:Add('3T:Row')
	title:Dock( TOP )
	title:SetSize( rowWide, rowTall )
	title:SetTitle( Lang['allow'] )
	title:SetFont('comfortaa27')
	title:SetTitleColor( Theme['menu']['category'] )

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['3rd person'] )
		row:SetFont('comfortaa33')

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( '   ' .. Lang['usable'] )
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['d3rd person'] )

		local allowTP = vgui.Create('3T:Switch', row )
		allowTP:SetActivate( userC['allow']['third'] )
		allowTP:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowTP:SetPos( rowWide - allowTP:GetWide(), 0 )
		function allowTP:DoClick()
			userC['allow']['third'] = not userC['allow']['third']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( '   ' .. Lang['onAiming'] )
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['dOnAiming'] )

		local allowTP = vgui.Create('3T:Switch', row )
		allowTP:SetActivate( userC['allow']['tOnAiming'] )
		allowTP:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowTP:SetPos( rowWide - allowTP:GetWide(), 0 )
		function allowTP:DoClick()
			userC['allow']['tOnAiming'] = not userC['allow']['tOnAiming']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( '   ' .. Lang['nearOfEntity'] )
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['dNearOfEntity' ] )

		local allowTP = vgui.Create('3T:Switch', row )
		allowTP:SetActivate( userC['allow']['tNearEntity'] )
		allowTP:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowTP:SetPos( rowWide - allowTP:GetWide(), 0 )
		function allowTP:DoClick()
			userC['allow']['tNearEntity'] = not userC['allow']['tNearEntity']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( '   ' .. Lang['onSpawn'] )
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['dOnSpawn'] )

		local allowTP = vgui.Create('3T:Switch', row )
		allowTP:SetActivate( userC['allow']['tOnSpawn'] )
		allowTP:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowTP:SetPos( rowWide - allowTP:GetWide(), 0 )
		function allowTP:DoClick()
			userC['allow']['tOnSpawn'] = not userC['allow']['tOnSpawn']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( '   ' .. Lang['onVehicle'] )
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['dOnVehicle'] )

		local allowTP = vgui.Create('3T:Switch', row )
		allowTP:SetActivate( userC['allow']['tOnVehicle'] )
		allowTP:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowTP:SetPos( rowWide - allowTP:GetWide(), 0 )
		function allowTP:DoClick()
			userC['allow']['tOnVehicle'] = not userC['allow']['tOnVehicle']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['crosshair'] )
		row:SetFont('comfortaa33')

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( '   ' .. Lang['1rd person'] )
		row:SetFont('comfortaa27')

		local allowCFP = vgui.Create('3T:Switch', row )
		allowCFP:SetActivate( userC['allow']['crosshair1p'] )
		allowCFP:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowCFP:SetPos( rowWide - allowCFP:GetWide(), 0 )
		
		function allowCFP:DoClick()
			userC['allow']['crosshair1p'] = not userC['allow']['crosshair1p']
		end
	
		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('   ' .. Lang['3rd person'])
		row:SetFont('comfortaa27')

		local allowCTP = vgui.Create('3T:Switch', row )
		allowCTP:SetActivate( userC['allow']['crosshair3p'] )
		allowCTP:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowCTP:SetPos( rowWide - allowCTP:GetWide(), 0 )
		
		function allowCTP:DoClick()
			userC['allow']['crosshair3p'] = not userC['allow']['crosshair3p']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('   ' .. Lang['onAiming'])
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['dOnAiming'] )

		local allowCOA = vgui.Create('3T:Switch', row )
		allowCOA:SetActivate( userC['allow']['cOnAiming'] )
		allowCOA:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowCOA:SetPos( rowWide - allowCOA:GetWide(), 0 )
		
		function allowCOA:DoClick()
			userC['allow']['cOnAiming'] = not userC['allow']['cOnAiming']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('   ' .. Lang['nearOfEntity'] )
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['dNearOfEntity' ] )

		local allowCOA = vgui.Create('3T:Switch', row )
		allowCOA:SetActivate( userC['allow']['cNearEntity'] )
		allowCOA:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowCOA:SetPos( rowWide - allowCOA:GetWide(), 0 )
		
		function allowCOA:DoClick()
			userC['allow']['cNearEntity'] = not userC['allow']['cNearEntity']
		end

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle( Lang['hitmarker'] )
		row:SetFont('comfortaa33')

		-- Toggle button
		local row = core:Add('3T:Row')
		row:Dock( TOP )
		row:SetSize( rowWide, rowTall )
		row:SetTitle('   ' ..  string.lower( Lang['allow'] ) )
		row:SetFont('comfortaa27')
		row:SetDescription( Lang['dUsable'] )

		local allowCOA = vgui.Create('3T:Switch', row )
		allowCOA:SetActivate( userC['allow']['hitmarker'] )
		allowCOA:SetSize( ( rowWide / 3 * 0.4 ), rowTall )
		allowCOA:SetPos( rowWide - allowCOA:GetWide(), 0 )
		
		function allowCOA:DoClick()
			userC['allow']['hitmarker'] = not userC['allow']['hitmarker']
		end

	-- Import and export buttons
	local row = core:Add('3T:Row')
	row:Dock( TOP )
	row:SetSize( rowWide, rowTall )
	row:SetTitle(Lang['configuration'])
	row:SetFont('comfortaa33')
	row:SetDescription( Lang['dButtons'] )

	local row = core:Add('3T:Row')
	row:Dock( TOP )
	row:SetSize( rowWide, rowTall )
	row:SetTitle('')

	local spd = FrameTime() * 0.05
	
	local import = vgui.Create('DButton', row )
	import:SetSize( rowWide * 0.45, rowTall )
	import:SetPos( rowWide - rowWide * 0.475, 0  )
	import:SetText('')

	function import:Paint( w, h )
		draw.RoundedBox( 6, 0, 0, w, h, TPerson['Color']['items']['import'] )

		draw.SimpleText(Lang['import'], "comfortaa27", w / 2, h / 2 - 2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	function import:DoClick()
		importConfig()
	end

	local export = vgui.Create('DButton', row )
	export:SetSize( rowWide * 0.45, rowTall )
	export:SetPos( rowWide * 0.025, 0  )
	export:SetText('')

	function export:Paint( w, h )
		draw.RoundedBox( 6, 0, 0, w, h, TPerson['Color']['items']['export'] )

		draw.SimpleText(Lang['export'], "comfortaa27", w / 2, h / 2 - 2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	function export:DoClick()
		SetClipboardText( util.TableToJSON( userC ) )
		TPerson.AddText( Color(255, 255, 255), Lang['exportClipboard'] )
	end

	-- Invisible row
	local row = core:Add('3T:Row')
	row:Dock( TOP )
	row:SetSize( rowWide, core:GetTall() / 30 )
	row:SetTitle('')
	row:SetFont('comfortaa33')

	-- Save button
	local row = core:Add('3T:Row')
	row:Dock( TOP )
	row:SetSize( rowWide, rowTall )
	row:SetTitle('')

	local reset = vgui.Create('DButton', row )
	reset:SetSize( rowWide * 0.45, rowTall )
	reset:SetPos( rowWide * 0.025, 0  )
	reset:SetText('')

	function reset:Paint( w , h )
		draw.RoundedBox( 6, 0, 0, w, h, TPerson['Color']['items']['false'] )

		draw.SimpleText( Lang['reset'], 'comfortaa27', w / 2, h / 2 - 2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	function reset:DoClick()
		TPerson.ResetConfig()
		TPerson.body:Remove()
		TPerson.Menu()
	end

	local save = vgui.Create('DButton', row )
	save:SetSize( rowWide * 0.45 , rowTall )
	save:SetPos( rowWide * 0.525 , 0  )
	save:SetText('')

	function save:Paint( w , h )
		draw.RoundedBox( 6, 0, 0, w, h, TPerson['Color']['items']['true'] )

		draw.SimpleText( Lang['save'], 'comfortaa27', w / 2, h / 2 - 2, Theme['items']['text'], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	function save:DoClick()
		TPerson.SaveConfig( userC )
		TPerson.body:Remove()
	end

end

if ( TPerson.UseContextMenu ) then
	list.Set(
		"DesktopWindows", 
		"ThirdPerson",
		{
			title = "Third Person",
			icon = "icon64/playermodel.png",
			init = function(icn, pnl)
				TPerson.Menu()
				pnl:Remove()
			end
		}
	)
end

--[[--------------------[[--

	SCRIPT BY O S M O S

--]]------------------]]--