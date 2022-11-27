    --[[
            Written guide provided in: adding_npcs_explained.txt or watch this video( https://www.youtube.com/watch?v=U21puENDU7g )
            I STRONGLY suggest you watch the video before creating anything.

            For Job Restrictions, read the .txt file(s) as I can't add it to the video.

            Creating an NPC Template:

            StoreHandler.CreateStore({
                id = '',
                overhead = '',
                model = '',
                description = "",
                position = { 
                    { pos = Vector(), angle = Angle() }
                },
                store_name = '',
                store_categories = { { tab = 'Weapons', feature_time = 30 } },
                spawn_chance = 100,
                restricted_to = {}, -- Delete this if you don't want to restrict via usergroups.
                job_restrictions = {} -- Delete this if you don't want to restrict via jobs.
           })
    --]]

	

       
    StoreHandler.CreateStore({
        id = 'tienda_general',
        overhead = 'Tienda General',
        model = 'models/Humans/Group03/Male_04.mdl',
        description = "We sell a variety of different things, some are shit some are alright.",
        position = { 
            { pos = Vector( 1121.506958, -886.887634, -139.968750 ), angle = Angle( -0.439988, -179.319855, 0.000000 ) }
        },
        store_name = 'Tienda General',
        store_categories = { { tab = 'Heavy', feature_time = 30 }, { tab = 'Asalto', feature_time = 30 },{ tab = 'Recon', feature_time = 30 }, { tab = 'Medico', feature_time = 30 }, { tab = 'Republic Comando', feature_time = 30 }, { tab = 'VIP', feature_time = 30 } },
        spawn_chance = 100
   	})

    


           





    



