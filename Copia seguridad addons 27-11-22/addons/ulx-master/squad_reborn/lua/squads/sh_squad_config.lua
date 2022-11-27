
SQUAD = SQUAD or {}

SQUAD.Config = SQUAD.Config or {}

--Custom check function
SQUAD.Config.CustomCheck = function(ply)
    --if ply:GetUserGroup() == "user" then
    --  return true
    --end
    return true
end
SQUAD.Config.FailCheck = "Sorry, you are not a banana"

--Max members, i recommend using 4 in 4 amounts, and less than 12, 4 is perfect, but it's up to you to use it
SQUAD.Config.MaxMembers = 6
--Max tag size, example FIRED or LMAOX
SQUAD.Config.TagMaxSize = 3
--Max team name size, it speaks for itself
SQUAD.Config.NameMaxSize = 15
--Teams can deal damage between themselves? True enable damage
SQUAD.Config.DamageBetweenTeam = false
--Can you give weapons via C menu?
SQUAD.Config.CanShareWeapons = true
--Can you send money via C menu?
SQUAD.Config.CanShareMoney = true
--Can you share your view via C menu?
SQUAD.Config.CanViewPlayerScreens = true
--Can only bosses from squads use view function
SQUAD.Config.OnlyBossCanSee = true

--HUD size, i recommend values higher than 0.5
SQUAD.Config.HUDScale = 0.85
--HUD elements opacity, 255 is full opaque, 0 is invisible
SQUAD.Config.HUDOpacity = 100

--Key that brings minimap
SQUAD.Config.MinimapKey = KEY_F5

--You can open squad menu in C menu?
SQUAD.Config.UseCMenu = true

--You can open squad menu in C menu?
SQUAD.Config.KeyBringSquadMenu = -1 --Keep -1 to disable it

--Prefix to use squad chat, example !party hey guys!
SQUAD.Config.ChatPrefix = "squad"
--Which key is used to talk with your squad, you must hold voice chat too
SQUAD.Config.VoiceKey = KEY_LALT
--This is the key displayed in tips
SQUAD.Config.VoiceKeyString = "Left ALT"
--Which groups can see admin panel info inside C menu
SQUAD.Config.AdminPanelView = {"superadmin", "admin", "trialmod"}

--Language options
SQUAD.Language = {}

SQUAD.Language.Join = "% s te está invitando!"
SQUAD.Language.CreateOne = "¡Crear uno!"
SQUAD.Language.AcceptInvitations = "¿Pueden invitarme?"
SQUAD.Language.ShareView = "¿Puedo compartir mi pantalla?"
SQUAD.Language.DrawOutlines = "Mostrar líneas exteriores"
SQUAD.Language.Drawtips = "Mostrar consejos"
SQUAD.Language.NotInSquad = "No estás en un escuadrón."
SQUAD.Language.InvitePlayers = "Invitar jugadores"
SQUAD.Language.Create = "Crear"
SQUAD.Language.Filter = "Invitar - Filtro:"
SQUAD.Language.InvitationButtons = {"ENVIADO", "SELECCIONAR"}
SQUAD.Language.LeavedSquad = "abandonó el equipo"
SQUAD.Language.Sent = "te envió"

SQUAD.Language.SalirMessage = "¿Está seguro de que quiere salir del SQUAD?"
SQUAD.Language.SalirConfirm = "Confirmación de abandono"
SQUAD.Language.Yeah = "Sí"
SQUAD.Language.RemoveLeave = {"Eliminar", "Salir", "De SQUAD"}

SQUAD.Language.D_Title = "SQUAD - CREAR"
SQUAD.Language.Chars = "letras"
SQUAD.Language.D_Created = "SQUAD CREADO"
SQUAD.Language.D_Exists = "SQUAD YA EXISTE"
SQUAD.Language.D_ExistsB = "USAR UN NOMBRE DIFERENTE"
SQUAD.Language.D_Error = "OCURRIÓ UN ERROR"

SQUAD.Language.Message = "Enviar mensaje"
SQUAD.Language.MessageWarning = "Espere al menos 5 segundos entre el envío de mensajes"
SQUAD.Language.Money = "Enviar dinero"
SQUAD.Language.MoneySubtitle = "Ingrese la cantidad de dinero que desea donar"
SQUAD.Language.GiveGun = "Dar arma"
SQUAD.Language.ScreenView = "Ver pantalla del jugador"

SQUAD.Language.MaxMembers = "Este SQUAD ya tiene el máximo de miembros"

SQUAD.Language.Accept = "Aceptar"
SQUAD.Language.Refuse = "Rechazar"

--Cadenas de consejos
SQUAD.Tips = {"Mantén presionado C y presiona el widget Escuadrón para crear el tuyo",
    "¿Quieres evitar que la gente te invite? Abre el menú C y desactívalo en Squad",
    "Puedes ver tu escuadrón a través de las paredes habilitándolo en las opciones de Escuadrón (Menú C)",
    "Puedes enviar dinero a través del menú Plantilla",
    "¿Quieres enviar un mensaje a tu equipo? Escribe (! O /)" .. SQUAD.Config.ChatPrefix .. "<mensaje>",
    "Puedes hablar por radio con tu escuadrón manteniendo presionada la tecla de voz y" .. SQUAD.Config.VoiceKeyString,
    "Puedes desactivar esos consejos en el menú Plantilla"
}
