    if not SERVER then return end
    
    AddCSLuaFile( "cl_init.lua" )
    AddCSLuaFile( "shared.lua" )
    include( 'shared.lua' )

    function ENT:SetStoreName( name ) self.my_store_name = name end

    function ENT:Initialize()
        --self:SetModel( 'models/Humans/Group03m/Male_04.mdl' )
        self:SetHullType( HULL_HUMAN )
        self:SetUseType( SIMPLE_USE )
        self:SetHullSizeNormal()
        self:SetNPCState(NPC_STATE_SCRIPT)
        self:SetSolid( SOLID_BBOX)
        self:SetMaxYawSpeed(90)
        self:SetCollisionGroup( COLLISION_GROUP_NONE )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then phys:Wake() end
    end

    util.AddNetworkString( 'StoreHandler.Send.StoreItems' )
    function ENT:AcceptInput( name, activator, caller )
        if activator:IsPlayer() then
            if activator:GetPos():Distance( self:GetPos() ) < 80 then
                local id = self.store_id
                if not StoreHandler.NPCs[ id ] then return end
                if StoreHandler.NPCs[ id ].restricted_to and not StoreHandler.NPCs[ id ].restricted_to[ activator:GetUserGroup() ] then
                    StoreHandler.SendMessage( activator, 'You do not have permission to use this store.' )
                    return
                end
                if StoreHandler.NPCs[ id ].job_restrictions and not StoreHandler.NPCs[ id ].job_restrictions[ team.GetName( activator:Team() ) ] then
                    StoreHandler.SendMessage( activator, 'Your job can not use this store.' )
                    return
                end
                net.Start( 'StoreHandler.Send.StoreItems' )
                    net.WriteTable( StoreHandler.FeatureManager[ id ] )
                    net.WriteString( id )
                    net.WriteTable( StoreHandler.Saves[ activator:SteamID() ] or {} )
                net.Send( activator )
                activator.tstore_last_id = id
            end
        end
    end


    