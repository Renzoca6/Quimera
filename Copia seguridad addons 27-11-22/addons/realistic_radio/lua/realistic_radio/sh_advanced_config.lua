--[[
  _____            _ _     _   _        _____           _ _        
 |  __ \          | (_)   | | (_)      |  __ \         | (_)       
 | |__) |___  __ _| |_ ___| |_ _  ___  | |__) |__ _  __| |_  ___   
 |  _  // _ \/ _` | | / __| __| |/ __| |  _  // _` |/ _` | |/ _ \  
 | | \ \  __/ (_| | | \__ \ |_| | (__  | | \ \ (_| | (_| | | (_) | 
 |_|  \_\___|\__,_|_|_|___/\__|_|\___| |_|  \_\__,_|\__,_|_|\___/  
                                                                                                                                    
]]

Realistic_Radio.Tutorial = Realistic_Radio.Tutorial or {}

Realistic_Radio.NumberKey = {
    [KEY_0] = 0,[KEY_1] = 1,[KEY_2] = 2,[KEY_3] = 3,[KEY_4] = 4,[KEY_5] = 5,[KEY_6] = 6,[KEY_7] = 7,[KEY_8] = 8,[KEY_9] = 9,
    [KEY_PAD_0] = 0,[KEY_PAD_1] = 1,[KEY_PAD_2] = 2,[KEY_PAD_3] = 3,[KEY_PAD_4] = 4,[KEY_PAD_5] = 5,[KEY_PAD_6] = 6,[KEY_PAD_7] = 7,[KEY_PAD_8] = 8,[KEY_PAD_9] = 9,
}

Realistic_Radio.Tutorial[1] = {
    ["Image"] = Material("rdo_materials/rdo_image3.png", "smooth"),
    ["KeyTutorial"] = {
        [1] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto1"),
            ["KeyImage"] = Material("rdo_materials/rdo_info.png", "smooth")
        },
        [2] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto2"),
            ["KeyImage"] = Material("rdo_materials/rdo_numero.png", "smooth")
        },
        [3] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto3"),
            ["KeyImage"] = Material("rdo_materials/rdo_arrowright.png", "smooth")
        },
        [4] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto4"),
            ["KeyImage"] = Material("rdo_materials/rdo_molette1.png", "smooth")
        },
        [5] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto5"),
            ["KeyImage"] = Material("rdo_materials/rdo_enterp.png", "smooth")
        },
    },
}

Realistic_Radio.Tutorial[2] = {
    ["Image"] = Material("rdo_materials/rdo_image4.png", "smooth"),
    ["KeyTutorial"] = {
        [1] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto6"),
            ["KeyImage"] = Material("rdo_materials/rdo_info.png", "smooth")
        },
        [2] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto2"),
            ["KeyImage"] = Material("rdo_materials/rdo_numero.png", "smooth")
        },
        [3] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto4"),
            ["KeyImage"] = Material("rdo_materials/rdo_molette1.png", "smooth")
        },
        [4] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto3"),
            ["KeyImage"] = Material("rdo_materials/rdo_arrowright.png", "smooth")
        },
        [5] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto7"),
            ["KeyImage"] = Material("rdo_materials/rdo_enterp.png", "smooth")
        },
    },
}

Realistic_Radio.Tutorial[3] = {
    ["Image"] = Material("rdo_materials/rdo_image2.png", "smooth"),
    ["KeyTutorial"] = {
        [1] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto9"),
            ["KeyImage"] = Material("rdo_materials/rdo_info.png", "smooth")
        },
        [2] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto3"),
            ["KeyImage"] = Material("rdo_materials/rdo_arrowright.png", "smooth")
        },
        [3] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto8"),
            ["KeyImage"] = Material("rdo_materials/rdo_enterp.png", "smooth")
        },
    },
}

Realistic_Radio.Tutorial[4] = {
    ["Image"] = Material("rdo_materials/rdo_image5.png", "smooth"),
    ["KeyTutorial"] = {
        [1] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto10"),
            ["KeyImage"] = Material("rdo_materials/rdo_info.png", "smooth")
        },
        [2] = {
            ["Text"] = Realistic_Radio.GetSentence("tuto11"),
            ["KeyImage"] = Material("rdo_materials/rdo_numero.png", "smooth")
        },
    },
}