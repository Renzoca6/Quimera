    --[[
        Coded by: ted.lua (http://steamcommunity.com/id/tedlua/)
        Created for: ExhibitionRP - Donation Box for bums.
    ]]

    AddCSLuaFile()

    ENT.Base = "base_gmodentity"
    ENT.Type = "anim"

    ENT.Category		= "ted.lua"
    ENT.Spawnable		= false

    ENT.PrintName		= "Base Entity"
    ENT.Author			= "ted.lua"
    ENT.Purpose			= ""
    ENT.Instructions	= ""

    if CLIENT then
    	function ENT:Draw()
    	    self:DrawModel()
    	end
    else
        function ENT:Initialize()
            self:SetModel( "" )
            self:PhysicsInit( SOLID_VPHYSICS )
            self:SetMoveType( MOVETYPE_VPHYSICS )
            self:SetSolid( SOLID_VPHYSICS )
            --self:SetRenderFX( kRenderFxSolidFast )
            self:SetUseType( SIMPLE_USE )
            local phys = self:GetPhysicsObject()
            if phys:IsValid() then phys:Wake() end
        end
    end
