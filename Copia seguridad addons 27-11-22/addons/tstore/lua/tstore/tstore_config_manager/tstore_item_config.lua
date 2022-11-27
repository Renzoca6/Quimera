    --[[

        I STRONGLY suggest you watch the video before creating anything. Video: https://www.youtube.com/watch?v=U21puENDU7g
        PLEASE READ adding_items_explained.txt IF YOU DO NOT UNDERSTAND HOW TO EDIT/CREATE ITEMS.

        For Job Restrictions, read the .txt file(s) as I can't add it to the video.

        Item Colors:
        colors = { foreground = Color( 56, 146, 172 ), outline = Color( 68, 213, 255 ) } -- Blue
        colors = { foreground = Color( 113, 57, 156 ), outline = Color( 174, 68, 255 ) } -- Purple
        colors = { foreground = Color( 84, 172, 56 ), outline = Color( 113, 255, 68 ) } -- Green
        colors = { foreground = Color( 255, 77, 77 ), outline = Color( 255, 56, 56 ) } -- Red
        colors = { foreground = Color( 149, 165, 166 ), outline = Color( 127, 140, 141 ) } -- Grey

        Creating an Item Template:

        StoreHandler.AddItem( '', {
            id = 1,
            name = '',
            ent = '',
            model = '',
            colors = { foreground = Color( 113, 57, 156 ), outline = Color( 174, 68, 255 ) },
            description = "",
            price = 750000,
            page = 'Weapons',
            properties = { 
                permanent_item = false, type = 'Weapon',
                main_fov = 15, can_feature = false, force_set_feature = false
            },
            restricted_to = {}, -- Delete this if you don't want to restrict via usergroups.
            job_restrictions = {} -- Delete this if you don't want to restrict via jobs.
        } )
    ]]
     
	-- TIENDA HEAVY
  	StoreHandler.AddItem( 'tienda_general', {
        id = 1,
        name = 'Lanzallamas',
        ent = 'mexican_flamerv2',
        model = 'models/servius/starwars/cwa/flamethrower.mdl',
        colors = { foreground = Color(255, 127, 0), outline = Color(255, 127, 0) },
        description = "Lanzallamas.",
        price = 450000,
        page = 'Heavy',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = true, force_set_feature = false
        }
	} )

  	StoreHandler.AddItem( 'tienda_general', {
        id = 2,
        name= 'Z-6',
        ent = 'rw_sw_z6',
        model = 'models/sw_battlefront/weapons/z6_rotary_cannon.mdl',
        colors = { foreground = Color(255, 127, 0), outline = Color(255, 127, 0) },
        description = "Z-6.",
        price = 350000,
        page = 'Heavy',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )

  	StoreHandler.AddItem( 'tienda_general', {
        id = 3,
        name = 'DP-23',
        ent = 'rw_sw_dp23',
        model = 'models/cs574/weapons/dp23.mdl',
        colors = { foreground = Color(255, 127, 0), outline = Color(255, 127, 0) },
        description = "DP-23.",
        price = 320000,
        page = 'Heavy',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
  	StoreHandler.AddItem( 'tienda_general', {
        id = 4,
        name = 'Granada Incendiaria',
        ent = 'rw_sw_nade_incendiary',
        model = 'models/weapons/tfa_starwars/w_incendiary.mdl',
        colors = { foreground = Color(255, 127, 0), outline = Color(255, 127, 0) },
        description = "Granada Incendiaria.",
        price = 500,
        page = 'Heavy',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
  	StoreHandler.AddItem( 'tienda_general', {
        id = 6456,
        name = 'Revolver D-10',
        ent = 'tfa_swch_de10',
        model = 'models/weapons/w_de10.mdl',
        colors = { foreground = Color(255, 127, 0), outline = Color(255, 127, 0) },
        description = "Revolver D-10.",
        price = 100000,
        page = 'Heavy',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
  	StoreHandler.AddItem( 'tienda_general', {
        id = 45676,
        name = 'Lanzamisiles RPS-6',
        ent = 'rw_sw_rps6',
        model = 'models/rps6/zl_rps-6.mdl',
        colors = { foreground = Color(255, 127, 0), outline = Color(255, 127, 0) },
        description = "Lanzamisiles RPS-6.",
        price = 600000,
        page = 'Heavy',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
  	StoreHandler.AddItem( 'tienda_general', {
        id = 34567,
        name = 'Escopeta Republicana',
        ent = 'tfa_sw_repshot',
        model = 'models/swbf3/rep/shotgun.mdl',
        colors = { foreground = Color(255, 127, 0), outline = Color(255, 127, 0) },
        description = "Escopeta Republicana.",
        price = 450000,
        page = 'Heavy',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )


	--Tienda Asalto
  	StoreHandler.AddItem( 'tienda_general', {
        id = 5,
        name = 'DC-15A',
        ent = 'rw_sw_dc15a_o',
        model = 'models/sw_battlefront/weapons/dc15a_rifle.mdl',
        colors = { foreground = Color(231, 46, 44), outline = Color(231, 46, 44) },
        description = "DC-15A.",
        price = 300000,
        page = 'Asalto',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
  	StoreHandler.AddItem( 'tienda_general', {
        id = 6,
        name = 'DC-15SE',
        ent = 'rw_sw_dc15se	',
        model = 'models/cs574/weapons/dc15se.mdl',
        colors = { foreground = Color(231, 46, 44), outline = Color(231, 46, 44) },
        description = "DC-15SE.",
        price = 250000,
        page = 'Asalto',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
  	StoreHandler.AddItem( 'tienda_general', {
        id = 7,
        name = 'DC-15LE',
        ent = 'rw_sw_dc15le_o',
        model = 'models/weapons/w_dc15a.mdl',
        colors = { foreground = Color(231, 46, 44), outline = Color(231, 46, 44) },
        description = "DC-15LE.",
        price = 350000,
        page = 'Asalto',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
  	StoreHandler.AddItem( 'tienda_general', {
        id = 8,
        name = 'Granada Thermal',
        ent = 'rw_sw_nade_thermal',
        model = 'models/weapons/tfa_starwars/w_thermal.mdl',
        colors = { foreground = Color(231, 46, 44), outline = Color(231, 46, 44) },
        description = "Granada Thermal.",
        price = 500,
        page = 'Asalto',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
	--Tienda Medico
	  	StoreHandler.AddItem( 'tienda_general', {
        id = 9,
        name = 'DP-23',
        ent = 'rw_sw_dp23',
        model = 'models/cs574/weapons/dp23.mdl',
        colors = { foreground = Color(44, 137, 231), outline = Color(44, 137, 231) },
        description = "DP-23.",
        price = 320000,
        page = 'Medico',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
	
	  	StoreHandler.AddItem( 'tienda_general', {
        id = 10,
        name = 'Escudo DC-15S',
        ent = 'rw_sw_shield_rep_dc15s',
        model = 'models/cs574/weapons/shields/blast_shield.mdl',
        colors = { foreground = Color(44, 137, 231), outline = Color(44, 137, 231) },
        description = "Escudo DC-15S.",
        price = 550000,
        page = 'Medico',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = true, force_set_feature = false
        }
   } )

	  	StoreHandler.AddItem( 'tienda_general', {
        id = 11,
        name = 'Pistola De Bacta',
        ent = 'st_stim_pistol',
        model = 'models/niksacokica/equipment/eqp_stimpack_empty.mdl',
        colors = { foreground = Color(44, 137, 231), outline = Color(44, 137, 231) },
        description = "Pistola De Bacta.",
        price = 150000,
        page = 'Medico',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )

	  	StoreHandler.AddItem( 'tienda_general', {
        id = 12,
        name = 'Granada De Bacta',
        ent = 'rw_sw_nade_bacta',
        model = 'models/forrezzur/bactagrenade.mdl',
        colors = { foreground = Color(44, 137, 231), outline = Color(44, 137, 231) },
        description = "Granada De Bacta.",
        price = 10000,
        page = 'Medico',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
	  	
		StoreHandler.AddItem( 'tienda_general', {
        id = 76846,
        name = 'CR2-c',
        ent = 'rw_sw_cr2c',
        model = 'models/sw_battlefront/weapons/cr2_pistol.mdl',
        colors = { foreground = Color(44, 137, 231), outline = Color(44, 137, 231) },
        description = "CR2-c.",
        price = 280000,
        page = 'Medico',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
		
   } )
	  	StoreHandler.AddItem( 'tienda_general', {
        id = 64568,
        name = 'Lanzagranadas G-6',
        ent = 'rw_sw_pinglauncher',
        model = 'models/sw_battlefront/weapons/pinglauncher.mdl',
        colors = { foreground = Color(44, 137, 231), outline = Color(44, 137, 231) },
        description = "Lanzagranadas G-6.",
        price = 400000,
        page = 'Medico',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
	  	StoreHandler.AddItem( 'tienda_general', {
        id = 43396,
        name = 'DC-15MD',
        ent = 'magma_sw_dc15a_pompe',
        model = 'models/weapons/eabf2/npc/dc15a.mdl',
        colors = { foreground = Color(44, 137, 231), outline = Color(44, 137, 231) },
        description = "DC-15MD.",
        price = 500000,
        page = 'Medico',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )

	--Recon
	
	  	StoreHandler.AddItem( 'tienda_general', {
        id = 13,
        name = 'DC-19',
        ent = 'rw_sw_dc19',
        model = 'models/weapons/w_dc15s.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "DC-19.",
        price = 300000,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
	  	
		StoreHandler.AddItem( 'tienda_general', {
        id = 14,
        name = 'Valken-38x',
        ent = 'rw_sw_valken38x',
        model = 'models/sw_battlefront/weapons/valken_38x.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "Valken-38x.",
        price = 350000,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 15,
        name = 'NT-242C',
        ent = 'rw_sw_nt242c',
        model = 'models/sw_battlefront/weapons/nt242_longblaster.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "La mata monos.",
        price = 600000,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = true, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 16,
        name = 'Grana De Humo',
        ent = 'rw_sw_nade_smoke',
        model = 'models/weapons/tfa_starwars/w_smoke.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "Grana De Humo.",
        price = 500,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )

		StoreHandler.AddItem( 'tienda_general', {
        id = 73412,
        name = 'Pistola DL-44',
        ent = 'rw_sw_dl44',
        model = 'models/weapons/w_dl44.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "Pistola DL-44.",
        price = 100000,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )

		StoreHandler.AddItem( 'tienda_general', {
        id = 97165,
        name = 'UZ-17',
        ent = 'rw_sw_dc17s',
        model = 'models/fisher/dc17s/dc17s.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "UZ-17.",
        price = 250000,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		
		StoreHandler.AddItem( 'tienda_general', {
        id = 123948,
        name = 'Ballesta T-41',
        ent = 'rw_sw_bowcaster',
        model = 'models/swbf3/outerrim/weapons/bowcaster.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "Ballesta T-41.",
        price = 450000,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 92654,
        name = 'Gancho',
        ent = 'realistic_hook',
        model = 'models/weapons/w_alyx_gun.mdl',
        colors = { foreground = Color(117, 231, 44), outline = Color(117, 231, 44) },
        description = "Gancho.",
        price = 100000,
        page = 'Recon',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )

 	

	--vip
		StoreHandler.AddItem( 'tienda_general', {
        id = 17,
        name = 'Cruzar Brazos Adelante',
        ent = 'cross_arms_infront_swep',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Cruzar Brazos Adelante.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 18,
        name = 'Cruzar Brazos Atras',
        ent = 'cross_arms_swep',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Cruzar Brazos Atras.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 19,
        name = 'Choca Los Cinco',
        ent = 'high_five_swep',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Choca Los Cinco.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 20,
        name = 'Inserción Tactica',
        ent = 'seal6-tac-insert',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Inserción Tactica.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 21,
        name = 'Dedo Del Medio',
        ent = 'middlefinger_animation_swep',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Dedo Del Medio.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 22,
        name = 'Apuntar',
        ent = 'point_in_direction_swep',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Apuntar.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 23,
        name = 'Gestos / Bailes',
        ent = 'keys',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Gestos / Bailes.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 24,
        name = 'Pensativo',
        ent = 'think_arms_swep',
        model = 'models/props/cs_assault/money.mdl',
        colors = { foreground = Color(255, 233, 0), outline = Color(255, 233, 0) },
        description = "Pensativo.",
        price = 10000000,
        page = 'VIP',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		--Republic Comando
		StoreHandler.AddItem( 'tienda_general', {
        id = 25,
        name = 'DC-15SA Mejorada',
        ent = 'tfa_swch_dc15sa',
        model = 'models/weapons/w_dc15sa.mdl',
        colors = { foreground = Color(163, 73, 164), outline = Color(163, 73, 164) },
        description = "DC-15SA Mejorada.",
        price = 250000,
        page = 'Republic Comando',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 26,
        name = 'DC-17m Mejorada',
        ent = 'at_sw_dc17m',
        model = 'models/cs574/dc17m/dc17m_base.mdl',
        colors = { foreground = Color(163, 73, 164), outline = Color(163, 73, 164) },
        description = "DC-17m Mejorada.",
        price = 350000,
        page = 'Republic Comando',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )
		StoreHandler.AddItem( 'tienda_general', {
        id = 27,
        name = 'Gancho Tactico',
        ent = 'realistic_hook',
        model = 'models/weapons/w_alyx_gun.mdl',
        colors = { foreground = Color(163, 73, 164), outline = Color(163, 73, 164) },
        description = "DC-17m Mejorada.",
        price = 100000,
        page = 'Republic Comando',
        properties = { 
            permanent_item = true, type = 'Weapon',
            main_fov = 30, can_feature = false, force_set_feature = false
        }
   } )



