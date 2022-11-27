  --[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note If you want to edit a default DarkRP job, first disable it in darkrp_configdisabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here
httpsgithub.comFPtjeDarkRPblobmastergamemodeconfigjobrelated.lua

For examples and explanation please visit this wiki page
httpsdarkrp.miraheze.orgwikiDarkRPCustomJobFields

Add your custom jobs under the following line
---------------------------------------------------------------------------]]



--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]

--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
-- Grupo de jobs
-- Batallon de ataque 104th
-- "Unidad de defensa 442nd"
-- Clone Trooper
--Altos Rangosf
-- Confederacion de sistemas independientes



--Recluta
TEAM_RECLUTA = DarkRP.createJob("Cadete", {
    color = Color(20, 150, 20, 255),
    model = {"models/cadet_blue/pm_training_cadet_alpha.mdl"},
    description = [[Eres un clon cadete en proceso de aprendizaje del Gran ejercito de la republica.]],
    weapons = {"salute_swep", "surrender_animation_swep"},
    command = "CDT",
    max = 0,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Clone trooper",
})

-- Initial team when first spawning
GAMEMODE.DefaultTeam = TEAM_RECLUTA



-- Batallon de ataque 104th
-- Asalto 104
TEAM_104 = DarkRP.createJob("Asalto 104th" , {
    color = Color(17, 51, 102, 255),
    model = {"models/aussiwozzi/cgi/base/104th_trooper.mdl"},
    description = [[Eres un soldado clon de la Division De Ataque 104th del Gran ejercito de la republica.]],
    weapons = {"rw_sw_dc15s", "rw_sw_dc17", "weapon_breachingcharge", "rw_sw_nade_impact", "salute_swep", "surrender_animation_swep","rw_sw_nade_impact" , "weapon_breachingcharge","weapon_rdo_radio","v92_bf2_parachute"},
    command = "104AS",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Medico 104
TEAM_104 = DarkRP.createJob("Medico 104th" , {
    color = Color(17, 51, 102, 255),
    model = {"models/aussiwozzi/cgi/base/104th_medic.mdl"},
    description = [[Eres un soldado clon medico de la "Division De Ataque 104th" del Gran ejercito de la republica.]],
    weapons = {"rw_sw_dc15s", "rw_sw_dc17", "weapon_breachingcharge", "rw_sw_nade_impact", "salute_swep", "surrender_animation_swep", "weapon_defibrillator", "weapon_medkit","rw_sw_nade_impact", "weapon_breachingcharge","weapon_rdo_radio","v92_bf2_parachute"},
    command = "104Med",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Heavy 104
TEAM_104 = DarkRP.createJob("Heavy 104th" , {
    color = Color(17, 51, 102, 255),
    model = {"models/aussiwozzi/cgi/base/104th_barc.mdl"},
    description = [[Eres un soldado clon heavy de la "Division De Ataque 104th" del Gran ejercito de la republica.]],
    weapons = {"rw_sw_dp24", "rw_sw_dc17", "weapon_breachingcharge", "rw_sw_nade_impact", "salute_swep", "surrender_animation_swep","rw_sw_nade_impact" , "weapon_breachingcharge","weapon_rdo_radio","v92_bf2_parachute"},
    command = "104He",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(110)
        ply:SetHealth(110)
        ply:SetArmor(110)
    end
})
--Piloto 104
TEAM_104 = DarkRP.createJob("Piloto 104th", {
    color = Color(17, 51, 102, 255),
    model = {
        "models/aussiwozzi/cgi/base/104th_pilot.mdl",
        "models/aussiwozzi/cgi/base/104th_evo.mdl"
    },
    description = [[Eres un soldado clon piloto  ingeniero de la "Division De Ataque 104th" del Gran ejercito de la republica.]],
    weapons = { "rw_sw_dc15s", "rw_sw_dc17", "weapon_breachingcharge", "rw_sw_nade_impact", "salute_swep", "surrender_animation_swep","rw_sw_nade_impact" , "weapon_breachingcharge","v92_bf2_parachute","weapon_rdo_radio","alydus_fusioncutter"},
    command = "104Pl",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Reconocimiento 104
TEAM_104 = DarkRP.createJob("Reconocimiento 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/aussiwozzi/cgi/base/104th_arf.mdl"},
    description = [[Eres un soldado clon que forma parte de los F.R.A de la "Division De Ataque 104thh" del Gran ejercito de la republica.]],
    weapons = { "rw_sw_dc15x", "rw_sw_dc17", "weapon_breachingcharge", "rw_sw_nade_impact", "salute_swep", "surrender_animation_swep" , "rw_sw_nade_impact" , "weapon_breachingcharge","weapon_rdo_radio","v92_bf2_parachute"},
    command = "104fra",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Sub oficial 104
TEAM_104 = DarkRP.createJob("Sub Oficial 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/aussiwozzi/cgi/base/104th_medic_officer.mdl"},
    description = [[Eres un soldado sub oficial de la "Division De Ataque 104thh" del Gran ejercito de la republica.]],
    weapons = {"rw_sw_nade_impact", "salute_swep", "surrender_animation_swep", "weapon_breachingcharge", "rw_sw_dual_dc17", "weapon_medkit", "weapon_defibrillator","rw_sw_nade_impact" , "weapon_breachingcharge","weapon_rdo_radio","v92_bf2_parachute", "rw_sw_dc15s"},
    command = "104Sub",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Republic comando 104
TEAM_104 = DarkRP.createJob("Republic Comando 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/player/finch/rc/104ce/skoll.mdl"},
    description = [[Eres un Republic Comando que forma parte de la "Division De Ataque 104th"]],
    weapons = {"salute_swep", "surrender_animation_swep", "tfa_swch_dc17m_br", "at_sw_dc15sa_original","rw_sw_nade_impact" , "weapon_breachingcharge","weapon_rdo_radio","v92_bf2_parachute"},
    command = "rp104",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false ,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(110)
    end
})
--Republic comando 104
TEAM_104 = DarkRP.createJob("Republic Comando Piloto 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/player/finch/rc/104ce/howl.mdl"},
    description = [[Eres un Republic Comando que forma parte de la "Division De Ataque 104th"]],
    weapons = {"salute_swep", "surrender_animation_swep", "tfa_swch_dc17m_br", "at_sw_dc15sa_original","rw_sw_nade_impact" , "weapon_breachingcharge","v92_bf2_parachute","weapon_rdo_radio","alydus_fusioncutter"},
    command = "rpp104",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false ,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(110)
    end
})
--Republic comando medico 104
TEAM_104 = DarkRP.createJob("Republic Comando Medico 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/player/finch/rc/104ce/redhood.mdl"},
    description = [[Eres un Republic Comando Medico que forma parte de la "Division De Ataque 104th"]],
    weapons = {"salute_swep", "surrender_animation_swep", "tfa_swch_dc17m_br", "at_sw_dc15sa_original", "weapon_defibrillator", "weapon_medkit","rw_sw_nade_impact" , "weapon_breachingcharge","weapon_rdo_radio","v92_bf2_parachute"},
    command = "rpm104",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(110)
    end
})

