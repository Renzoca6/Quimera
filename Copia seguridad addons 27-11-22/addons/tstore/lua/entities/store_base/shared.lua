    
    ENT.Base = "base_ai"
    ENT.Type = "ai"
    ENT.AutomaticFrameAdvance = true
    ENT.PrintName = "Store Base"
    ENT.Author = "ted.lua"
    ENT.Category = "ted.lua"
    ENT.Instructions = ""
    ENT.Spawnable = false
    ENT.AdminSpawnable = false

    function ENT:SetAutomaticFrameAdvance( npcAnimate ) -- This is called by the game to tell the entity if it should animate itself. 76561198058539108
        self.AutomaticFrameAdvance = npcAnimate
    end

    function ENT:SetStoreID( id )
        self.tStore_ID_Trace = id
    end 

    function ENT:GetStoreID()
        return self.tStore_ID_Trace
    end