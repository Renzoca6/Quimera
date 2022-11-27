    --[[
         This is only part of the config, to create NPCs and items go into:
         tstore_config_manager -> tstore_npc_config.lua or -> tstore_item_config.lua
         Written guide on adding items -> adding_items_explained.txt
         Written guide on adding npcs -> adding_npcs_explained.txt

         IMPORTANT: Please watch this video (https://www.youtube.com/watch?v=U21puENDU7g) on how to configure things, as 
         a lot of the current features are attatched to the items and NPCs themselves, not inside of this file. Thanks.
    --]]
    
    --> Start of Configuration File <--

    StoreHandler.Currency = 'DarkRP' -- DarkRP, PointShop1, PointShop2, basewars

    StoreHandler.MessagePrefix = '[tStore]' -- The prefix of a message sent in chat from tStore.
    StoreHandler.PrefixColor = Color( 245, 59, 87 ) -- The Color of the prefix
    StoreHandler.MessageColor = Color( 255, 255, 255 ) -- The Color of the message

    StoreHandler.CanOpenWithCommand = true
    StoreHandler.OpenStoreCommand = '/tienda' -- Opens the first (made) NPC
    StoreHandler.ClearItemsCommand = '/tclear' -- The command for superadmin's to use to clear items or inventories.
    --> Console command <--
    StoreHandler.AddItemCommand = 'tstore_offer_perm_item' -- The command used to add items to a player. (Donation command etc)

    StoreHandler.Themes.Choice = 'Classic' -- Fortnite or Classic.
    StoreHandler.AdminMod = 'ulx' -- ulx or serverguard

    StoreHandler.GiveWeaponsOnSpawn = false -- Give users the items they own when they spawn?

    



    