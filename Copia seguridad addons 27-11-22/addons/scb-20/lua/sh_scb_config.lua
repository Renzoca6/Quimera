if SCB_LOADED then return end

local config = scb.config

--
-- Chatbox title!@!
-- SERVER_NAME will be replaced with your server name
-- PLAYER_COUNT will be replaced with your online player count
-- EG.
-- config.chatbox_title = "SERVER_NAME (PLAYER_COUNT)" -- > Srlion Gaming (1)
--
config.chatbox_title = "SERVER_NAME (PLAYER_COUNT)"

--
-- By default it uses 12h format, for 24h use "%H:%M:%S"
--
config.timestamps_format = "%I:%M:%S %p"

--
-- Allow parsing in chat print functions? (chat.AddText/Player:ChatPrint/Player:PrintMessage)
-- If it causes problems then disable it.
--
config.parse_in_chat = true

--
-- Hide language sign that appears behing emojis if you are typing in a non-English language
--
config.hide_language_sign = true

--
-- Enable the custom join/leave messages
--
config.enable_custom_join_leave_messages = true

--
-- You can use SteamID/SteamID64/Ranks
-- If the first value is 'true' then anyone can use it
--
config.permissions = {
	--
	-- Who can add/remove/edit emojis & tags?
	--
	menu = {
		"superadmin",

	},

	--
	-- Who can use rainbow texts?
	-- Eg.
	-- hi there {* everyone}!
	--
	rainbow = {
		"superadmin",
		"admin",
		"vip",
		"vip+",
	},

	--
	-- Who can use flashing texts?
	-- Eg.
	-- hi there {! everyone}!
	--
	flashing = {
		true, -- anyone can use this!!!
	},

	--
	-- Who can use colored texts?
	-- Eg.
	-- hi there {red Srlion}!
	-- hi there {#ff0000 Srlion}!
	--
	colored_texts = {
		true, -- anyone can use this!!!
	},

	--
	-- Who can use custom emojis?
	--
	custom_emojis = {
		true, -- anyone can use this because true is the first value!!!
		"superadmin",
	}
}

--
-- You can add colors that can be used in chatbox, eg. {my_new_color hi there!}
-- Use something like https://www.hexcolortool.com to get hex codes!
--
config.colors = {
	red = "f44336",
	pink = "E91E63",
	purple = "9C27B0",
	blue = "1773c4",
	cyan = "00BCD4",
	green = "4CAF50",
	yellow = "FFEB3B",
	orange = "FF9800",
	brown = "7b5804",
	grey = "9E9E9E",
	white = "E0E0E0",
	black = "080808"
}