-- Padawan 104

TEAM_104 = DarkRP.createJob("Padawan Jedi 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/finch/jaj/jedi/cg_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Padawan Jedi que trabaja junto a la republica]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep", "weapon_breachingcharge", "rw_sw_nade_impact", "v92_bf2_parachute"},
    command = "padawan104",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(120)
        ply:SetHealth(120)
        ply:SetArmor(120)
    end
})
--caballero 104
TEAM_104 = DarkRP.createJob("Caballero Jedi 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/finch/jaj/jedi/cg_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Caballero Jedi que trabaja junto a la republica]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep", "weapon_breachingcharge", "rw_sw_nade_impact", "v92_bf2_parachute"},
    command = "caballero104",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(150)
    end
})
--maestrro 104
TEAM_104 = DarkRP.createJob("Maestro Jedi 104th", {
    color = Color(17, 51, 102, 255),
    model = {"models/finch/jaj/jedi/cg_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Maestro Jedi a cargo de la Orden Jedi]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep", "weapon_breachingcharge", "rw_sw_nade_impact", "v92_bf2_parachute"},
    command = "maestro104",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Division De Ataque 104th",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(180)
        ply:SetHealth(180)
        ply:SetArmor(180)
    end
})

--Batallon Clone troopers
--Clone troopers 
TEAM_CT = DarkRP.createJob("Clone Trooper", {
    color = Color(228, 228, 228, 255),
    model = {"models/aussiwozzi/cgi/base/unassigned_trp.mdl"},
    description = [[Eres un clon trooper inasignado del Gran ejercito de la republica.]],
    weapons = {"salute_swep", "surrender_animation_swep", "rw_sw_dc15s","weapon_rdo_radio", "rw_sw_dc17"},
    command = "CT",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Clone trooper",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
-- Republic comando 
TEAM_RC = DarkRP.createJob("Republic Comando", {
    color = Color(228, 228, 228, 255),
    model = {"models/grandayen/clean-commando.mdl"},
    description = [[Eres un Republic Comando del Gran ejercito de la Republica.]],
    weapons = {"salute_swep", "surrender_animation_swep", "tfa_swch_dc17m_br", "weapon_rdo_radio","at_sw_dc15sa_original"},
    command = "ctrp",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Clone trooper",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(110)
        ply:SetHealth(110)
        ply:SetArmor(110)
    end
})

-- Batallon 442ND
--Asalto 442
TEAM_442_AS = DarkRP.createJob("Asalto 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/aussiwozzi/cgi/base/442nd_trooper.mdl"},
    description = [[Eres un soldado clon de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "rw_sw_dc15s", "rw_sw_dc17", "mortar_range_finder", "weapon_rdo_radio","mortar_constructor"},
    command = "442AS",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--heavy 442
TEAM_442_HVY = DarkRP.createJob("Heavy 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/aussiwozzi/cgi/base/442nd_barc.mdl"},
    description = [[Eres un soldado clon Heavy de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "rw_sw_dc17", "mortar_range_finder","weapon_rdo_radio", "mortar_constructor", "rw_sw_dp24"},
    command = "442Heavy",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(110)
        ply:SetHealth(110)
        ply:SetArmor(110)
    end
})
--Medico 442
TEAM_442_MED = DarkRP.createJob("Medico 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/aussiwozzi/cgi/base/442nd_medic.mdl"},
    description = [[Eres un soldado clon Medico de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "rw_sw_dc17", "mortar_range_finder", "mortar_constructor", "weapon_rdo_radio", "rw_sw_dc15s", "weapon_defibrillator", "weapon_medkit"},
    command = "442Med",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Piloto 442
TEAM_442_PLT = DarkRP.createJob("Piloto 442nd", {
    color = Color(8, 180, 68, 255),
    model = {
        "models/aussiwozzi/cgi/base/442nd_pilot.mdl",
      	"models/aussiwozzi/cgi/base/442nd_tyger.mdl"
    },
    description = [[Eres un soldado clon piloto  ingeniero de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "rw_sw_dc17", "mortar_range_finder", "weapon_rdo_radio", "mortar_constructor", "rw_sw_dc15s", "alydus_fusioncutter"},
    command = "442PL",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Reconocimiento 442
TEAM_442_FRA = DarkRP.createJob("Reconocimiento 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/aussiwozzi/cgi/base/442nd_arf.mdl"},
    description = [[Eres un soldado clon F.R.A de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "rw_sw_dc17", "mortar_range_finder", "weapon_rdo_radio", "mortar_constructor", "rw_sw_dc15x"},
    command = "442FRA",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
-- Sub ofical 442
TEAM_442_SO = DarkRP.createJob("Sub Oficial 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/aussiwozzi/cgi/base/442nd_officer.mdl"},
    description = [[Eres el Sub Oficial de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "mortar_range_finder", "mortar_constructor", "rw_sw_dc15s", "weapon_rdo_radio", "rw_sw_dual_dc17", "weapon_medkit", "weapon_defibrillator"},
    command = "Sub442",
    max = 2,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--Republic comando 442
TEAM_442 = DarkRP.createJob("Republic Comando 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/player/finch/vg/rc/10.mdl"},
    description = [[Eres un Republic Comando de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "mortar_range_finder", "mortar_constructor", "weapon_rdo_radio", "tfa_swch_dc17m_br", "at_sw_dc15sa_original"},
    command = "Rp442",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(110)
        ply:SetHealth(110)
        ply:SetArmor(110)
    end
})
-- Republic comando medico 442 
TEAM_442 = DarkRP.createJob("Republic Comando Medico 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/player/finch/vg/rc/09.mdl"},
    description = [[Eres un Republic Comando Medico de la unidad 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "mortar_range_finder", "mortar_constructor", "tfa_swch_dc17m_br", "weapon_rdo_radio", "at_sw_dc15sa_original", "weapon_defibrillator", "weapon_medkit"},
    command = "Rpm442",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(110)
        ply:SetHealth(110)
        ply:SetArmor(110)
    end
})
-- Republic comando piloto 442
TEAM_442 = DarkRP.createJob("Republic Comando Piloto 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/player/finch/vg/rc/22.mdl"},
    description = [[ Eres un Republic Comando Piloto de la Unidad de Defensa 442nd del Gran ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "mortar_range_finder", "mortar_constructor", "at_sw_dc15sa", "weapon_rdo_radio", "tfa_swch_dc17m_br", "alydus_fusioncutter"},
    command = "Rpp442",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(110)
        ply:SetHealth(110)
        ply:SetArmor(110)
    end
})

-- Padawan 442

TEAM_442 = DarkRP.createJob("Padawan Jedi 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/finch/jaj/jedi/41st_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Padawan Jedi que trabaja junto a la Republica]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep", "mortar_range_finder", "mortar_constructor"},
    command = "padawan442",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(120)
        ply:SetHealth(120)
        ply:SetArmor(120)
    end
})
--caballero 442
TEAM_442 = DarkRP.createJob("Caballero Jedi 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/finch/jaj/jedi/41st_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Caballero Jedi que trabaja junto a la republica]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep", "mortar_range_finder", "mortar_constructor"},
    command = "caballero442",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(150)
    end
})
--maestrro 442
TEAM_442 = DarkRP.createJob("Maestro Jedi 442nd", {
    color = Color(8, 180, 68, 255),
    model = {"models/finch/jaj/jedi/41st_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Maestro Jedi a cargo de la Orden Jedi]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep", "mortar_range_finder", "mortar_constructor"},
    command = "maestro442",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Unidad de defensa 442nd",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(180)
        ply:SetHealth(180)
        ply:SetArmor(180)
    end
})

-- Altos Rangos

--General ejecutivo 
TEAM_REP = DarkRP.createJob("General Ejecutivo", {
    color = Color(34, 17, 0, 255),
    model = {"models/aussiwozzi/cgi/base/rhc_2.mdl"},
    description = [[Eres el General Ejecutivo del Gran Ejercito de la Republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "weapon_defibrillator", "weapon_medkit", "weapon_rdo_radio", "cross_arms_infront_swep", "rw_sw_dual_dc17"},
    command = "GRN",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Altos Rangos",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(110)
        ply:SetHealth(110)
        ply:SetArmor(110)
    end
})
--Palpatine
TEAM_REP = DarkRP.createJob("Supremo Canciller Palpatine", {
    color = Color(34, 17, 0, 255),
    model = {"models/riddick/sr/palpatine/palpatine.mdl"},
    description = [[Eres el Supremo Canciller de la republica galactica]],
    weapons = {"salute_swep", "surrender_animation_swep", "cross_arms_infront_swep"},
    command = "Palpatine",
    max = 1,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Altos Rangos",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
--navy
TEAM_REP = DarkRP.createJob("Navy", {
    color = Color(34, 17, 0, 255),
    model = {"models/jajoff/sps/republic/tc13j/navy_01.mdl",
             "models/jajoff/sps/republic/tc13j/navy_02.mdl",
             "models/jajoff/sps/republic/tc13j/navy_03.mdl",
             "models/jajoff/sps/republic/tc13j/navy_04.mdl",
             "models/player/bridgestaff/cgibridgestaff.mdl"},
    description = [[Eres el integrante de la armada del ejercito de la republica]],
    weapons = {"salute_swep", "surrender_animation_swep", "cross_arms_infront_swep","mortar_range_finder"},
    command = "Navy",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Altos Rangos",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})

--"Cis"
--B1
TEAM_Cis = DarkRP.createJob("B1", {
    color = Color(130,130,130,255),
    model = {"models/player/hydro/b1_battledroids/assault/b1_battledroid_assault.mdl"},
    description = [[Eres un Droide B1 de la Confederación de Sistemas Independientes]],
    weapons = {"rw_sw_e5"},
    command = "B1",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Cis",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(200)
        ply:SetHealth(200)
        ply:SetArmor(200)
    end
})
--B1cmd
TEAM_Cis = DarkRP.createJob("B1 CMD", {
    color = Color(130,130,130,255),
    model = {"models/player/hydro/b1_battledroids/officer/b1_battledroid_officer.mdl"},
    description = [[Eres un Droide B1 CMD de la Confederación de Sistemas Independientes]],
    weapons = {"rw_sw_e5"},
    command = "B1CMD",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Cis",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(200)
        ply:SetHealth(200)
        ply:SetArmor(200)
    end
})
--bx Capitan 
TEAM_Cis = DarkRP.createJob("Bx Capitan", {
    color = Color(130,130,130,255),
    model = {"models/sally/tkaro/bx_commando_droid.mdl"},
    description = [[Eres un Droide BX CPT de la Confederación de Sistemas Independientes]],
    weapons = {"rw_sw_e5bx","rw_sw_sg6","rw_sw_e5s"},
    command = "BXCPT",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Cis",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(250)
        ply:SetHealth(250)
        ply:SetArmor(250)
    end
})
--bx 
TEAM_Cis = DarkRP.createJob("Bx", {
    color = Color(130,130,130,255),
    model = {"models/sally/tkaro/bx_commando_droid.mdl"},
    description = [[Eres un Droide BX de la Confederación de Sistemas Independientes]],
    weapons = {"rw_sw_e5bx","rw_sw_sg6"},
    command = "BX",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Cis",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(250)
        ply:SetHealth(250)
        ply:SetArmor(250)
    end
})
--b2
TEAM_Cis = DarkRP.createJob("B2", {
    color = Color(130,130,130,255),
    model = {"models/cis_npc/b2_battledroid/b2_battledroid.mdl"},
    description = [[Eres un Droide B2 de la Confederación de Sistemas Independientes]],
    weapons = {"rw_sw_b2rp_blaster","rw_sw_b2rp_rocket"},
    command = "B2",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Cis",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(150)
    end
})
--droide tactico 
TEAM_Cis = DarkRP.createJob("Droide tactico", {
    color = Color(130,130,130,255),
    model = {"models/helios/kalani15.mdl"},
    description = [[Eres un Droide tactico de la Confederación de Sistemas Independientes]],
    weapons = {"salute_swep", "surrender_animation_swep", "cross_arms_infront_swep","mortar_range_finder"},
    command = "tactico",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Cis",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(150)
    end
})
--staff 

TEAM_Cis = DarkRP.createJob("On Duty", {
    color = Color(130,130,130,255),
    model = {"models/player/combine_super_soldier.mdl"},
    description = [[Este es el job para el staff]],
    weapons = {"gmod_tool", "weapon_physgun"},
    command = "onduty",
    max = 0,
    salary = 100,
    admin = 1,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Staff",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(10000)
        ply:SetHealth(10000)
        ply:SetArmor(10000)
    end
})
--Orden jedi 
--Inciado 
TEAM_JEDI = DarkRP.createJob("Iniciado Jedi", {
    color = Color(130,130,130,255),
    model = {"models/jazzmcfly/jka/younglings/jka_young_male.mdl","models/jazzmcfly/jka/younglings/jka_young_shak.mdl","models/jazzmcfly/jka/younglings/jka_young_anikan.mdl","models/jazzmcfly/jka/younglings/jka_young_female.mdl"},
    description = [[Eres un iniciado Jedi bajo el cargo de la Orden]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep"},
    command = "iniciadojedi",
    max = 5,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Orden Jedi",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(100)
        ply:SetHealth(100)
        ply:SetArmor(100)
    end
})
-- Padawan

TEAM_JEDI = DarkRP.createJob("Padawan Jedi", {
    color = Color(130,130,130,255),
    model = {"models/finch/jaj/jedi/ct_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Padawan Jedi que trabaja junto a la Republica]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep"},
    command = "padawan",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Orden Jedi",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(120)
        ply:SetHealth(120)
        ply:SetArmor(120)
    end
})
--caballero
TEAM_JEDI = DarkRP.createJob("Caballero Jedi", {
    color = Color(130,130,130,255),
    model = {"models/finch/jaj/jedi/ct_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Caballero Jedi que trabaja junto a la Republica]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep"},
    command = "caballero",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Orden Jedi",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(150)
        ply:SetHealth(150)
        ply:SetArmor(150)
    end
})
--maestrro
TEAM_JEDI = DarkRP.createJob("Maestro Jedi", {
    color = Color(130,130,130,255),
    model = {"models/finch/jaj/jedi/ct_jedi.mdl","models/finch/jaj/jedi/jedi_master.mdl"},
    description = [[Eres un Maestro Jedi a cargo de la Orden Jedi]],
    weapons = {"weapon_lscs", "salute_swep", "weapon_rdo_radio", "surrender_animation_swep"},
    command = "maestro",
    max = 5,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    category = "Orden Jedi",
    NeedToChangeFrom = TEAM_REPUBLIC,
    PlayerSpawn = function(ply)
        ply:SetMaxHealth(180)
        ply:SetHealth(180)
        ply:SetArmor(180)
    end
})
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
--DarkRP.addHitmanTeam(TEAM_MOB)
