--[[
  _____            _ _     _   _        _____           _ _
 |  __ \          | (_)   | | (_)      |  __ \         | (_)
 | |__) |___  __ _| |_ ___| |_ _  ___  | |__) |__ _  __| |_  ___
 |  _  // _ \/ _` | | / __| __| |/ __| |  _  // _` |/ _` | |/ _ \
 | | \ \  __/ (_| | | \__ \ |_| | (__  | | \ \ (_| | (_| | | (_) |
 |_|  \_\___|\__,_|_|_|___/\__|_|\___| |_|  \_\__,_|\__,_|_|\___/

]]

local InfosPlayers = {}
timer.Create("rdo_voicedelay", 1, 0, function()
    for k,v in pairs(player.GetAll()) do
        local Freq = (v:GetFrequencies()..v:GetDispatch())
        local CanHear = v:CanHearPlayer()

        InfosPlayers[v:SteamID64()] = {
            ["InfosFreq"] = Freq,
            ["CanTalk"] = (v:HasWeapon("weapon_rdo_radio") && Freq != 0 && v.RDOTable["Statut"] && not v.RDOTable["StopSound"] && CanHear),
            ["CanHearPlayer"] = CanHear,
        }
    end
end)

local function canHear(listener, talker)
    if not IsValid(talker) or not IsValid(listener) then return end

    local TalkerId, ListenerId = talker:SteamID64(), listener:SteamID64()
    if InfosPlayers && InfosPlayers[TalkerId] && InfosPlayers[ListenerId] && InfosPlayers[ListenerId]["CanTalk"] then
        if not talker.RDOTable["Mute"] && (InfosPlayers[ListenerId]["InfosFreq"] == InfosPlayers[TalkerId]["InfosFreq"]) && InfosPlayers[TalkerId]["CanHearPlayer"] then
            return true
        end
    end
end
hook.Add("PlayerCanHearPlayersVoice", "RDO:PlayerCanHearPlayersVoice", canHear)

local function voiceboxCanHear(listener, talker)
    if not IsValid(talker) or not IsValid(listener) then return end

    local TalkerId, ListenerId = talker:SteamID64(), listener:SteamID64()
    if InfosPlayers && InfosPlayers[TalkerId] && InfosPlayers[ListenerId] && InfosPlayers[ListenerId]["CanTalk"] then
        if not talker.RDOTable["Mute"] && (InfosPlayers[ListenerId]["InfosFreq"] == InfosPlayers[TalkerId]["InfosFreq"]) && InfosPlayers[TalkerId]["CanHearPlayer"] then
            VoiceBox.FX.IsRadioComm(listener:EntIndex(), talker:EntIndex(), not VoiceBox.FX.__PlayerCanHearPlayersVoice(listener, talker))
            return true
        end
    end

	VoiceBox.FX.IsRadioComm(listener:EntIndex(), talker:EntIndex(), false)
end
if VoiceBox && VoiceBox.FX then
	hook.Add("PlayerCanHearPlayersVoice", "RDO:PlayerCanHearPlayersVoice", voiceboxCanHear)
else
	hook.Add("VoiceBox.FX", "RDO", function()
		hook.Add("PlayerCanHearPlayersVoice", "RDO:PlayerCanHearPlayersVoice", voiceboxCanHear)
	end)
end

hook.Add("PlayerDisconnected", "RDO:PlayerDisconnected", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    ply:RemoveSecureFrequency()
    ply:LeaveSecureFrequency()
end )

hook.Add("PlayerDeath", "RDO:PlayerDeath", function(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    ply:RemoveSecureFrequency()
    ply:LeaveSecureFrequency()
    ply:SetFrequency(0,0)
end )

hook.Add( "PlayerChangedTeam", "RDO:PlayerChangedTeam", function( ply, oldTeam, newTeam )
    if not IsValid(ply) or not ply:IsPlayer() then return end

    local Freq, Dispatch = Realistic_Radio.GetBaseFrequency(team.GetName(newTeam))
    ply:RemoveSecureFrequency()
    ply:LeaveSecureFrequency()
    ply:SetFrequency(Freq, Dispatch)
 /* 76561198040894045 */

    timer.Simple(0,function()
        if not IsValid(ply) or not ply:IsPlayer() then return end
        ply:GiveRadio()
    end)
end )

hook.Add( "PlayerSpawn", "RDO:PlayerSpawn", function( ply )
    timer.Simple(0, function()
        local Freq, Dispatch = Realistic_Radio.GetBaseFrequency(team.GetName(ply:Team()))
        ply:RemoveSecureFrequency()
        ply:LeaveSecureFrequency()
        ply:SetFrequency(Freq, Dispatch)
        ply:GiveRadio()

        ply.RDOTable["Mute"] = true
    end )
end )

hook.Add("PlayerInitialSpawn", "RDO:PlayerInitialSpawn", function( ply )
    timer.Simple(10, function()
        if not IsValid(ply) or not ply:IsPlayer() then return end
        if not istable(ply.RDOTable) then ply.RDOTable = {} end
        -- Debug a litle problem with the table of the radio
        ply.RDOTable["Statut"] = true

        InfosPlayers[ply:SteamID64()] = {
            ["InfosFreq"] = 0,
            ["HasRadio"] = false,
            ["CanHearPlayer"] = false,
        }
    end )
end )

hook.Add("PlayerSay", "RDO:PlayerSay", function( ply, text )
    local String = string.Explode(" ", text)
	if String[1] == Realistic_Radio.CommandChat && ply:CanHearPlayer(ply:GetFrequencies()) && ply:HasWeapon("weapon_rdo_radio") && tonumber(ply:GetFrequencies()..ply:GetDispatch()) != 0 then
        for k,v in pairs(player.GetAll()) do
            if v:CanHearPlayer(v:GetFrequencies()) && tonumber(v:GetFrequencies()..v:GetDispatch()) == tonumber(ply:GetFrequencies()..ply:GetDispatch()) then
                net.Start("RDO:Other")
                    net.WriteUInt(1, 5)
                    net.WriteString(string.Replace(text, Realistic_Radio.CommandChat, ""))
                    net.WriteEntity(ply)
                net.Send(v)
            end
        end
        return ""
    elseif String[1] == Realistic_Radio.CommandTutorial then
        net.Start("RDO:Other")
            net.WriteUInt(2, 5)
        net.Send(ply)
        return ""
    elseif String[1] == Realistic_Radio.KeysCommand then
        net.Start("RDO:Other")
            net.WriteUInt(3, 5)
        net.Send(ply)
        return ""
	end
 -- 76561198040894045
end)