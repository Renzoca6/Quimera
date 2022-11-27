    if not CLIENT then return end
    
    include( "shared.lua" )
    
    surface.CreateFont( "Store.Font.Header", { font = "BFHUD", size = 82, weight = 800, bold = true } )
    local v = Vector()

    function ENT:Initialize()
        self.overhead = 'Shop'
        net.Start( 'StoreHandler.Send.EntStore' )
            net.WriteEntity( self )
        net.SendToServer()
    end

    net.Receive( 'StoreHandler.Send.EntStore', function() 
        local overhead = net.ReadString() 
        local store = net.ReadEntity()
        store.overhead = overhead
    end )

    function ENT:Draw()
        self:DrawModel()
        v.z = math.sin( CurTime() ) * 50
        if LocalPlayer():GetPos():Distance( self:GetPos() ) < 500 then
            local ang = self:GetAngles()
            ang:RotateAroundAxis(self:GetAngles():Right(), 90)
            ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
            cam.Start3D2D(self:GetPos() + ang:Up(), Angle(0, LocalPlayer():EyeAngles().y - 90, 90), 0.1)
                StoreHandler.DrawRect( v.x - 250, ( v.z / 2 ) - 880, 500, 130, Color( 22, 22, 22, 255 ) )
                StoreHandler.DrawOutline( v.x - 250, ( v.z / 2 ) - 880, 500, 130, 4, Color( 72, 61, 139 ) )
                StoreHandler.DrawText( self.overhead, "Store.Font.Header", -10, ( v.z / 2 ) - 860, Color( 255, 255, 255 ) )
            cam.End3D2D()
        end
    end