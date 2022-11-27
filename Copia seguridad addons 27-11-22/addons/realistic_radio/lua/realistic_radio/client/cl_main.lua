--[[
  _____            _ _     _   _        _____           _ _        
 |  __ \          | (_)   | | (_)      |  __ \         | (_)       
 | |__) |___  __ _| |_ ___| |_ _  ___  | |__) |__ _  __| |_  ___   
 |  _  // _ \/ _` | | / __| __| |/ __| |  _  // _` |/ _` | |/ _ \  
 | | \ \  __/ (_| | | \__ \ |_| | (__  | | \ \ (_| | (_| | | (_) | 
 |_|  \_\___|\__,_|_|_|___/\__|_|\___| |_|  \_\__,_|\__,_|_|\___/  
                                                                                                                                    
]]

function Realistic_Radio.GetFrequency(ply)
    return (math.Round(ply:GetNWFloat("rdo_frequency"), 1) or 0.0)
end 

 /* 76561198080077257 */
local function CheckBaseFrequency()
    local Result = false 
    for k,v in pairs(Realistic_Radio.BaseFrequencies) do
        if not Realistic_Radio.SecureFrequencyChange then
            if v.Team[team.GetName(LocalPlayer():Team())] then 
                Result = true 
            end
        end
    end 
    return Result
end 

-- Main Table for all information of the Radio
Realistic_Radio.MainTable = Realistic_Radio.MainTable or {
    ["Statut"] = true, 
    ["Mute"] = true,
    ["StopSound"] = false,
    ["CanTalk"] = true, 
    ["Freq"] = 0, 
    ["Selected"] = 0,
    ["RDOSecureFreq"] = 0, 
    ["RDOButtonSelect"] = 1,
    ["KeyMuteSound"] = Realistic_Radio.KeyNoSound, 
    ["KeyMuteMicro"] = Realistic_Radio.KeyMute, 
    ["HUDTurnOff"] = false, 
    ["ScrollRadio"] = 0, 
}

local RDOFrequencies = {
    [0] = (Realistic_Radio.MainTable["Freq"] or 0), [1] = 0, [2] = (Realistic_Radio.MainTable["Dispatch"] or 0), 
}

-- Table for the Password
local TableText = string.ToTable("----")

-- All things that the radio will do with different key
local RDOButtonFunction = {
	[0] = {
		[KEY_RIGHT] = function()
            Realistic_Radio.MainTable["RDOButtonSelect"] = Realistic_Radio.MainTable["RDOButtonSelect"] < 3 and (Realistic_Radio.MainTable["RDOButtonSelect"] + 1) or 1
		end, 
		[KEY_LEFT] = function()
            Realistic_Radio.MainTable["RDOButtonSelect"] = Realistic_Radio.MainTable["RDOButtonSelect"] > 1 and (Realistic_Radio.MainTable["RDOButtonSelect"] - 1) or 3
		end,
		[KEY_ENTER] = function()
            if Realistic_Radio.MainTable["RDOButtonSelect"] == 1 then 
               if CheckBaseFrequency() then Realistic_Radio.Notify(Realistic_Radio.GetSentence("cantcreatesecure1"), 10) return end 
                Realistic_Radio.MainTable["Selected"] = Realistic_Radio.MainTable["RDOButtonSelect"]
                Realistic_Radio.MainTable["RDOButtonSelect"] = 1 
            elseif Realistic_Radio.MainTable["RDOButtonSelect"] == 2 then 
                net.Start("RDO:SecureFrequencies")
                    net.WriteUInt(3, 5)
                net.SendToServer()
                Realistic_Radio.MainTable["Selected"] = Realistic_Radio.MainTable["RDOButtonSelect"]
                Realistic_Radio.MainTable["RDOButtonSelect"] = 1 
            elseif Realistic_Radio.MainTable["RDOButtonSelect"] == 3 then 
                net.Start("RDO:SetFrequencies")
                    net.WriteUInt(2, 5)
                    net.WriteString("Statut")
                net.SendToServer()
            end 
		end,
	},
    [1] = {
        [KEY_DOWN] = function()
            Realistic_Radio.MainTable["RDOButtonSelect"] = Realistic_Radio.MainTable["RDOButtonSelect"] == 1 and 2 or 1
        end,
        [KEY_UP] = function()
            Realistic_Radio.MainTable["RDOButtonSelect"] = Realistic_Radio.MainTable["RDOButtonSelect"] == 1 and 2 or 1
        end,
        [KEY_RIGHT] = function()
            if Realistic_Radio.MainTable["RDOButtonSelect"] == 2 then Realistic_Radio.MainTable["RDOButtonSelect"] = 3 end  
        end,
        [KEY_LEFT] = function()
            if Realistic_Radio.MainTable["RDOButtonSelect"] == 3 then Realistic_Radio.MainTable["RDOButtonSelect"] = 2 end  
        end,
        [KEY_ENTER] = function()
            if Realistic_Radio.MainTable["RDOButtonSelect"] == 3 then 
                if RDOFrequencies[1] != 0 then 
                    if TableText[1] != "-" && TableText[2] != "-" && TableText[3] != "-" && TableText[4] != "-" then 
                        net.Start("RDO:SecureFrequencies")
                            net.WriteUInt(1, 5)
                            net.WriteUInt(RDOFrequencies[1], 32)
                            net.WriteString(TableText[1]..TableText[2]..TableText[3]..TableText[4])
                        net.SendToServer()
                    else 
                        Realistic_Radio.Notify(Realistic_Radio.GetSentence("passwordproblem"), 10)
                    end 
                else 
                    Realistic_Radio.Notify(Realistic_Radio.GetSentence("frequencyno0"), 10)
                end 
            end 
        end,
        [KEY_BACKSPACE] = function()
            if Realistic_Radio.MainTable["RDOButtonSelect"] != 2 then 
                RDOFrequencies[1] = 0 
                TableText = string.ToTable("----")
                Realistic_Radio.MainTable["Selected"] = 0 
            end 
        end,
    },
    [2] = {
        [KEY_BACKSPACE] = function()
            Realistic_Radio.MainTable["Selected"] = 0 
            Realistic_Radio.MainTable["RDOButtonSelect"] = 2
        end,
        [KEY_ENTER] = function()
            if CheckBaseFrequency() then 
                if istable(RDOSecureTable) then 
                    net.Start("RDO:SetFrequencies")
                        net.WriteUInt(1, 5)
                        net.WriteUInt((RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"] + Realistic_Radio.MainTable["ScrollRadio"]]["Frequency"] or 0), 32)
                        net.WriteUInt((RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"] + Realistic_Radio.MainTable["ScrollRadio"]]["Dispatch"] or 0), 32)
                    net.SendToServer()
                    Realistic_Radio.Notify(Realistic_Radio.GetSentence("joinedfrequency").." "..(RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"] + Realistic_Radio.MainTable["ScrollRadio"]]["Frequency"] or 0).."."..(RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"]]["Dispatch"] or 0).." mhz", 10)
                end 
            else 
                if istable(RDOSecureTable) && #RDOSecureTable > 0 && IsValid(RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"]]["Owner"]) then 
                    if LocalPlayer() != RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"]]["Owner"] then 
                        Realistic_Radio.MainTable["Selected"] = 3
                    else 
                        Realistic_Radio.Notify(Realistic_Radio.GetSentence("cantjoinyoursecure"), 10)
                    end 
                end 
            end 
        end, 
        [KEY_DOWN] = function()
            if Realistic_Radio.MainTable["RDOButtonSelect"] == 1 && (Realistic_Radio.MainTable["RDOButtonSelect"] + 1) <= #RDOSecureTable then 
                Realistic_Radio.MainTable["RDOButtonSelect"] = Realistic_Radio.MainTable["RDOButtonSelect"] + 1 
            elseif Realistic_Radio.MainTable["ScrollRadio"] < #RDOSecureTable - 2 then 
                Realistic_Radio.MainTable["ScrollRadio"] =  Realistic_Radio.MainTable["ScrollRadio"] + 1 
            end 
        end,
        [KEY_UP] = function()
            if Realistic_Radio.MainTable["RDOButtonSelect"] == 2 then 
                Realistic_Radio.MainTable["RDOButtonSelect"] = (Realistic_Radio.MainTable["RDOButtonSelect"]) - 1
            elseif Realistic_Radio.MainTable["ScrollRadio"] > 0 then 
                Realistic_Radio.MainTable["ScrollRadio"] =  Realistic_Radio.MainTable["ScrollRadio"] - 1  
            end 
        end  
    },
}

-- Get the Global Table with all Informations ( Frequency, Mute, Sound, Statut )
net.Receive("RDO:SetFrequencies", function()
	local Table = net.ReadTable()
    for k,v in pairs(Table) do
        Realistic_Radio.MainTable[k] = v 
    end 
    RDOFrequencies[0] = Table["Freq"]
    RDOFrequencies[2] = Table["Dispatch"]
end )

function Realistic_Radio.BaseFunction()
    -- BackGround Screen
    surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
    surface.SetMaterial( Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["background"] )
    surface.DrawTexturedRect( 0, 0, 500, 250 )

    if Realistic_Radio.MainTable["Statut"] then 
        if isfunction(Realistic_Radio.Application[Realistic_Radio.MainTable["Selected"]]) then 
            Realistic_Radio.Application[tonumber(Realistic_Radio.MainTable["Selected"])]() 
        end
    else 
        draw.DrawText(Realistic_Radio.GetSentence("radiooff"), "rdo_font_13", 249, 25, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
        draw.DrawText("[ "..Realistic_Radio.GetSentence("rightclick").." ]\n⦿ "..Realistic_Radio.GetSentence("turnon"), "rdo_font_7", 249, 110, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
    end 
end 

local function MainMenu()
	-- Frequencies BackGround
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.Colors["frequencies"] )
	surface.DrawTexturedRect( 0, -2, 500, 212 )

	-- Create Freq Boutton 
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.MainTable["RDOButtonSelect"] == 1 and Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["plusover"] or Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["plus"] )
	surface.DrawTexturedRect( 20, 149, 110, 60 )

	-- Join Freq Button 
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.MainTable["RDOButtonSelect"] == 2 and Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["searchover"] or Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["search"] )
	surface.DrawTexturedRect( 140, 149, 110, 60 )

	-- Turn On/Off Button 
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.MainTable["RDOButtonSelect"] == 3 and Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["quitover"] or Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["quit"])
	surface.DrawTexturedRect( 368, 149, 110, 60 )

	draw.DrawText(RDOFrequencies[0].."."..(RDOFrequencies[2] or 0), "rdo_font_1", 249, 16, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
end 

local function CreateChanel()
    if not isstring(RDOArrow) then RDOArrow = "➜" end 

    -- Play the Arrow Animation 
	RDOSpamArrow = RDOSpamArrow or CurTime()
	if RDOSpamArrow < CurTime() then 
		if RDOArrow == "➜" then RDOArrow = "" else RDOArrow = "➜" end 
		RDOSpamArrow = CurTime() + 0.5
    end 
    
	-- Chanel BackGround
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.Colors["chanelbackground"] )
	surface.DrawTexturedRect( -2, -5, 500, 236 )

	draw.DrawText(Realistic_Radio.GetSentence("createfreq"), "rdo_font_4", 250, 20, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
	draw.DrawText(RDOFrequencies[Realistic_Radio.MainTable["Selected"]]..".0", "rdo_font_2", 250, 80, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
    draw.DrawText(TableText[1].." "..TableText[2].." "..TableText[3].." "..TableText[4], "rdo_font_5", 210, 155, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)

    if Realistic_Radio.MainTable["RDOButtonSelect"] == 1 then 
	    draw.DrawText(RDOArrow, "rdo_font_2", 80, 80, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
    elseif Realistic_Radio.MainTable["RDOButtonSelect"] == 2 then 
	    draw.DrawText(RDOArrow, "rdo_font_3", 110, 155, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
    end 

	-- Join Freq Button 
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.MainTable["RDOButtonSelect"] == 3 and Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["plusover"] or Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["plus"] )
	surface.DrawTexturedRect( 378, 155, 100, 55 )
end

local function PlaySoundRadio()
    RDOSound = CreateSound(LocalPlayer(), "rdo_sound/rdo_sound_radio01.wav" )
    RDOSound:Play()
    RDOSound:ChangeVolume(1, 1)
end 

local function JoinSecureFrequency()
    if not istable(RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"]]) or not IsValid(RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"]]["Owner"]) then 
        Realistic_Radio.MainTable["Selected"] = 0 
        Realistic_Radio.MainTable["RDOButtonSelect"] = 1
    end
    if not isstring(RDOArrow) then RDOArrow = "➜" end 

    -- Play the Arrow Animation 
	RDOSpamArrow = RDOSpamArrow or CurTime()
	if RDOSpamArrow < CurTime() then 
		if RDOArrow == "➜" then RDOArrow = "" else RDOArrow = "➜" end 
		RDOSpamArrow = CurTime() + 0.5
    end 

	-- Chanel BackGround
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.Colors["generaltext"] )
	surface.DrawTexturedRect( -2, -5, 500, 236 )
 
    surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
    surface.SetMaterial( Realistic_Radio.Colors["listplayer"] )
    surface.DrawTexturedRect( 20, 90, 460, 55 )

    draw.DrawText(Realistic_Radio.GetSentence("joinfreq"), "rdo_font_4", 250, 20, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
    draw.DrawText("⦿ "..Realistic_Radio.GetSentence("insertpassword"), "rdo_font_7", 245, 155, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)

    draw.DrawText(RDOArrow, "rdo_font_4", 140, 90, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
    draw.DrawText(TableText[1].." "..TableText[2].." "..TableText[3].." "..TableText[4], "rdo_font_6", 250, 90, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
end 

local function GetBaseFrequency()
    local TblResult = {}
    for k,v in pairs(Realistic_Radio.BaseFrequencies) do 
        if Realistic_Radio.BaseFrequencies[k]["Team"][team.GetName(LocalPlayer():Team())] then 
            TblResult[#TblResult + 1] = v 
        end 
    end 
    return TblResult
end 

net.Receive("RDO:SecureFrequencies", function()
    local RDOUint = net.ReadUInt(5)
    if RDOUint == 1 then 
        -- Get all Secure Frequencies created by all players 
        if CheckBaseFrequency() then 
            RDOSecureTable = GetBaseFrequency()
        else 
            RDOSecureTable = net.ReadTable() or {}
        end 
    elseif RDOUint == 2 then 
        -- Get all Secure Frequencies and reset the password when the player joined a secure frequency 
        RDOSecureTable = net.ReadTable() or {}
        TableText = string.ToTable("----")
        Realistic_Radio.MainTable["Selected"] = 0 
        Realistic_Radio.MainTable["RDOButtonSelect"] = 1 
        RDOFrequencies[1] = 0 
    elseif RDOUint == 3 then 
        -- Reset the password when it was wrong
        TableText = string.ToTable("----")
    elseif RDOUint == 4 then 
        -- Play the sound if you can't hear players in the frequency 
        PlaySoundRadio()
        Realistic_Radio.MainTable["CanTalk"] = false 
        timer.Create("rdo_sound", SoundDuration( "rdo_sound_radio01.wav" ), 0, function()
            PlaySoundRadio()
        end ) 
    elseif RDOUint == 5 then 
        Realistic_Radio.MainTable["CanTalk"] = true 
        Realistic_Radio.MainTable["Selected"] = 0 
        RDOSecureTable = {}
        timer.Remove("rdo_sound") 
        if RDOSound then RDOSound:Stop() end 
    end 
end )

local function ListSecureFrequency()
	surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
	surface.SetMaterial( Realistic_Radio.Colors["generaltext"] )
	surface.DrawTexturedRect( -2, -5, 500, 236 )

    draw.DrawText(Realistic_Radio.GetSentence("joinfreq"), "rdo_font_4", 250, 20, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)

    if istable(RDOSecureTable) && #RDOSecureTable > 0 then 

        for i=1, #RDOSecureTable do 
            i = i - Realistic_Radio.MainTable["ScrollRadio"]
            if i <= 2 && i > 0 then 
                surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
                surface.SetMaterial( Realistic_Radio.Colors["listplayer"] )
                surface.DrawTexturedRect( 20, 80 * ( i *0.9 ) + 10, 460, 55 )

                if IsValid(RDOSecureTable[i + Realistic_Radio.MainTable["ScrollRadio"]]["Owner"]) && RDOSecureTable[i + Realistic_Radio.MainTable["ScrollRadio"]]["Owner"] == LocalPlayer() then 
                    draw.DrawText("⦿ "..Realistic_Radio.GetSentence("yourfreq").." ( *"..(RDOSecureTable[i + Realistic_Radio.MainTable["ScrollRadio"]]["Password"] or "xxxx").."  )", "rdo_font_7", 40, 80 * ( i *0.9 ) + 15, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_LEFT)  
                else 
                    draw.DrawText("⦿ "..Realistic_Radio.GetSentence("freq").." : "..(RDOSecureTable[i + Realistic_Radio.MainTable["ScrollRadio"]]["Freq"] or RDOSecureTable[i + Realistic_Radio.MainTable["ScrollRadio"]]["Frequency"]).."."..(RDOSecureTable[i + Realistic_Radio.MainTable["ScrollRadio"]]["Dispatch"] or 0), "rdo_font_7", 40, 80 * ( i *0.9 ) + 15, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_LEFT)  
                end 
            end  
        end 
        if #RDOSecureTable >= 1 then  
            surface.SetDrawColor( Realistic_Radio.Colors["whiteg"] )
            surface.SetMaterial( Realistic_Radio.Colors["arrow"] )
            surface.DrawTexturedRect( 422, 80 * ( Realistic_Radio.MainTable["RDOButtonSelect"] *0.9 ) + 13, 48, 48 )
        end 
    else 
        draw.DrawText(Realistic_Radio.GetSentence("nothingfreq"), "rdo_font_7", 250, 110, Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
    end 
end 

-- Play a Sound when you start talking with the radio 
hook.Add("PlayerStartVoice", "RDO:PlayerStartVoice", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    
    if not ply:HasWeapon("weapon_rdo_radio") then return end 
    if not Realistic_Radio.MainTable["CanTalk"] or not Realistic_Radio.MainTable["Statut"] then return end 
    if not istable(RDOPlayersSound) then RDOPlayersSound = {} end 
    if not istable(RDOPlayersSound[Realistic_Radio.MainTable["Freq"]]) then RDOPlayersSound[Realistic_Radio.MainTable["Freq"]] = {} end 
    if tonumber(Realistic_Radio.MainTable["Freq"]) == 0 then return end 

    if not Realistic_Radio.MainTable["Mute"] then 
        if not Realistic_Radio.MainTable["StopSound"] or ( ply == LocalPlayer() && Realistic_Radio.GetFrequency(ply) == Realistic_Radio.GetFrequency(LocalPlayer())) then     
            RDOSoundOn = CreateSound(LocalPlayer(), "rdo_sound/mic_click_self_on.wav" )
            RDOSoundOn:Play()
            RDOSoundOn:ChangeVolume(1, 0.05)
        end 
    end 
    if not table.HasValue(RDOPlayersSound[Realistic_Radio.MainTable["Freq"]], ply) then 
        if ply == LocalPlayer() && not Realistic_Radio.MainTable["Mute"] && Realistic_Radio.GetFrequency(ply) == Realistic_Radio.GetFrequency(LocalPlayer()) then 
            RDOPlayersSound[Realistic_Radio.MainTable["Freq"]][#RDOPlayersSound[Realistic_Radio.MainTable["Freq"]] + 1] = ply
        elseif ply != LocalPlayer() && Realistic_Radio.GetFrequency(ply) == Realistic_Radio.GetFrequency(LocalPlayer()) then
            RDOPlayersSound[Realistic_Radio.MainTable["Freq"]][#RDOPlayersSound[Realistic_Radio.MainTable["Freq"]] + 1] = ply
        end 
    end 
end )

-- Play a Sound when you stop talking with the radio 
hook.Add("PlayerEndVoice", "RDOPlayerEndVoice", function(ply) 
    if not ply:HasWeapon("weapon_rdo_radio") then return end 
    if not Realistic_Radio.MainTable["CanTalk"] or not Realistic_Radio.MainTable["Statut"] then return end 
    if not istable(RDOPlayersSound) then RDOPlayersSound = {} end 
    if not istable(RDOPlayersSound[Realistic_Radio.MainTable["Freq"]]) then RDOPlayersSound[Realistic_Radio.MainTable["Freq"]] = {} end 
    if tonumber(Realistic_Radio.MainTable["Freq"]) == 0 then return end 

    if table.HasValue(RDOPlayersSound[Realistic_Radio.MainTable["Freq"]], ply) then 
        table.RemoveByValue(RDOPlayersSound[Realistic_Radio.MainTable["Freq"]], ply)
        ply.LerpTalk = 0
    end 
    if not Realistic_Radio.MainTable["Mute"] then 
        if not Realistic_Radio.MainTable["StopSound"] or ply == LocalPlayer() && Realistic_Radio.GetFrequency(ply) == Realistic_Radio.GetFrequency(LocalPlayer()) then 
            RDOSoundOff = CreateSound(LocalPlayer(), "rdo_sound/mic_click_self_off.wav" )
            RDOSoundOff:Play()
            RDOSoundOff:ChangeVolume(1, 0.1)
        end 
    end 
end )

 /* 76561198080077264 */
-- Remove the scroll when you manipulate the radio
hook.Add("PlayerBindPress", "RDO:PlayerBindPress2", function(pPlayer, sBind, bPressed)
    if not LocalPlayer():HasWeapon("weapon_rdo_radio") then return end 
    if IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():IsWeapon() && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_rdo_radio" && LocalPlayer():GetActiveWeapon():GetNWBool("rdo_manipulate") then  
        if sBind == "invnext" or sBind == "invprev" then  
            return true 
        end 
    end 
end )

-- Set frequency when you scroll with your mouse
hook.Add("InputMouseApply", "RDO:InputMouseApply", function(cmd)
    if not Realistic_Radio.MainTable["Statut"] then return end 
    if not LocalPlayer():HasWeapon("weapon_rdo_radio") then return end 

	RDOAntiSpam = RDOAntiSpam or CurTime()
	if RDOAntiSpam > CurTime() then return end 
    RDOAntiSpam = CurTime() + 0.015

    if LocalPlayer():GetActiveWeapon():GetNWBool("rdo_manipulate") then 
        if cmd:GetMouseWheel() == -1 or cmd:GetMouseWheel() == 1 then 
            if not CheckBaseFrequency() then 
                local RDOFreq = RDOFrequencies[Realistic_Radio.MainTable["Selected"]] + cmd:GetMouseWheel() 
                if RDOFreq >= 0 && RDOFreq <= Realistic_Radio.MaxFrequencies then
                    RDOFrequencies[Realistic_Radio.MainTable["Selected"]] = RDOFreq
                end 
            else 
                if RDOFrequencies[2] + cmd:GetMouseWheel() >= 0 && RDOFrequencies[2] + cmd:GetMouseWheel() <= 9 then 
                    RDOFrequencies[2] = RDOFrequencies[2] + cmd:GetMouseWheel()
                end 
            end 
            LocalPlayer():GetActiveWeapon():SendWeaponAnim(ACT_VM_DRAW_DEPLOYED)
            -- Timer for send only one time the information 
            if Realistic_Radio.MainTable["Selected"] == 0 then 
                timer.Create("rdo_radio_freqencies", 0.5, 1, function()
                    if timer.Exists("rdo_sound") then timer.Remove("rdo_sound") end 
                    if RDOSound then RDOSound:Stop() end  
                    Realistic_Radio.MainTable["CanTalk"] = true 
                    net.Start("RDO:SetFrequencies")
                        net.WriteUInt(1, 5)
                        net.WriteUInt(RDOFrequencies[Realistic_Radio.MainTable["Selected"]], 32)
                        net.WriteUInt((RDOFrequencies[2] or 0), 32)
                    net.SendToServer()
                end )
            end 
        end 
	end 
end)

-- This hook permit to use the menu && enter number with keys
hook.Add( "PlayerButtonDown", "RDO:PlayerButtonDown", function( ply, b )
    if not Realistic_Radio.MainTable["Statut"] then return end 
    if not LocalPlayer():HasWeapon("weapon_rdo_radio") then return end 
    if not isnumber(RDOId) then RDOId = 0 end 

    -- Change Settings Mute / StopSound / Turn On or Off the radio 
    if b == tonumber(Realistic_Radio.MainTable["KeyMuteMicro"]) or b == tonumber(Realistic_Radio.MainTable["KeyMuteSound"]) then

        RDOAntiSpam = RDOAntiSpam or CurTime()
        if RDOAntiSpam > CurTime() then return end 
        RDOAntiSpam = CurTime() + 0.001
        
        surface.PlaySound( "UI/buttonclick.wav" )
        net.Start("RDO:SetFrequencies")
            net.WriteUInt(2, 5)
            net.WriteString(b == tonumber(Realistic_Radio.MainTable["KeyMuteMicro"]) and "Mute" or b == tonumber(Realistic_Radio.MainTable["KeyMuteSound"]) and "StopSound")
        net.SendToServer()
    end 

    if LocalPlayer():GetActiveWeapon():GetNWBool("rdo_manipulate") then 
        RDOAntiSpam = RDOAntiSpam or CurTime()
        if RDOAntiSpam > CurTime() then return end 
        RDOAntiSpam = CurTime() + 0.001
        
        if istable(RDOButtonFunction[Realistic_Radio.MainTable["Selected"]]) && isfunction(RDOButtonFunction[Realistic_Radio.MainTable["Selected"]][b]) then 
            RDOButtonFunction[Realistic_Radio.MainTable["Selected"]][b]() 
        end 
        -- Write a Number / Remove a number of the password 
        if Realistic_Radio.MainTable["Selected"] == 1 or Realistic_Radio.MainTable["Selected"] == 3 then 
            if Realistic_Radio.MainTable["RDOButtonSelect"] == 2 or Realistic_Radio.MainTable["Selected"] == 3 then 
                if isnumber(Realistic_Radio.NumberKey[b]) then 
                    -- Replace the First Character by the number 
                    for i=1, #TableText do 
                        if TableText[i] == "-" then 
                            TableText[i] = Realistic_Radio.NumberKey[b]
                            break 
                        end 
                    end 
                    -- Join the secure chanel when you have write the 4 numbers
                    if Realistic_Radio.MainTable["Selected"] == 3 && TableText[1] != "-" && TableText[2] != "-" && TableText[3] != "-" && TableText[4] != "-" then 
                        if istable(RDOSecureTable) && IsValid(RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"] + Realistic_Radio.MainTable["ScrollRadio"]]["Owner"]) then
                            net.Start("RDO:SecureFrequencies")
                                net.WriteUInt(2, 5)
                                net.WriteEntity(RDOSecureTable[Realistic_Radio.MainTable["RDOButtonSelect"] + Realistic_Radio.MainTable["ScrollRadio"]]["Owner"])
                                net.WriteString(TableText[1]..TableText[2]..TableText[3]..TableText[4])
                            net.SendToServer()
                        end 
                    end 

                elseif b == KEY_BACKSPACE then 
                    -- Remove one Numbers of the Password
                    RDOId = 0 
                    for i=0, 4 do 
                        if TableText[4-i] != "-" then 
                            TableText[4-i] = "-"
                            RDOId = RDOId + 1 
                            if RDOId == 4 then 
                                timer.Simple(0, function()
                                    RDOId = 0 
                                end) 
                            end 
                            break 
                        end 
                    end 
                    if RDOId == 0 then 
                        if Realistic_Radio.MainTable["Selected"] == 3 then 
                            Realistic_Radio.MainTable["Selected"] = 2
                        else 
                            RDOFrequencies[1] = 0 
                            Realistic_Radio.MainTable["Selected"] = 0
                            Realistic_Radio.MainTable["RDOButtonSelect"] = 1 
                        end 
                    end 
                end
            end 
        end 

        -- Write a number for choose the frequency 
        if Realistic_Radio.MainTable["Selected"] == 1 then 
            if Realistic_Radio.MainTable["RDOButtonSelect"] != 1 then return end 
        end 

        if isnumber(Realistic_Radio.NumberKey[b]) then 
            LocalPlayer():GetActiveWeapon():SendWeaponAnim(ACT_VM_DRAW_DEPLOYED)
            RDOTimeRemove = RDOTimeRemove or CurTime()
            if not CheckBaseFrequency() then if RDOTimeRemove < CurTime() then RDOFrequencies[Realistic_Radio.MainTable["Selected"]] = "" end end 
            RDOTimeRemove = CurTime() + 1
            if Realistic_Radio.MainTable["Selected"] == 0 then 
                timer.Create("rdo_changefrequency", 0.1, 0, function()
                    if RDOTimeRemove < CurTime() then   
                        if timer.Exists("rdo_sound") then timer.Remove("rdo_sound") end 
                        if timer.Exists("rdo_changefrequency") then timer.Remove("rdo_changefrequency") end 
                        if RDOSound then RDOSound:Stop() end 
                        Realistic_Radio.MainTable["CanTalk"] = true
                        net.Start("RDO:SetFrequencies")
                            net.WriteUInt(1, 5)
                            net.WriteUInt(RDOFrequencies[Realistic_Radio.MainTable["Selected"]], 32)
                            net.WriteUInt((RDOFrequencies[2] or 0), 32)
                        net.SendToServer() 
                    end 
                end ) 
            end 
            if RDOFrequencies[Realistic_Radio.MainTable["Selected"]] == 0 or RDOFrequencies[Realistic_Radio.MainTable["Selected"]] == 1 then RDOFrequencies[Realistic_Radio.MainTable["Selected"]] = "" end 
            
            if not CheckBaseFrequency() then 
                if  Realistic_Radio.MainTable["Selected"] != 0 && Realistic_Radio.MainTable["Selected"] != 1 then return end 
                if isnumber(tonumber(RDOFrequencies[Realistic_Radio.MainTable["Selected"]]..Realistic_Radio.NumberKey[b])) && tonumber(RDOFrequencies[Realistic_Radio.MainTable["Selected"]]..Realistic_Radio.NumberKey[b]) <= Realistic_Radio.MaxFrequencies && tostring(RDOFrequencies[Realistic_Radio.MainTable["Selected"]]..Realistic_Radio.NumberKey[b]) != "00" then 
                    RDOFrequencies[Realistic_Radio.MainTable["Selected"]] = RDOFrequencies[Realistic_Radio.MainTable["Selected"]]..Realistic_Radio.NumberKey[b]
                end 
            else 
                RDOFrequencies[2] = Realistic_Radio.NumberKey[b]
            end 
        end 
    end 
end)

-- Show the menu for Mute / Stop Sound and see the frequency selected 
hook.Add("HUDPaint", "RDO:HUDPaint1", function()
    timer.Simple(0, function()
        hook.Add("DrawOverlay", "RDO:DrawOverlayRadio", function()
            if not Realistic_Radio.MainTable["Statut"] then return end 
            if Realistic_Radio.MainTable["HUDTurnOff"] then return end 
        
            if not LocalPlayer():HasWeapon("weapon_rdo_radio") then return end 
        
            surface.SetDrawColor( Realistic_Radio.Colors["white"] )
            surface.SetMaterial( Realistic_Radio.HUDPosition and Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["backhudleft"] or Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["backhud"] )
            surface.DrawTexturedRect(  ScrW()*Realistic_Radio.PosXY[1], ScrH()*0.004 + ScrH()*Realistic_Radio.PosXY[2], ScrW()*0.119, ScrH()*0.108 )
        
            surface.SetDrawColor( Realistic_Radio.Colors["white"] )
            surface.SetMaterial( Realistic_Radio.MainTable["Mute"] and Realistic_Radio.Colors["nomicrophone"] or Realistic_Radio.Colors["microphone"] )
            surface.DrawTexturedRect( ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.104, ScrH()*0.055 + ScrH()*Realistic_Radio.PosXY[2], ScrW()*0.0054, ScrH()*0.0157 )
        
            surface.SetDrawColor( Realistic_Radio.Colors["white"] )
            surface.SetMaterial( Realistic_Radio.MainTable["StopSound"] and Realistic_Radio.Colors["nosound"] or Realistic_Radio.Colors["sound"] )
            surface.DrawTexturedRect( ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.104, ScrH()*0.08 + ScrH()*Realistic_Radio.PosXY[2], ScrW()*0.0054, ScrH()*0.0157 )

            draw.DrawText((string.sub(Realistic_Radio.ChanelName[(Realistic_Radio.MainTable["Freq"] or 0)] or "RADIO", 1, 20)), "rdo_font_8", ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.119/2, ScrH()*0.01 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
        
            draw.DrawText(Realistic_Radio.GetSentence("freq").." : "..(Realistic_Radio.MainTable["Freq"] or 0).."."..(Realistic_Radio.MainTable["Dispatch"] or 0).." mhz", "rdo_font_8", ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.119/2, ScrH()*0.027 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["whiteg"], TEXT_ALIGN_CENTER)
        
            draw.DrawText(string.upper(string.sub(input.GetKeyName(Realistic_Radio.MainTable["KeyMuteMicro"]), 1, 1)), "rdo_font_8", ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.0153, ScrH()*0.0513 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["black"], TEXT_ALIGN_CENTER)
            draw.DrawText(Realistic_Radio.GetSentence(Realistic_Radio.MainTable["Mute"] and "unmute" or "mute"), "rdo_font_9", ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.022, ScrH()*0.053 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["white"], TEXT_ALIGN_LEFT)
        
            draw.DrawText(string.upper(string.sub(input.GetKeyName(Realistic_Radio.MainTable["KeyMuteSound"]), 1, 1)), "rdo_font_8", ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.0153, ScrH()*0.07565 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["black"], TEXT_ALIGN_CENTER)
            draw.DrawText(Realistic_Radio.GetSentence(Realistic_Radio.MainTable["StopSound"] and "offnosound" or "nosound"), "rdo_font_9", ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.022, ScrH()*0.078 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["white"], TEXT_ALIGN_LEFT)
        
            if istable(RDOPlayersSound) && istable(RDOPlayersSound[Realistic_Radio.MainTable["Freq"]]) then 
                for k,v in pairs(RDOPlayersSound[Realistic_Radio.MainTable["Freq"]]) do 
                    
                    if not IsValid(v) then continue end 
                    if not v:IsSpeaking() or not v:Alive() then RDOPlayersSound[Realistic_Radio.MainTable["Freq"]][k] = nil continue end 

                    if not Realistic_Radio.MainTable["StopSound"] or LocalPlayer() == v then 
                        
                        if not IsValid(v) then return end 
                        if not isnumber(v.LerpTalk) then v.LerpTalk = 0 end 
                        v.LerpTalk = Lerp(FrameTime()*2, v.LerpTalk, 255)
        
                        surface.SetDrawColor( Realistic_Radio.Colors["white"].r, Realistic_Radio.Colors["white"].g, Realistic_Radio.Colors["white"].b, v.LerpTalk )
                        surface.SetMaterial( Realistic_Radio.Colors[Realistic_Radio.RadioTheme][Realistic_Radio.HUDPosition and "playertalkleft" or "playertalk"] )
                        surface.DrawTexturedRect( ScrW()*Realistic_Radio.PosXY[1] + (Realistic_Radio.HUDPosition and 0 or -ScrW()*0.0155), (ScrH()*0.06*k) + ScrW()*0.033 + ScrH()*Realistic_Radio.PosXY[2], ScrW()*0.1354, ScrH()*0.050 )
        
                        if Realistic_Radio.SeePlayerName then 
                            draw.DrawText(string.sub(string.upper(v:Name()), 1, 18), "rdo_font_8", ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.035  + (Realistic_Radio.HUDPosition and 0 or -ScrW()*0.017), (ScrH()*0.06*k) + ScrH()*0.064 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["white"], TEXT_ALIGN_LEFT)
                        else 
                            draw.DrawText(LocalPlayer() == v and string.upper(v:Name()) or "************************", "rdo_font_8", ScrW()*Realistic_Radio.PosXY[1] + (Realistic_Radio.HUDPosition and 0 or -ScrW()*0.017), (ScrH()*0.06*k) + ScrH()*0.064 + ScrH()*Realistic_Radio.PosXY[2], Realistic_Radio.Colors["white"], TEXT_ALIGN_LEFT)
                        end 
        
                        v.RDOModel = v.RDOModel or vgui.Create( "ModelImage" )
                        v.RDOModel:SetSize(ScrW()*0.019,ScrW()*0.019)
                        v.RDOModel:SetPos(ScrW()*Realistic_Radio.PosXY[1] + ScrW()*0.013 + (Realistic_Radio.HUDPosition and 0 or -ScrW()*0.019), (ScrH()*0.06*k) + ScrH()*0.066  + ScrH()*Realistic_Radio.PosXY[2])
                        v.RDOModel:SetModel(v:GetModel())
                        v.RDOModel:SetPaintedManually(false)
                        v.RDOModel:PaintManual()
                        v.RDOModel:SetPaintedManually(true)	
                    end 
                end 
            end 
        end)
    end)
    timer.Remove("HUDPaint", "RDO:HUDPaint1")
end)

local function OpenOption()
    local W,H = ScrW(), ScrH()

    local Frame = vgui.Create("DFrame")
    Frame:SetSize(W*0.14, H*0.3)
    Frame:Center()
    Frame:MakePopup()
    Frame:ShowCloseButton(false)
    Frame:SetTitle("")
    Frame.Paint = function(self,w,h)
        surface.SetDrawColor( Realistic_Radio.Colors["white"] )
        surface.SetMaterial( Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["keysettingback"] )
        surface.DrawTexturedRect( 0, 0, w, h )

        draw.DrawText("Keys Settings", "rdo_font_12", w*0.05, h*0.015, Realistic_Radio.Colors["white"], TEXT_ALIGN_LEFT)

        draw.DrawText("Mute Micro Key", "rdo_font_12", w/2, h*0.14, Realistic_Radio.Colors["white"], TEXT_ALIGN_CENTER)
        draw.DrawText("Mute Sound Key", "rdo_font_12", w/2, h*0.44, Realistic_Radio.Colors["white"], TEXT_ALIGN_CENTER)

        draw.DrawText("Activate / Desactivate HUD", "rdo_font_12", w*0.14, H*0.24, Realistic_Radio.Colors["white"], TEXT_ALIGN_LEFT) 
    end 

    local Binder1 = vgui.Create( "DBinder", Frame )
    Binder1:SetSize( W*0.13, 50 )
    Binder1:SetPos( W*0.005, H*0.065 )
    Binder1:SetTextColor(Realistic_Radio.Colors["white"])
    function Binder1:OnChange( num )
        RunConsoleCommand("RDOChangeMicroKey", num)
    end
    Binder1.Paint = function(self,w,h)
        draw.RoundedBox(8, 0, 0, w, h, Color(0,0,0,100))
    end 

    local Binder2 = vgui.Create( "DBinder", Frame )
    Binder2:SetSize( W*0.13, 50 )
    Binder2:SetPos( W*0.005, H*0.155 )
    Binder2:SetTextColor(Realistic_Radio.Colors["white"])
    function Binder2:OnChange( num )
        RunConsoleCommand("RDOChangeSoundKey", num)
    end
    Binder2.Paint = function(self,w,h)
        draw.RoundedBox(8, 0, 0, w, h, Color(0,0,0,100))
    end 

    local CheckBox = vgui.Create( "DCheckBox", Frame)
    CheckBox:SetPos( W*0.007, H*0.24 ) 
    CheckBox:SetValue( true )
    function CheckBox:OnChange( num )
        RunConsoleCommand("RDOTurnOffRadio", (num and 1 or 0))
    end

    local Close = vgui.Create("DButton", Frame)
    Close:SetSize(W*0.02, W*0.02)
    Close:SetPos(Frame:GetWide()*0.85, H*-0.005)
    Close:SetText("X")
    Close:SetTextColor(Realistic_Radio.Colors["white"])
    Close:SetFont("rdo_font_8")
    Close.Paint = function() end 
    Close.DoClick = function() Frame:Remove() end 
end

net.Receive("RDO:Other", function()
    local UInt = net.ReadUInt(5)
    if UInt == 1 then 
        local String = net.ReadString()
        local Ply = net.ReadEntity()
        chat.AddText(Realistic_Radio.ColorTextFreq, Realistic_Radio.GetSentence("freq").." ["..(Realistic_Radio.MainTable["Freq"] or 0).."."..(Realistic_Radio.MainTable["Dispatch"] or 0).."] - ", Realistic_Radio.ColorTextMessage, Ply:Name().." :"..String)
    elseif UInt == 2 then 
        Realistic_Radio.TutorialMenu()
    elseif UInt == 3 then 
        OpenOption()
    end 
end )
 // 76561198080077264

-- Initialize All Applications 
Realistic_Radio.Application = {
    [0] = function()
        MainMenu()
    end,
    [1] = function()
        CreateChanel()
    end,
    [2] = function()
        ListSecureFrequency()
    end, 
    [3] = function()
        JoinSecureFrequency()
    end, 
}

local function UpdateTutorial(RDOTutorialId, DScroll)
    local RespX, RespY = ScrW(), ScrH()
    DScroll:Clear()
    for k,v in ipairs(Realistic_Radio.Tutorial[RDOTutorialId]["KeyTutorial"]) do 
        local DPanel = vgui.Create("DPanel", DScroll)
        DPanel:SetSize(0,RespY*0.078)
        DPanel:Dock(TOP)
        DPanel.Paint = function(self,w,h)
            surface.SetDrawColor( Realistic_Radio.Colors["white"] )
            surface.SetMaterial( Realistic_Radio.Colors["tutoriallign"] )
            surface.DrawTexturedRect(  0, -8, RespX*0.255, RespY*0.092 )

            surface.SetDrawColor( Realistic_Radio.Colors["white"] )
            surface.SetMaterial( v.KeyImage )
            surface.DrawTexturedRect(  RespX*0.005, RespY*0.008, RespX*0.036, RespX*0.036 )
        end 

        local Text = vgui.Create("RichText", DPanel)
		Text:SetSize(RespX*0.1565, RespX*0.035)
		Text:SetPos(RespX*0.049, RespY*0.008)
		Text:InsertColorChange(255, 255, 255, 255)
		Text:AppendText(v.Text)
		Text:SetContentAlignment(7)
        Text:SetVerticalScrollbarEnabled(false)
        function Text:PerformLayout(w, h)
			self:SetFontInternal("rdo_font_12")
		end
    end 
end 
 
function Realistic_Radio.TutorialMenu()
    local RespX, RespY = ScrW(), ScrH()
    local RDOTutorialId = 1
    if IsValid(RDOTutorialMenu) then RDOTutorialMenu:Remove() end 

    RDOTutorialMenu = vgui.Create("DFrame")
    RDOTutorialMenu:SetSize(RespX*0.26,RespY * 0.555)
    RDOTutorialMenu:Center()
    RDOTutorialMenu:SetDraggable(false)
    RDOTutorialMenu:ShowCloseButton(false)
    RDOTutorialMenu:SetTitle("")
    RDOTutorialMenu:MakePopup()
    RDOTutorialMenu.Paint = function(self,w,h)
        surface.SetDrawColor( Realistic_Radio.Colors["white"] )
        surface.SetMaterial( Realistic_Radio.Colors[Realistic_Radio.RadioTheme]["tutobackground"] )
        surface.DrawTexturedRect(  0, 0, w, h )

        surface.SetDrawColor( Realistic_Radio.Colors["white"] )
        surface.SetMaterial( Realistic_Radio.Tutorial[RDOTutorialId]["Image"] )
        surface.DrawTexturedRect(  w*0.0585, h*0.125, w*0.885, h*0.405 )

        draw.RoundedBox(8, RespX*0.021, RespY*0.02, RespX*0.215, RespY*0.035, Realistic_Radio.Colors["white24280"])
        draw.DrawText("⦿ "..Realistic_Radio.GetSentence("tutorialtitle").." ⦿", "rdo_font_11", w/2, h*0.042, Realistic_Radio.Colors["white242"], TEXT_ALIGN_CENTER)
    end 

    local DScroll = vgui.Create("DScrollPanel", RDOTutorialMenu)
    DScroll:SetSize(RespX*0.214, RespY*0.152)
    DScroll:SetPos(RespX*0.023, RespY*0.31)

    local sbar = DScroll:GetVBar()
    sbar:SetSize(RespX*0.0028, 0)
    function sbar:Paint(w, h)
        draw.RoundedBox(20, 0, 0, w, h, Realistic_Radio.Colors["black41100"])
    end
    function sbar.btnUp:Paint(w, h)
        draw.RoundedBox(20, 0, 0, w, h, Realistic_Radio.Colors["black41100"])
    end
    function sbar.btnDown:Paint(w, h)
        draw.RoundedBox(20, 0, 0, w, h, Realistic_Radio.Colors["black41100"])
    end
    function sbar.btnGrip:Paint(w, h)
        draw.RoundedBox(20, 0, 0, w, h, Realistic_Radio.Colors["white242200"])
    end

    UpdateTutorial(RDOTutorialId, DScroll)

    local ButtonBefore = vgui.Create("DButton", RDOTutorialMenu)
    ButtonBefore:SetSize(RespX*0.109, RespY*0.04)
    ButtonBefore:SetPos(RespX*0.02, RespY*0.485)
    ButtonBefore:SetText(Realistic_Radio.GetSentence("beforetutorial"))
    ButtonBefore:SetFont("rdo_font_10")
    ButtonBefore:SetTextColor(Realistic_Radio.Colors["white242"])
    ButtonBefore.Paint = function(self,w,h)
        draw.RoundedBox(8, 0, 0, w, h, Realistic_Radio.Colors["white24280"])
    end 
    ButtonBefore.DoClick = function()
        if RDOTutorialId > 1 then 
            RDOTutorialId = RDOTutorialId - 1 
            UpdateTutorial(RDOTutorialId, DScroll)
        end 
    end 

    local ButtonNext = vgui.Create("DButton", RDOTutorialMenu)
    ButtonNext:SetSize(RespX*0.109, RespY*0.04)
    ButtonNext:SetPos(RespX*0.131, RespY*0.485)
    ButtonNext:SetText(Realistic_Radio.GetSentence("nexttutorial"))
    ButtonNext:SetFont("rdo_font_10")
    ButtonNext:SetTextColor(Realistic_Radio.Colors["white242"])
    ButtonNext.Paint = function(self,w,h)
        draw.RoundedBox(8, 0, 0, w, h, Realistic_Radio.Colors["white24280"])
    end 
    ButtonNext.DoClick = function()
        if RDOTutorialId < #Realistic_Radio.Tutorial then 
            RDOTutorialId = RDOTutorialId + 1 
            UpdateTutorial(RDOTutorialId, DScroll)
        end 
    end 

    local CloseButton = vgui.Create("DButton", RDOTutorialMenu)
    CloseButton:SetSize(RespX*0.01, RespX*0.01)
    CloseButton:SetPos(RDOTutorialMenu:GetWide()*0.95, RespY*0.009)
    CloseButton:SetText("X")
    CloseButton:SetFont("rdo_font_10")
    CloseButton:SetTextColor(Realistic_Radio.Colors["white242"])
    CloseButton.DoClick = function()
        RDOTutorialMenu:Remove()
    end 
    CloseButton.Paint = function() end 
end  

local function SaveSettings()
    if not file.Exists("realistic_radio", "DATA") then 
        file.CreateDir("realistic_radio")
    end 
    local TableToWrite = {
        ["HUDTurnOff"] = Realistic_Radio.MainTable["HUDTurnOff"], 
        ["KeyMuteMicro"] = Realistic_Radio.MainTable["KeyMuteMicro"],
        ["KeyMuteSound"] = Realistic_Radio.MainTable["KeyMuteSound"], 
    }
    file.Write("realistic_radio/settings.txt", util.TableToJSON(TableToWrite, true))
end 

local function LoadSettings()
    local RDOFile = file.Read("realistic_radio/settings.txt", "DATA") or ""
    local RDOTab = util.JSONToTable(RDOFile) or {}

    if isbool(RDOTab["HUDTurnOff"]) then
        Realistic_Radio.MainTable["HUDTurnOff"] = RDOTab["HUDTurnOff"]
    end 
    if isnumber(tonumber(RDOTab["KeyMuteMicro"])) then
        Realistic_Radio.MainTable["KeyMuteMicro"] = tonumber(RDOTab["KeyMuteMicro"])
    end 
    if isnumber(tonumber(RDOTab["KeyMuteSound"])) then
        Realistic_Radio.MainTable["KeyMuteSound"] = tonumber(RDOTab["KeyMuteSound"])
    end 
end 

concommand.Add("RDOTurnOffRadio", function( ply, cmd, args )
    if tonumber(args[1]) == 0 then 
        Realistic_Radio.MainTable["HUDTurnOff"] = true 
    elseif tonumber(args[1]) == 1 then 
        Realistic_Radio.MainTable["HUDTurnOff"] = false 
    end 
    SaveSettings()
end)

concommand.Add("RDOChangeMicroKey", function( ply, cmd, args )
    if not isstring(input.GetKeyName(args[1])) then return end 
    timer.Simple(0, function()
        Realistic_Radio.MainTable["KeyMuteMicro"] = args[1]
        SaveSettings()
    end) 
end)

concommand.Add("RDOChangeSoundKey", function( ply, cmd, args )
    if not isstring(input.GetKeyName(args[1])) then return end 
    timer.Simple(0, function()
        Realistic_Radio.MainTable["KeyMuteSound"] = args[1]
        SaveSettings()
    end) 
end)

function RDOPanel(panel, test)
	panel:AddControl("checkbox", {Label = "Realistic Radio HUD", command="RDOTurnOffRadio"})
    panel:AddControl("Numpad", {Label = "Mute Micro Key", command="RDOChangeMicroKey"})
	panel:AddControl("Numpad", {Label = "Mute Sound Key", command="RDOChangeSoundKey"})
end

hook.Add("PopulateToolMenu", "RDO:PopulateToolMenu", function()
	spawnmenu.AddToolMenuOption("Options", "Realistic Radio", "Radio Key Settings", "RDO Key Settings", "", "", RDOPanel)
end)

timer.Simple(1, function()
    LoadSettings()
end )