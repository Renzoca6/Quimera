--[[
  _____            _ _     _   _        _____           _ _        
 |  __ \          | (_)   | | (_)      |  __ \         | (_)       
 | |__) |___  __ _| |_ ___| |_ _  ___  | |__) |__ _  __| |_  ___   
 |  _  // _ \/ _` | | / __| __| |/ __| |  _  // _` |/ _` | |/ _ \  
 | | \ \  __/ (_| | | \__ \ |_| | (__  | | \ \ (_| | (_| | | (_) | 
 |_|  \_\___|\__,_|_|_|___/\__|_|\___| |_|  \_\__,_|\__,_|_|\___/  
                                                                                                                                    
]]

util.AddNetworkString("RDO:SetFrequencies")
util.AddNetworkString("RDO:SecureFrequencies")
util.AddNetworkString("RDO:Other") // 76561198080077264
util.AddNetworkString("Kobralost:Notifications")

net.Receive("RDO:SetFrequencies", function(len, ply)
    ply.RDOAntiSpam = ply.RDOAntiSpam or CurTime()
    if ply.RDOAntiSpam > CurTime() then return end 
    ply.RDOAntiSpam = CurTime() + 0.1
    
    local UInt = net.ReadUInt(5)

    if UInt == 1 then 
        -- Read the Frequencies of the Radio 
        local Freq = net.ReadUInt(32)
        local Dispatch = net.ReadUInt(32)
        
        ply:RemoveSecureFrequency()
        ply:LeaveSecureFrequency()
        ply:SetFrequency(Freq, Dispatch)

    elseif UInt == 2 then 
        -- Change Settings of the Radio 
        local String = net.ReadString() 

        ply:ChangeSettings(String)
    end 
end )

net.Receive("RDO:SecureFrequencies", function(len,ply)
    ply.RDOAntiSpam = ply.RDOAntiSpam or CurTime()
    if ply.RDOAntiSpam > CurTime() then return end 
    ply.RDOAntiSpam = CurTime() + 0.1

    local UInt = net.ReadUInt(5)
    
    if UInt == 1 then 
        -- Create the Secure Frequency 
        local Freq = net.ReadUInt(32)
        local Password = net.ReadString()

        ply:CreateSecureFrequency(Freq, Password)

    elseif UInt == 2 then 
        -- Join a Secure Frequency 
        local RPlayer = net.ReadEntity()
        local Password = net.ReadString()

        ply:JoinSecureFrequency(RPlayer, Password)

    elseif UInt == 3 then 
        -- Send all secure frequencies to the player
        ply:SendPlayerSecureFreq()
    end 
end )
