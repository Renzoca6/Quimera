--[[
  _____            _ _     _   _        _____           _ _        
 |  __ \          | (_)   | | (_)      |  __ \         | (_)       
 | |__) |___  __ _| |_ ___| |_ _  ___  | |__) |__ _  __| |_  ___   
 |  _  // _ \/ _` | | / __| __| |/ __| |  _  // _` |/ _` | |/ _ \  
 | | \ \  __/ (_| | | \__ \ |_| | (__  | | \ \ (_| | (_| | | (_) | 
 |_|  \_\___|\__,_|_|_|___/\__|_|\___| |_|  \_\__,_|\__,_|_|\___/  
                                                                                                                                    
]]

Realistic_Radio = Realistic_Radio or {}
Realistic_Radio.BaseFrequencies = Realistic_Radio.BaseFrequencies or {}

Realistic_Radio.Lang = "en" -- Langage of the Addon ( en, fr, pl, tr, ru, cn, de )

Realistic_Radio.RadioTheme = "darktheme" -- Theme of the Radio ( darktheme / lighttheme )

Realistic_Radio.MaxFrequencies = 999 -- Max frequencies

Realistic_Radio.UseCustomNotify = true -- Do you want to use custom Notify 

Realistic_Radio.MaxSecureFrequency = 50 -- Max Secure frequency for all player

Realistic_Radio.SeePlayerName = true -- Can see player name when a person talk 

Realistic_Radio.KeyMute = KEY_P -- This is the key for mute your microphone

Realistic_Radio.KeyNoSound = KEY_G -- This is the key for mute the sound

Realistic_Radio.CommandChat = "/r" -- The command for talk on the chat in the frequency

Realistic_Radio.CommandTutorial = "/rdo" -- The command for open the tutorial menu of the radio 

Realistic_Radio.KeysCommand = "/rdokeys" -- Command for open the keys settings 

Realistic_Radio.ColorTextFreq = Color(231, 76, 60) -- Color of the Start of the text 

Realistic_Radio.ColorTextMessage = Color(211, 84, 0) -- Color of the message 

Realistic_Radio.PosXY = {0.88, 0} -- Position X, Y of the menu 

Realistic_Radio.HUDPosition = false -- true == left or false ==right rotation 

Realistic_Radio.ChanelName = {
    [911] = "Civil Protection", 
}

Realistic_Radio.SecureFrequencyChange = false -- Enable people in base frequencies can switch to standar frequencies

Realistic_Radio.BaseFrequencies[1] = { -- You can create a base frequency for a job 
    ["Frequency"] = 911, 
    ["Dispatch"] = 1, 
    ["Team"] = {
        ["Civil Protection"] = true,
        ["Civil Protection Chief"] = true, 
    }
}

-- Realistic_Radio.BaseFrequencies[2] = { -- You can create a base frequency for a job 
--     ["Frequency"] = 10, 
--     ["Dispatch"] = 0, 
--     ["Team"] = {
--         ["Civil Protection"] = true,
--         ["Civil Protection Chief"] = true,
--     }
-- }
