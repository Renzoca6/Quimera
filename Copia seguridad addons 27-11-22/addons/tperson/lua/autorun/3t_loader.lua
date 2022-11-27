TPerson = TPerson or {
    ['Lang'] = {},
	['Path'] = '3tcore',
	['Color'] = {}
}

local function includeFile( file, module )
	if ( file == nil || !isstring( file ) ) then return end

	module = isstring( module ) && module .. '/' || ''

	local ext = string.sub( file, 1, 3)

	if ( ext == "cl_" || ext == "sh_" ) then
		if SERVER then
			AddCSLuaFile( module .. file )
		else
			include( module .. file )
		end
	end

	if ( ext == "sv_" || ext == "sh_" ) then 
		if SERVER then
			include( module .. file )
		end
	end

end

local function RunModule( module )
	local files, children = file.Find( module .. "/*", "LUA" )

	for _, file in ipairs( files ) do
		includeFile( file, module )
	end

	if ( children ) then
		for _, child in ipairs( children ) do
			RunModule( module .. "/" .. child )
		end
	end
end


local _, modules = file.Find( TPerson.Path .. "/*", "LUA" )

includeFile( "sh_config.lua", TPerson.Path  )

local tr = "cl_" .. GetConVar('gmod_language'):GetString() .. ".lua"
if ( file.Exists( TPerson.Path .. "/language/" .. tr,  "LUA" ) ) then
	includeFile( tr, TPerson.Path .. "/language" )
else
	includeFile( 'cl_en.lua', TPerson.Path .. "/language"  )
end

for _, module in ipairs( modules ) do
	if ( module == 'language' ) then continue end
	RunModule( TPerson.Path .. "/" .. module )
end

if ( TPerson.ForceDownload && SERVER ) then
    resource.AddWorkshop( '2133877380' )
end