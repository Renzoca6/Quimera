
local Leak_Protection_Status=[[OK]] local wjl=" ver 3.0"
/* READ THIS BEFORE HAVE PROBLEM PLEASE,

If you find my work serious know they are all my other scripts here: https://scriptfodder.com/users/view/76561198033784269/scripts
My Facebook page with all information and my artworks: https://www.facebook.com/zworld.afterlife/

----1.Leak----
Our biggest issues here are people who purchase scripts, with the sole purpose of leaking them.
As a developer, if I see my scripts, or any other developer's scripts here for that matter leaked by a member of the ScriptFodder community,
rest assured that I will do everything in my power to ensure you fail.
This includes but not limited to, notifying a moderator / admin of ScriptFodder of your attempt to leak,
with proof of course (because we will find you); ensuring you are banned from the website.
Your access to my script completely revoked without any additional warning.
Your name publicly blasted, with SteamID, on any and all developer forums, including Facepunch.com.
As well as any Steam groups you may be part of (maybe even your friends).
And finally, a phone call to PayPal explaining who you are, and what you are attempting to do.
Which in the future can jeopardize your very own PayPal account and have it limited.
We are developers, this is partially how we make a living, and it helps support our families.
If you have an issue, simply tell me and I'll do everything in my power to fix it.
Attempting charge-backs is not the way to handle a business transaction.
If you are not a leaker, you have nothing to worry about, and I thank you for your purchase.

Keep in mind. The leak destroys the creation and the opportunity to see something new and different on Gmod.

----2.Copyright----
The Zworld-Afterlife scripts are placed at Copyright France since 2012.
zworld-afterlife.com© 2008-2015. Created by Nordahl
Do not publish without my authorization.
With my regards,
Thank You.

By Nordahl                                                                                                                                                                                                                                                                     76561198116760757                      
*/
/* Whitelist job system (DarkRP) By Nordahl                                                                                                                                                                                                                                    {{ user.id }} */


--------------------------------------------------------------CONFIGURATION---------------------------------------------------------
-------------------- 1 Enable / 0 Disable --------------------
local WJL_CONFIG={}
WJL_CONFIG.OwnerSteamID="STEAM_0:0:00000000000" --"STEAM_0:1:36759270" --If you are the owner and you dont use Admin System put your Steam ID here. Value exemple: ---> "STEAM_0:1:125347606"                               {{ user.id }}
WJL_CONFIG.F1_to_Open_the_planning=1 --0 = Disable, Player Can open if he press F1 is the value is = 1. 
WJL_CONFIG.Allow_Admin=1
WJL_CONFIG.Allow_SUPER_Admin=1
WJL_CONFIG.Allow_ULX_GROUP_CAN_ACCESS_PANEL={"superadmin","admin","owner","moderador", "e-m"} --Add ULX Admin Group if you want add "admin" ULX rank and another {"superadmin","admin","anothergroup"}
WJL_CONFIG.Allow_JOB_CAN_ADD_INWHITLIST={"501st Comandante"} -- In this exemple Mayor can add players in white list Job Can add player in whitelist do like it if you wan tadd more follow this exemple: {"Mayor","Anotherjob","Anotherjob"} to keep it empty like it: {}
WJL_CONFIG.USeWorkshopContent=1 --If you dont have a fastdownload you can use workshop content (1 Enable "I want use workshop" / 0 Disable "I prefer use my fastdl")
WJL_CONFIG.ULX_DONATOR_RANK= {"vip1", "vip2", "vip3", "vip4", "vip5", "donador"} -- "donator" or "vip" or whatever. Just make sure you remember the name of the group.
WJL_CONFIG.overrides_custom_heck=1 -- Put 0 to keep the old system of customchecks. 1 = All customcheck jobs are disabled with the new system. System overrides custom check and requires to set permissions ex : public donator or whitelist. Currently all my custom check jobs are default public. reboot your server if you change it.
WJL_CONFIG.Donator_Rank_Tester=1 -- enable disable command to check the user rank, "nordahl_donator_rank_tester"

local Add_Job_In_the_Whiteliste = {}
local ZJOBwhitelist={}
local exemplesteamid64="76561198033784269"
local ztvo=0.02 --More this number is big more the download of data is slow. antivorflow system. Default value is 0.01 (0 = zero second of delay Too much information is sent your crash server if you have a big list)

---THE SCRIPT-----------------------------------------------------------------------------------------------------------------------------------
local function eRight(a)
if a:SteamID()==WJL_CONFIG.OwnerSteamID then return true end
if a:IsAdmin()==true then if WJL_CONFIG.Allow_Admin==1 then return true end end
if a:IsSuperAdmin()==true then if WJL_CONFIG.Allow_SUPER_Admin==1 then return true end end
for _,c in ipairs(WJL_CONFIG.Allow_ULX_GROUP_CAN_ACCESS_PANEL)do if a:IsUserGroup(c) then return true end end
for _,c in ipairs(WJL_CONFIG.Allow_JOB_CAN_ADD_INWHITLIST)do if c==team.GetName( a:Team() ) then return true end end
return false
end

local puce="*"
local nord_s_skin="0"
if CLIENT then
local files=file.Read("nordahlclient_option/language.txt","DATA")
if (!files) then
file.CreateDir("nordahlclient_option")
file.Write("nordahlclient_option/language.txt","2")
Z_Defaut_Languages=2
else
Z_Defaut_Languages=tonumber(file.Read("nordahlclient_option/language.txt","DATA"))
end
local files=file.Read("nordahlclient_option/nord_s_skin.txt","DATA")
if (!files) then
file.CreateDir("nordahlclient_option")
file.Write("nordahlclient_option/nord_s_skin.txt","0")
nord_s_skin="0"
else
nord_s_skin=file.Read("nordahlclient_option/nord_s_skin.txt","DATA")
end




function languejobwifr(z)
Z_Defaut_Languages=1
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="Nom"
zadmin3="Rang"
zmobutan="Clic droit sur le joueur"
ajouter="Ajouter"
ajouterallj="Ajouter à tous les jobs"
zaddlisti="Joueurs"
WhitelistJobSystem="Système de Job Whitelist"
zaddsuppr="Supprimer"
zaddsupprall="Supprimer de tous les jobs"
tra_scrp_nordahl_script="Credit"
tra_scrp_nordahl_credit="Fait par Nordahl"
tra_scrp_nordahl_note="Aide moi en me donnant votre avis"
tra_scrprecherche="Rechercher"
tra_scrprecherched="Retrouver en une seule liste toutes les entrées avec un Steam_ID"
tra_wlistde="Whitelist de: "
tra_init="Initialisation"
tra_receptd="Reception des données"
tra_susermax="Nombre d'utilisateurs"
tra_legd="anti-surcharge(Optimisation)"
tra_metieactuel="Métier actuel"
tra_publique="Publique"
tra_acceswhitelist="Accessible seulement sur Whitelist"
tra_groupferme="Métier fermé pour tout le monde"
tra_accesvip="Accessible seulement aux Donateurs"
tra_reinitialiser="Réinitialiser"
tra_ajdalwdumetier="Ajouter dans la Whitelist du métier"
tra_date="Date"
tra_ajpar="Ajouté par"
tra_metier="Métier"
tra_gestiondesmetier="Gestion des métiers"
tra_gestiondesmetitreel="Gestion de l'accès des métiers en temps réel"
tra_listedesjoueurs="La liste des joueurs présents sur le serveur"
tra_accessi="Accessibilité"
tra_info_leak="Vous etiez pas admin lorsque vous avez rejoint le serveur. Il vous manque des informations. Veuillez vous reconnecter. Merci."
tra_regl_stat_job="Regler le Status du Job"
end
function languejobwien(z)
Z_Defaut_Languages=2
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="Name"
zadmin3="Rank"
zmobutan="Right Click on the player"
ajouter="Add"
ajouterallj="Add in all jobs"
zaddlisti="Players"
WhitelistJobSystem="Whitelist Job System"
zaddsuppr="Delete"
zaddsupprall="Delete from all jobs"
tra_scrp_nordahl_script="Credits"
tra_scrp_nordahl_credit="Made by Nordahl"
tra_scrp_nordahl_note="Help me by giving me your opinion on this script"
tra_scrprecherche="Search"
tra_scrprecherched="With a Steam_ID, find all the entries in a simple list"
tra_wlistde="Whitelist on : "
tra_init="Initialisation"
tra_receptd="Data receipt"
tra_susermax="Number of users"
tra_legd="Anti-Overload (Optimisation)"
tra_metieactuel="Actual Job"
tra_publique="Public"
tra_acceswhitelist="Accessible only with the Whitelist"
tra_groupferme="Job closed for everyone"
tra_accesvip="Accessible only to the donators"
tra_reinitialiser="Reset"
tra_ajdalwdumetier="Add in the Job's Whitelist"
tra_date="Date"
tra_ajpar="Added by"
tra_metier="Job"
tra_gestiondesmetier="Jobs management"
tra_gestiondesmetitreel="Real time job access management"
tra_listedesjoueurs="List of players in the server"
tra_accessi="Accessibility"
tra_info_leak="You did not admin when you joined the server. You are missing information. Please reconnect. Thank you."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwidu(z)
Z_Defaut_Languages=4
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Name"
zadmin3 = "Rank"
zmobutan = "Rechts auf dem Player Klicken Sie auf"
ajouter = "Hinzufügen"
ajouterallj = "in allen Jobs hinzufügen"
zaddlisti = "Spieler"
WhitelistJobSystem = "Weiße Liste Job-System"
zaddsuppr = "Löschen"
zaddsupprall = "von allen Jobs löschen"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Hilf mir, von mir auf diesem Skript Sie Ihre Meinung sagen"
tra_scrprecherche = "Suchen"
tra_scrprecherched = "Mit einem STEAM_ID, alle Einträge in einer einfachen Liste finden"
tra_wlistde = "Weiße Liste auf:"
tra_init = "Initialisierung"
tra_receptd = "Datenempfang"
tra_susermax = "Anzahl Benutzer"
tra_legd = "Anti-Überlast (Optimierung)"
tra_metieactuel = "Aktueller Job"
tra_publique = "Public"
tra_acceswhitelist = "Erreichbar nur mit der Whitelist"
tra_groupferme = "Job für alle geschlossen"
tra_accesvip = "Erreichbar nur zu den Donatoren"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Fügen Sie in der Hiobs Weiße Liste"
tra_date = "Datum"
tra_ajpar = "hinzugefügt"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs Management"
tra_gestiondesmetitreel = "Echtzeit-Job Access Management"
tra_listedesjoueurs = "Liste der Spieler auf dem Server"
tra_accessi = "Barrierefreiheit"
tra_info_leak = "Sie haben nicht Admin, wenn Sie den Server verbunden. Sie fehlen Informationen. Bitte wieder an. Danke."
tra_regl_stat_job = "den Status der Jobs Set"
end
function languejobwiru(z)
Z_Defaut_Languages=5
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="имя"
zadmin3="Ранг"
zmobutan="щелкните правой кнопкой мыши на игрока"
ajouter="Добавить"
ajouterallj="Все вакансии"
zaddlisti="игроки"
WhitelistJobSystem="Система Белый Список Заданий"
zaddsuppr="удалить"
zaddsupprall="удалить со всех рабочих мест"
tra_scrp_nordahl_script="кредиты"
tra_scrp_nordahl_credit="выступил Нордал"
tra_scrp_nordahl_note="помогите мне, давая мне свое мнение на этот сценарий"
tra_scrprecherche="поиск"
tra_scrprecherched="с Steam_ID, найти все записи в виде простого списка"
tra_wlistde="белый список на : "
tra_init="инициализация"
tra_receptd="получение данных"
tra_susermax="количество пользователей"
tra_legd="Анти-перегрузки (Оптимизация)"
tra_metieactuel="настоящая работа"
tra_publique="общественные"
tra_acceswhitelist="доступно только с белого списка"
tra_groupferme="задание закрыто для всех"
tra_accesvip="доступна только для донаторов"
tra_reinitialiser="сброс"
tra_ajdalwdumetier="Добавить в задания белого списка"
tra_date="Дата"
tra_ajpar="Добавлено"
tra_metier="работа"
tra_gestiondesmetier="вакансии"
tra_gestiondesmetitreel="режиме реального времени доступ к Job управление"
tra_listedesjoueurs="список игроков на сервере"
tra_accessi="доступность"
tra_info_leak="You did not admin when you joined the server. You are missing information. Please reconnect. Thank you."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwies(z)
Z_Defaut_Languages=3
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom="Nombre"
zadmin3="Rango"
zmobutan="haga Clic Derecho sobre el jugador"
ajouter="Agregar"
ajouterallj="Agregar en todos los puestos de trabajo"
zaddlisti="Jugadores"
WhitelistJobSystem="Lista Blanca Sistema De Trabajo"
zaddsuppr="Eliminar"
zaddsupprall="Eliminar todos los puestos de trabajo"
tra_scrp_nordahl_script="Créditos"
tra_scrp_nordahl_credit="Hecho por Nordahl"
tra_scrp_nordahl_note="Help me por darme tu opinión sobre esta secuencia de comandos"
tra_scrprecherche="Buscar"
tra_scrprecherched="Con un Steam_ID, encontrar todas las entradas en una lista simple"
tra_wlistde="lista Blanca : "
tra_init="Inicialización"
tra_receptd="recepción de Datos"
tra_susermax="Número de usuarios"
tra_legd="Anti-Sobrecarga (Optimización)"
tra_metieactuel="Trabajo Real"
tra_publique="Público"
tra_acceswhitelist="Accesible sólo con la lista Blanca"
tra_groupferme="Trabajo cerrado para todo el mundo"
tra_accesvip="Accesible sólo para los donadores"
tra_reinitialiser="Reset"
tra_ajdalwdumetier="Agregar en el Trabajo de la lista Blanca"
tra_date="Fecha"
tra_ajpar="Agregado por"
tra_metier="Trabajo"
tra_gestiondesmetier="Puestos de trabajo gestión de"
tra_gestiondesmetitreel="tiempo Real de trabajo de gestión de acceso"
tra_listedesjoueurs="Lista de jugadores en el servidor"
tra_accessi="Accesibilidad"
tra_info_leak="You did not admin when you joined the server. You are missing information. Please reconnect. Thank you."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiel(z)
Z_Defaut_Languages=6
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Όνομα"
zadmin3 = "Κατάταξη"
zmobutan = "Κάντε δεξί κλικ στη συσκευή αναπαραγωγής"
ajouter = "Προσθήκη"
ajouterallj = "Προσθέστε σε όλες τις θέσεις εργασίας"
zaddlisti = "παίκτες"
WhitelistJobSystem = "Σύστημα Λευκή Λίστα εργασίας"
zaddsuppr = "Διαγραφή"
zaddsupprall = "Διαγραφή από όλες τις θέσεις εργασίας"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Βοηθήστε με, δίνοντάς μου τη γνώμη σας σχετικά με αυτό το σενάριο"
tra_scrprecherche = "Αναζήτηση"
tra_scrprecherched = "Με Steam_ID, βρείτε όλες τις καταχωρήσεις σε μια απλή λίστα"
tra_wlistde = "Λευκή Λίστα με θέμα:"
tra_init = "αρχικοποίησης"
tra_receptd = "λήψη δεδομένων"
tra_susermax = "Αριθμός χρηστών"
tra_legd = "Anti-υπερφόρτωσης (Βελτιστοποίηση)"
tra_metieactuel = "πραγματική δουλειά"
tra_publique = "Δημόσια"
tra_acceswhitelist = "Πρόσβαση μόνο με τη Λευκή Λίστα"
tra_groupferme = "έκλεισε εργασίας για όλους"
tra_accesvip = "Διαθέσιμη μόνο στους δωρητές"
tra_reinitialiser = "Επαναφορά"
tra_ajdalwdumetier = "Προσθήκη στη Λευκή Λίστα του Ιώβ"
tra_date = "Ημερομηνία"
tra_ajpar = "Προστέθηκε από"
tra_metier = "Job"
tra_gestiondesmetier = "διαχείριση Jobs"
tra_gestiondesmetitreel = "διαχείριση πρόσβαση στην αγορά εργασίας σε πραγματικό χρόνο"
tra_listedesjoueurs = "Λίστα των παικτών στο διακομιστή"
tra_accessi = "Προσβασιμότητα"
tra_info_leak = "Μπορείτε δεν διαχειριστή, όταν εντάχθηκε στο διακομιστή. Μπορείτε λείπουν πληροφορίες. Παρακαλούμε να επανασυνδεθεί. Σας ευχαριστώ."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwipt(z)
Z_Defaut_Languages=7
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Name"
zadmin3 = "Rank"
zmobutan = "Clique direito sobre o jogador"
ajouter = "Adicionar"
ajouterallj = "Adicionar em todos os trabalhos"
zaddlisti = "jogadores"
WhitelistJobSystem = "Sistema de trabalho Whitelist"
zaddsuppr = "Excluir"
zaddsupprall = "Excluir todos os trabalhos"
tra_scrp_nordahl_script = "créditos"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Ajuda-me, dando-me a sua opinião sobre este script"
tra_scrprecherche = "Pesquisar"
tra_scrprecherched = "Com uma Steam_ID, encontrar todas as entradas em uma lista simples"
tra_wlistde = "Whitelist em:"
tra_init = "Inicialização"
tra_receptd = "recebimento de dados"
tra_susermax = "Número de usuários"
tra_legd = "Anti-sobrecarga (Optimization)"
tra_metieactuel = "trabalho real"
tra_publique = "Público"
tra_acceswhitelist = "Acessível apenas com o Whitelist"
tra_groupferme = "Job fechado para todos"
tra_accesvip = "acessível apenas para os doadores"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Adicionar na Whitelist do Job"
tra_date = "Data"
tra_ajpar = "Adicionado por"
tra_metier = "Job"
tra_gestiondesmetier = "gestão Jobs"
tra_gestiondesmetitreel = "gerenciamento de acesso de trabalho em tempo real"
tra_listedesjoueurs = "Lista de jogadores no servidor"
tra_accessi = "Acessibilidade"
tra_info_leak = "Você tinha informação não administrador quando você se juntou ao servidor. Está faltando. Por favor volte a ligar. Obrigado."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwipl(z)
Z_Defaut_Languages=8
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nazwa"
zadmin3 = "Pozycja"
zmobutan = "Kliknij prawym przyciskiem myszy na odtwarzaczu"
ajouter = "Dodaj"
ajouterallj = "Dodaj we wszystkich miejscach pracy"
zaddlisti = "Gracze"
WhitelistJobSystem = "Biała system pracy"
zaddsuppr = "Usuń"
zaddsupprall = "Usuń ze wszystkich miejsc pracy"
tra_scrp_nordahl_script = "Kredyty"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Pomóż mi, dając mi swoją opinię na temat tego skryptu"
tra_scrprecherche = "Szukaj"
tra_scrprecherched = "Z Steam_ID, znaleźć wszystkie wpisy w prostej listy"
tra_wlistde = "Biała on:"
tra_init = "Inicjalizacja"
tra_receptd = "odbiór danych"
tra_susermax = "Liczba użytkowników"
tra_legd = "Anti-przeciążeniowe (Optymalizacja)"
tra_metieactuel = "rzeczywistej pracy"
tra_publique = "Publiczne"
tra_acceswhitelist = "Dostępna tylko z Biała"
tra_groupferme = "Praca zamknięte dla wszystkich"
tra_accesvip = "Dostępna tylko dla darczyńców"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Add w Joba białej listy"
tra_date = "Data"
tra_ajpar = "Dodane przez"
tra_metier = "Praca"
tra_gestiondesmetier = "Praca management"
tra_gestiondesmetitreel = "Zarządzanie w czasie rzeczywistym dostęp do zatrudnienia"
tra_listedesjoueurs = "Lista graczy na serwerze"
tra_accessi = "Dostępność"
tra_info_leak = "Ty nie jesteś administratorem, kiedy dołączył do serwera. brakuje informacji. Proszę ponownie. Dziękuję."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiit(z)
Z_Defaut_Languages=9
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nome"
zadmin3 = "Rank"
zmobutan = "Fare clic destro sul giocatore"
Aggiungi = "Aggiungi"
ajouterallj = "Aggiungere in tutti i posti di lavoro"
zaddlisti = "Players"
WhitelistJobSystem = "Job System White list"
zaddsuppr = "Cancella"
zaddsupprall = "Elimina da tutti i lavori"
tra_scrp_nordahl_script = "Crediti"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Aiutami dandomi la tua opinione su questo script"
tra_scrprecherche = "Ricerca"
tra_scrprecherched = "Con un Steam_ID, trovare tutte le voci in un elenco semplice"
tra_wlistde = "Whitelist su:"
tra_init = "inizializzazione"
tra_receptd = "la ricezione dei dati"
tra_susermax = "Numero di utenti"
tra_legd = "anti-sovraccarico (Ottimizzazione)"
tra_metieactuel = "Actual lavoro"
tra_publique = "Pubblico"
tra_acceswhitelist = "accessibile solo con la White list"
tra_groupferme = "Job chiuso per tutti"
tra_accesvip = "accessibile solo ai donatori"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Aggiungi a Lista bianca del lavoro"
tra_date = "Data"
tra_ajpar = "Added by"
tra_metier = "Job"
tra_gestiondesmetier = "gestione dei processi"
tra_gestiondesmetitreel = "la gestione degli accessi di lavoro in tempo reale"
tra_listedesjoueurs = "Lista dei giocatori nel server"
tra_accessi = "Accessibilità"
tra_info_leak = "hai informazioni non admin quando ti sei iscritto il server. Ti manca. Si prega di riconnessione. Grazie."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwibg(z)
Z_Defaut_Languages=10
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Име"
zadmin3 = "Място"
zmobutan = "Кликнете с десния бутон на плейъра"
ajouter = "Добави"
ajouterallj = "Добавяне на всички работни места"
zaddlisti = "Играчите"
WhitelistJobSystem = "Бял списък Система за работа"
zaddsuppr = "Изтриване"
zaddsupprall = "Изтриване от всички работни места"
tra_scrp_nordahl_script = "Кредити"
tra_scrp_nordahl_credit = "Произведено от Nordahl"
tra_scrp_nordahl_note = "Помогни ми, като ми вашето мнение по този скрипт"
tra_scrprecherche = "Търсене"
tra_scrprecherched = "С Steam_ID, намерите всички записи в един прост списък"
tra_wlistde = "Бял списък на:"
tra_init = "Инициализация"
tra_receptd = "получаване на данни"
tra_susermax = "Брой на потребителите"
tra_legd = "Anti-претоварване (Оптимизиране)"
tra_metieactuel = "Край на работа"
tra_publique = "Public"
tra_acceswhitelist = "Достъпна само с списъка с разрешени адреси"
tra_groupferme = "Job затворен за всички"
tra_accesvip = "достъпни само за дарителите"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Добави в белия списък на Йов"
tra_date = "Дата"
tra_ajpar = "Добавена от"
tra_metier = "Работа"
tra_gestiondesmetier = "Управление на работни места"
tra_gestiondesmetitreel = "в реално време за управление на достъп до работа"
tra_listedesjoueurs = "Списък на играчите в сървъра"
tra_accessi = "Достъпност"
tra_info_leak = "Вие не администратор, когато се присъедини към сървъра. Вие сте липсва информация. Моля, свържете отново. Благодаря ви."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwics(z)
Z_Defaut_Languages=11
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Název"
zadmin3 = "Rank"
zmobutan = "Klikněte pravým tlačítkem myši na přehrávači"
ajouter = "Add"
ajouterallj = "Přidat do všech pracovních míst"
zaddlisti = "Hráči"
WhitelistJobSystem = "System Seznam povolených Job"
zaddsuppr = "Delete"
zaddsupprall = "Smazat ze všech pracovních míst"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Pomoz mi tím, že mi váš názor na tento skript"
tra_scrprecherche = "Search"
tra_scrprecherched = "S Steam_ID, kde najdete všechny položky v jednoduchém seznamu"
tra_wlistde = "Seznam povolených na"
tra_init = "Inicializace"
tra_receptd = "Data příjem"
tra_susermax = "Počet uživatelů"
tra_legd = "Anti-přetížení (Optimalizace)"
tra_metieactuel = "Skutečná práce"
tra_publique = "Public"
tra_acceswhitelist = "přístupné pouze po zadání Seznam povolených"
tra_groupferme = "uzavřené práce pro každého"
tra_accesvip = "přístupné pouze donátorů"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Přidat do Whitelist úkolu"
tra_date = "Datum"
tra_ajpar = "Přidal"
tra_metier = "Job"
tra_gestiondesmetier = "Správa Jobs"
tra_gestiondesmetitreel = "Správa přístup k zaměstnání v reálném čase"
tra_listedesjoueurs = "Seznam hráčů na serveru"
tra_accessi = "dostupnost"
tra_info_leak = "Vy jste admin, když se připojil k serveru. Zde jsou chybějící informace. Prosím připojte. Děkuji."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiet(z)
Z_Defaut_Languages=12
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nimi"
zadmin3 = "Koht"
zmobutan = "Paremklõps mängija"
ajouter = "Lisa"
ajouterallj = "Lisa kõik töökohad"
zaddlisti = "Mängijad"
WhitelistJobSystem = "valgesse nimekirja Töö System"
zaddsuppr = "Kustuta"
zaddsupprall = "Kustuta kõik töökohad"
tra_scrp_nordahl_script = "Autorid"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Aita mind, andes mulle oma arvamuse selle skripti"
tra_scrprecherche = "Otsi"
tra_scrprecherched = "Mis Steam_ID, leida kõik kirjed lihtsa nimekirja"
tra_wlistde = "Whitelisti kohta:"
tra_init = "Initialisation"
tra_receptd = "Andmete kättesaamisel"
tra_susermax = "Kasutajate arv"
tra_legd = "Anti-ülekoormus (optimeerimine)"
tra_metieactuel = "Tegelik töö"
tra_publique = "Avalik"
tra_acceswhitelist = "Kasutatav ainult valgesse nimekirja"
tra_groupferme = "Töö suletud kõigile"
tra_accesvip = "Kasutatav ainult annetajad"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Lisada Töö valge nimekiri"
tra_date = "Date"
tra_ajpar = "Lisatud"
tra_metier = "Töö"
tra_gestiondesmetier = "Jobs juhtimine"
tra_gestiondesmetitreel = "Reaalajas juurdepääs tööle juhtimine"
tra_listedesjoueurs = "Nimekiri mängijad server"
tra_accessi = "Hõlbustus"
tra_info_leak = "Sa ei admin kui liitus server. Sa puuduvad andmed. Palun ühendage. Aitäh."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwifi(z)
Z_Defaut_Languages=13
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nimi"
zadmin3 = "Rank"
zmobutan = "oikealla klikkaa pelaaja"
ajouter = "Add"
ajouterallj = "Lisää kaikki työt"
zaddlisti = "Pelaajat"
WhitelistJobSystem = "valkoinen lista Job System"
zaddsuppr = "Poista"
zaddsupprall = "Poista kaikki työt"
tra_scrp_nordahl_script = "Laajuus"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Auta minua antamalla minulle mielipiteenne tästä kirjoitus"
tra_scrprecherche = "Etsi"
tra_scrprecherched = "Kun Steam_ID, löytää kaikki merkinnät pelkkä luettelo"
tra_wlistde = "valkoinen lista on:"
tra_init = "Alustus"
tra_receptd = "Data kuitti"
tra_susermax = "Käyttäjien lukumäärä"
tra_legd = "Anti-ylikuorma (optimointi)"
tra_metieactuel = "Todellinen työ"
tra_publique = "Public"
tra_acceswhitelist = "Esteetön vain valkoinen lista"
tra_groupferme = "Job suljettu kaikille"
tra_accesvip = "Esteetön vain lahjoittajia"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Lisää joukkoon Jobin Whitelist"
tra_date = "Date"
tra_ajpar = "Lisääjä"
tra_metier = "työ"
tra_gestiondesmetier = "Jobs hallinta"
tra_gestiondesmetitreel = "Reaaliaikainen työn saanti hallinta"
tra_listedesjoueurs = "List of pelaajia palvelin"
tra_accessi = "Esteettömyys"
tra_info_leak = "Et admin kun liittynyt palvelimelle. Sinulta puuttuvat tiedot. Muodosta yhteys uudelleen. Kiitos."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwija(z)
Z_Defaut_Languages=14
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "名前"
zadmin3 = "ランク"
zmobutan = "プレイヤー上で右クリックして"
ajouter = "追加"
ajouterallj = "すべてのジョブに追加"
zaddlisti = "プレイヤー"
WhitelistJobSystem = "ホワイトリストジョブ・システム"
zaddsuppr = "削除"
zaddsupprall = "すべてのジョブから削除"
tra_scrp_nordahl_script = "クレジット"
tra_scrp_nordahl_credit = "Nordahl製"
tra_scrp_nordahl_note = "このスクリプトに私にあなたの意見を与えることによって、私を助けて"
tra_scrprecherche = "検索"
tra_scrprecherched = "Steam_IDでは、単純なリスト内のすべてのエントリを検索します"
tra_wlistde = "上のホワイトリスト："
tra_init = "初期化"
tra_receptd = "データ受信"
tra_susermax = "ユーザー数"
tra_legd = "アンチ過負荷（最適化）"
tra_metieactuel = "実際の仕事"
tra_publique = "公開"
tra_acceswhitelist ="アクセスしやすいだけでホワイトリスト "
tra_groupferme = "仕事を皆のため閉鎖しました"
tra_accesvip = "のみ寄付者へのバリアフリー"
tra_reinitialiser= "リセット"
tra_ajdalwdumetier ="ジョブのホワイトリストに追加"
tra_date = "日"
tra_ajpar = "によって追加されました"
tra_metier = "仕事"
tra_gestiondesmetier ="ジョブ管理"
tra_gestiondesmetitreel = "リアルタイムジョブアクセス管理"
tra_listedesjoueurs = "サーバーのプレイヤーの一覧"
tra_accessi = "アクセシビリティ"
tra_info_leak = "サーバーに参加したときは、管理者はなかった。あなたは情報が不足している。再接続してください。ありがとうございます。"
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiko(z)
Z_Defaut_Languages=15
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "이름"
zadmin3 = "순위"
zmobutan = "오른쪽 플레이어를 클릭"
ajouter = "추가"
ajouterallj = "모든 작업에 추가"
zaddlisti = "플레이어"
WhitelistJobSystem = "허용 된 사이트 목록 작업 시스템"
zaddsuppr = "삭제"
zaddsupprall = "모든 작업에서 삭제"
tra_scrp_nordahl_script = "학점"
tra_scrp_nordahl_credit = "Nordahl에 의해 만들어"
tra_scrp_nordahl_note = "이 스크립트에 나에게 의견을 제공하여 도와주세요"
tra_scrprecherche = "검색"
tra_scrprecherched = "는 Steam_ID으로, 간단한 목록에있는 모든 항목을 찾을 수 있습니다"
tra_wlistde = "에 대한 화이트리스트"
tra_init = "초기화"
tra_receptd = "데이터 수신"
tra_susermax = "사용자 수"
tra_legd = "안티 - 과부하 (최적화)"
tra_metieactuel = "실제 작업"
tra_publique = '공개'
tra_acceswhitelist = "액세스 전용으로 화이트리스트"
tra_groupferme = "작업이 모두 폐쇄"
tra_accesvip = "만 기부자에 접근"
tra_reinitialiser = "재설정"
tra_ajdalwdumetier = "작업의 화이트리스트에 추가"
tra_date = "날짜"
tra_ajpar = "작성자"
tra_metier = "작업"
tra_gestiondesmetier = "작업 관리"
tra_gestiondesmetitreel = "실시간 작업 액세스 관리"
tra_listedesjoueurs = "서버에서 선수 목록"
tra_accessi = "접근성"
tra_info_leak = "당신은. 서버에 가입하지 않을 경우 관리. 당신은 누락 된 정보를 다시 연결하십시오 않았다. 감사합니다."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwilv(z)
Z_Defaut_Languages=16
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nosaukums"
zadmin3 = "Rank"
zmobutan = "Tiesības, noklikšķiniet uz atskaņotāja"
ajouter = "Pievienot"
ajouterallj = "Pievienot visās darba vietām"
zaddlisti = "Spēlētāji"
WhitelistJobSystem = "baltais saraksts Job System"
zaddsuppr = "Dzēst"
zaddsupprall = "Dzēst no visām darba vietām"
tra_scrp_nordahl_script = "Kredīti"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Palīdzi man, dodot man savu viedokli par šo programmu"
tra_scrprecherche = "Meklēt"
tra_scrprecherched = "Ar Steam_ID, atrast visus ierakstus vienkāršā sarakstā"
tra_wlistde = "baltais saraksts uz:"
tra_init = "uzsākšana"
tra_receptd = "Datu saņemšana"
tra_susermax = "lietotāju skaits"
tra_legd = "Anti-Pārslodze (optimizācija)"
tra_metieactuel = "Faktiskā Job"
tra_publique = "Public"
tra_acceswhitelist = "Pieejama tikai ar baltais saraksts"
tra_groupferme = "Job slēgta ikvienam"
tra_accesvip = "Pieejama tikai ziedotājiem"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Pievienot in darbs baltajam sarakstam"
tra_date = "Datums"
tra_ajpar = "Pievienots"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs vadība"
tra_gestiondesmetitreel = "Reālā laika darba pieejamība vadība"
tra_listedesjoueurs = "Saraksts Dalībnieku servera"
tra_accessi = "Pieejamība"
tra_info_leak = "Jums nav admin kad tu pievienojies serverim. Jūs trūkstošo informāciju. Lūdzu, pievienojiet. Paldies."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwino(z)
Z_Defaut_Languages=17
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Navn"
zadmin3 = "Rank"
zmobutan = "Høyreklikk på spilleren"
ajouter = "Legg til"
ajouterallj = "Legg til i alle jobber"
zaddlisti = "spillere"
WhitelistJobSystem = "Whitelist Job System"
zaddsuppr = "Slett"
zaddsupprall = "Slett fra alle jobber"
tra_scrp_nordahl_script = "Credits"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Hjelp meg ved å gi meg din mening om dette skriptet"
tra_scrprecherche = "Søk"
tra_scrprecherched = "Med en steamid, finne alle oppføringer i en enkel liste"
tra_wlistde = "Whitelist på:"
tra_init = "Initial"
tra_receptd = "Data kvittering"
tra_susermax = "Antall brukere"
tra_legd = "Anti-Load (optimalisering)"
tra_metieactuel = "selve jobben"
tra_publique = "Public"
tra_acceswhitelist = "Tilgjengelig kun med hviteliste"
tra_groupferme = "Job stengt for alle"
tra_accesvip = "Tilgjengelig kun til givere"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Legg til i Jobs Whitelist"
tra_date = "Dato"
tra_ajpar = "Lagt til av"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs management"
tra_gestiondesmetitreel = "Real time jobb access management"
tra_listedesjoueurs = "Liste over spillere i serveren"
tra_accessi = "Tilgjengelighet"
tra_info_leak = "Du har ikke admin når du ble med serveren. Du mangler informasjon. Vennligst koble til igjen. Takk."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwiro(z)
Z_Defaut_Languages=18
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Nume"
zadmin3 = "Locul"
zmobutan = "Click dreapta pe player-ul"
ajouter = "Adăugați"
ajouterallj = "Adăugați în toate locurile de muncă"
zaddlisti = "Players"
WhitelistJobSystem = "Sistem de locuri de muncă de listă albă"
zaddsuppr = "Șterge"
zaddsupprall = "Șterge din toate locurile de muncă"
tra_scrp_nordahl_script = "credite"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Ajută-mă dându-mi părerea despre acest script"
tra_scrprecherche = "Căutare"
tra_scrprecherched = "Cu un Steam_ID, găsiți toate intrările dintr-o listă simplă"
tra_wlistde = "lista albă:"
tra_init = "Inițializarea"
tra_receptd = "primirea de date"
tra_susermax = "Numărul de utilizatori"
tra_legd = "Anti-suprasarcină (optimizare)"
tra_metieactuel = "locul de muncă actual"
tra_publique = "Public"
tra_acceswhitelist = "Accesibil numai cu Exceptate"
tra_groupferme = "Iov închis pentru toată lumea"
tra_accesvip = "accesibilă numai donatorilor"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Adauga in Lista albă Job-ului"
tra_date = "Data"
tra_ajpar = "Adăugat de"
tra_metier = "Iov"
tra_gestiondesmetier = "Management Locuri de munca"
tra_gestiondesmetitreel = "managementul accesului de locuri de muncă în timp real"
tra_listedesjoueurs = "Lista de jucători în server"
tra_accessi = "Accesibilitate"
tra_info_leak = "Tu ai informații nu admin când a aderat la server. Vă lipsesc. Vă rugăm să reconectați. Vă mulțumesc."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwisv(z)
Z_Defaut_Languages=19
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Namn"
zadmin3 = "Rank"
zmobutan = "Högerklicka på spelaren"
ajouter = "Lägg till"
ajouterallj = "Lägg i alla jobb"
zaddlisti = "Spelare"
WhitelistJobSystem = "vitlista Job System"
zaddsuppr = "Delete"
zaddsupprall = "Ta bort från alla jobb"
tra_scrp_nordahl_script = "Tack"
tra_scrp_nordahl_credit = "Made by Nordahl"
tra_scrp_nordahl_note = "Hjälp mig genom att ge mig din åsikt om detta script"
tra_scrprecherche = "Sök"
tra_scrprecherched = "Med en Steam_ID, hitta alla poster i en enkel lista"
tra_wlistde = "vitlista på:"
tra_init = "Initiering"
tra_receptd = "Data kvitto"
tra_susermax = "Antal användare"
tra_legd = "Anti-överbelastning (Optimization)"
tra_metieactuel = "Verklig jobb"
tra_publique = "Public"
tra_acceswhitelist = "Tillgänglig endast med vitlista"
tra_groupferme = "Job stängd för alla"
tra_accesvip = "Tillgänglig endast till donator"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Lägg i Jobs vitlista"
tra_date = "Date"
tra_ajpar = "Inlagd av"
tra_metier = "Job"
tra_gestiondesmetier = "Jobs management"
tra_gestiondesmetitreel = "Realtids tillgång jobbhantering"
tra_listedesjoueurs = "Förteckning över spelare i servern"
tra_accessi = "Handikappstöd"
tra_info_leak = "Du har informationen inte admin när du gick med servern. Du saknar. Försök återansluta. Tack."
tra_regl_stat_job="Set the jobs' status"
end
function languejobwitr(z)
Z_Defaut_Languages=20
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
tra_nom = "Ad"
zadmin3 = "Rank"
zmobutan = "Sağ oyuncu tıklayın"
ajouter = "Ekle"
ajouterallj = "Tüm işlerde Ekle"
zaddlisti = "Oyuncular"
WhitelistJobSystem = "Beyaz liste İş Sistemi"
zaddsuppr = "Sil"
zaddsupprall = "bütün işlerden Sil"
tra_scrp_nordahl_script = "Kredi"
tra_scrp_nordahl_credit = "Nordahl tarafından yapılmıştır"
tra_scrp_nordahl_note = "Bu senaryo üzerinde bana Düşüncelerinizi vererek bana yardım"
tra_scrprecherche = "Ara"
tra_scrprecherched = "a Steam_ID ile basit bir listedeki tüm girdileri bulmak"
tra_wlistde = "konulu Beyaz liste:"
tra_init = "Bafllatma"
tra_receptd = "Veri makbuz"
tra_susermax = "kullanıcı sayısı"
tra_legd = "Anti-Aşırı yük (Optimizasyon)"
tra_metieactuel = "Gerçek iş"
tra_publique = "Public"
tra_acceswhitelist = "Erişilebilir yalnızca Beyaz Liste"
tra_groupferme = "İş herkes için kapalı"
tra_accesvip = "sadece bağışçıların Erişilebilir"
tra_reinitialiser = "Reset"
tra_ajdalwdumetier = "Eyüp Beyaz Listede Ekle"
tra_date = "Tarih"
tra_ajpar = "tarafından eklendi"
tra_metier = "İş"
tra_gestiondesmetier = "İşler yönetimi"
tra_gestiondesmetitreel = "Gerçek zamanlı bir iş erişim yönetimi"
tra_listedesjoueurs = "sunucudaki oyuncuların listesi"
tra_accessi = "Erişilebilirlik"
tra_info_leak = "Sen. sunucuyu katıldığında admin. Sen eksik bilgileri yeniden Lütfen etmedi. Teşekkür ederim."
tra_regl_stat_job="Set the jobs' status"
end
if Z_Defaut_Languages==1 then
languejobwifr(1)
elseif Z_Defaut_Languages==2 then
languejobwien(2)
elseif Z_Defaut_Languages==3 then
languejobwies(3)
elseif Z_Defaut_Languages==4 then
languejobwidu(4)
elseif Z_Defaut_Languages==5 then
languejobwiru(5)
elseif Z_Defaut_Languages==6 then
languejobwiel(6)
elseif Z_Defaut_Languages==7 then
languejobwipt(7)
elseif Z_Defaut_Languages==8 then
languejobwipl(8)
elseif Z_Defaut_Languages==9 then
languejobwiit(9)
elseif Z_Defaut_Languages==10 then
languejobwibg(10)
elseif Z_Defaut_Languages==11 then
languejobwics(11)
elseif Z_Defaut_Languages==12 then
languejobwiet(12)
elseif Z_Defaut_Languages==13 then
languejobwifi(13)
elseif Z_Defaut_Languages==14 then
languejobwija(14)
elseif Z_Defaut_Languages==15 then
languejobwiko(15)
elseif Z_Defaut_Languages==16 then
languejobwilv(16)
elseif Z_Defaut_Languages==17 then
languejobwino(17)
elseif Z_Defaut_Languages==18 then
languejobwiro(18)
elseif Z_Defaut_Languages==19 then
languejobwisv(19)
elseif Z_Defaut_Languages==20 then
languejobwitr(20)
else
languejobwien(2)
end
end

local ZMODAsecu=nil
local dontreadasecondtime=nil
local Nordah_Whitelist_Job = {}
if ZMODAsecu==nil then
ZMODAsecu=1
if SERVER then
local norrep=0
local function optim(a,b,c)
if eRight(a)==true then
if c[1]==nil then
if norrep==0 then norrep=norrep+1 
print("Nordahl: 'Hello, :) Your command is not complet. Instert the number of month to delete the old entries, like 'whitelist_suppressor_oldentries 4' to remove entries older than 4 months. Don't make me repeat please. ^^'") 
elseif norrep==1 then norrep=norrep+1 
print("Nordahl: 'You?  Read my previous message please... USES THE NUMBERS!!!'")
elseif norrep==2 then norrep=norrep+1 
print("Nordahl: 'Anyway... Good luck :3'")
else
print("Nordahl: '...'")
end
return end
local m=os.date("%m")-c[1]
local y
local mo
if m<=0 then
m=m+12
y=(os.date("%Y")-1)
else
y=(os.date("%Y"))
end
if m<10 then mo="0" else mo="" end
local res=os.date(y.." / "..mo..m.." / %d")
print("All entrie more old than '(YYYY / MM / DD) "..os.date(y.." / "..mo..m.." / %d").."' will be deleted")
for k,v in pairs(ZJOBwhitelist)do
local dt=string.Explode( " ", v[5] )
local n=string.Explode( "/", dt[1] )
local jleJ=n[2]
local jlem=n[1]
local jleAn="20"..n[3]
local nomb=0
if os.date(jleAn.." / "..jlem.." / "..jleJ)<=res then
nomb=nomb+1
table.remove(ZJOBwhitelist,k)
print("Whitelist Job number Entries deleted: "..nomb)
end
end
file.Write( "zwhitelistjobdata/whitelistjob.txt",util.TableToJSON(ZJOBwhitelist))
end
end
concommand.Add("whitelist_suppressor_oldentries",optim)

if WJL_CONFIG.USeWorkshopContent==1 then
resource.AddWorkshop("493897275")
end
if WJL_CONFIG.F1_to_Open_the_planning==1 then
local function ShowHelp(ply)
ply:ConCommand("whitelist_systemjob")
return false
end
hook.Add("ShowHelp", "ShowHelp", ShowHelp)
end
if dontreadasecondtime==nil then
dontreadasecondtime=1
ZJOBwhitelist={}
local str= file.Read( "zwhitelistjobdata/whitelistjob.txt", "DATA" )
if str==nil then
file.CreateDir("zwhitelistjobdata")
file.Write( "zwhitelistjobdata/whitelistjob.txt", "[]" )
else
local tbl = util.JSONToTable( str )
for k,v in pairs(tbl)do
table.insert(ZJOBwhitelist,v)
end
end

Add_Job_In_the_Whiteliste = {}
local str= file.Read( "zwhitelistjobdata/jobsetting.txt", "DATA" )
if str==nil then
file.CreateDir("zwhitelistjobdata")
file.Write( "zwhitelistjobdata/jobsetting.txt", "[]" )
else
local tbl = util.JSONToTable( str )
for i,o in pairs(tbl)do
Add_Job_In_the_Whiteliste[i]=o
end
end
end
end

function Nordah_Whitelist_Job.AddCommand( func, name )
local newfunc = function( ply, cmd, args ) 
local target = Nordah_Whitelist_Job.GetPlayer( args[1] )
if name=="wjs_goto" or name=="wjs_bring" then 
else
if not target or not eRight(ply) or(ply==target and name=="wjs_superadmin") then return end 
end
func( ply, cmd, args ) 
end
concommand.Add( name, newfunc )
end

function Nordah_Whitelist_Job.GetPlayer( id )
if id==nil then return end
local ply = Entity( id )
if not IsValid( ply ) or not ply:IsPlayer() then return end
return ply
end
Nordah_Whitelist_Job.Commands = {}
--Nordah_Whitelist_Job.Tabs = {}
function Nordah_Whitelist_Job.RegisterCommand( name, commandname, chatcmd, args, override )
table.insert( Nordah_Whitelist_Job.Commands, { Name = name, CommandName = commandname, ChatCmd = chatcmd, Args = args, ArgOverride = override } )
end
-- function Nordah_Whitelist_Job.AddMenuTab( name, icon, desc, panelfunc, func )
-- table.insert( Nordah_Whitelist_Job.Tabs, { Name = name, PanelFunc = panelfunc, Icon = icon, Desc = desc, Func = func } )
-- end

if CLIENT then
function Nordah_Whitelist_Job_Menu( ply, cmd, args )
if zwjlist==nil then print(tra_info_leak) return end
if eRight(ply)==false then print("Whitelist System: You are not Admin") return end
surface.PlaySound("ambient/machines/keyboard1_clicks.wav")
local Menu = vgui.Create("DFrame")
Menu:SetSize(800,ScrH()/2)
Menu:SetPos(ScrW()/2-Menu:GetWide()/2,ScrH()/2-Menu:GetTall()/2)
Menu:SetTitle(" ")
Menu:SetDraggable(true)
Menu:ShowCloseButton(false)
Menu:MakePopup()
Menu.Paint=function()



if sysjobwi=="1" then


if nord_s_skin=="1" then
draw.RoundedBox(0,0,0,Menu:GetWide(),Menu:GetTall(),Color(0,0,100,255))
draw.RoundedBox(0,1,1,Menu:GetWide()-2,Menu:GetTall()-2,Color(0,0,0,255))
draw.RoundedBox(0,1,1,Menu:GetWide()-2,22,Color(0,0,50,255))
draw.SimpleText(WhitelistJobSystem..wjl, "Trebuchet18", 28, 13, Color(26,138,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
elseif nord_s_skin=="2" then
draw.SimpleText(WhitelistJobSystem..wjl, "Trebuchet24", 28, 12, Color(26,138,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
else
draw.RoundedBox(8,0,0,Menu:GetWide(),Menu:GetTall(),Color(26,138,200,255))
draw.RoundedBox(8,1,1,Menu:GetWide()-2,Menu:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,2,1,Menu:GetWide()-4,5,Color(26,138,200,100))
draw.SimpleText(WhitelistJobSystem..wjl, "Trebuchet18", 28, 13, Color(0,0,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,5,16,16)

elseif sysjobwi=="0" then

if nord_s_skin=="1" then
draw.RoundedBox(0,0,0,Menu:GetWide(),Menu:GetTall(),Color(100,0,0,255))
draw.RoundedBox(0,1,1,Menu:GetWide()-2,Menu:GetTall()-2,Color(0,0,0,255))
draw.RoundedBox(0,1,1,Menu:GetWide()-2,22,Color(50,0,0,255))
draw.SimpleText(WhitelistJobSystem..wjl.." (OFF)", "Trebuchet18", 28, 13, Color(255,200,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
elseif nord_s_skin=="2" then
draw.SimpleText(WhitelistJobSystem..wjl.." (OFF)", "Trebuchet18", 28, 13, Color(255,200,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
else
draw.RoundedBox(8,0,0,Menu:GetWide(),Menu:GetTall(),Color(170,0,0,255))
draw.RoundedBox(8,1,1,Menu:GetWide()-2,Menu:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,2,1,Menu:GetWide()-4,5,Color(200,26,138,100))
draw.SimpleText(WhitelistJobSystem..wjl.." (OFF)", "Trebuchet18", 28, 13, Color(255,200,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
surface.SetDrawColor(255,200,200,255) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,5,16,16)

end

end
local Text = vgui.Create("DLabel",Menu)
Text:SetText("")
Text:SizeToContents()
Text:SetPos(10,100)
Text:SetSize(800,40)
Text:SetFont("Trebuchet24")
local button=vgui.Create("DButton",Menu)button:SetText("")button:SetSize(16,16)
button.Paint=function()draw.RoundedBox(8,0,0,button:GetWide(),button:GetTall(),Color(0,0,0,0))
end
button:SetPos(Menu:GetWide()-45,5)local zmodcm=vgui.Create("DImage",Menu)zmodcm:SetImage("icon16/Wrench.png")zmodcm:SetSize(16,16)zmodcm:SetPos(Menu:GetWide()-45,5)button.DoClick=function()surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
--------------------------
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu("Languages")
optMenu:SetIcon("icon16/world.png")
local flche=""
if Z_Defaut_Languages==1 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Français",function()file.Write("nordahlclient_option/language.txt","1")languejobwifr()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/fr.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==2 then flche=puce else flche="" end 
subMenu:AddOption(flche.."English",function()file.Write("nordahlclient_option/language.txt","2")languejobwien()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/en.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==3 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Español",function()file.Write("nordahlclient_option/language.txt","3")languejobwies()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/es.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==4 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Deutsch",function()file.Write("nordahlclient_option/language.txt","4")languejobwidu()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/de.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==5 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Russian",function()file.Write("nordahlclient_option/language.txt","5")languejobwiru()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ru.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==6 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Greek",function()file.Write("nordahlclient_option/language.txt","6")languejobwiel()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/el.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==7 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Portuguese",function()file.Write("nordahlclient_option/language.txt","7")languejobwipt()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/pt.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==8 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Polish",function()file.Write("nordahlclient_option/language.txt","8")languejobwipl()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/pl.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==9 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Italian",function()file.Write("nordahlclient_option/language.txt","9")languejobwiit()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/it.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==10 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Bulgarian",function()file.Write("nordahlclient_option/language.txt","10")languejobwibg()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/bg.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==11 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Czech",function()file.Write("nordahlclient_option/language.txt","11")languejobwics()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/cs.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==12 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Estonian",function()file.Write("nordahlclient_option/language.txt","12")languejobwiet()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/et.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==13 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Finnish",function()file.Write("nordahlclient_option/language.txt","13")languejobwifi()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/fi.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==14 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Japanese",function()file.Write("nordahlclient_option/language.txt","14")languejobwija()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ja.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==15 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Korean",function()file.Write("nordahlclient_option/language.txt","15")languejobwiko()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ko.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==16 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Latvian",function()file.Write("nordahlclient_option/language.txt","16")languejobwilv()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/lv.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==17 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Norwegian",function()file.Write("nordahlclient_option/language.txt","17")languejobwino()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/no.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==18 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Romanian",function()file.Write("nordahlclient_option/language.txt","18")languejobwiro()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/ro.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==19 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Swedish",function()file.Write("nordahlclient_option/language.txt","19")languejobwisv()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/sv.png")
subMenu:AddSpacer()
if Z_Defaut_Languages==20 then flche=puce else flche="" end 
subMenu:AddOption(flche.."Turkish",function()file.Write("nordahlclient_option/language.txt","20")languejobwitr()Menu:Close()
Nordah_Whitelist_Job_Menu(ply)end):SetImage("ngui/la/tr.png")
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4:AddSpacer()
local subMenu,optMenu=z4:AddSubMenu("Panel Skin")
optMenu:SetIcon("icon16/application_double.png")
subMenu:AddOption("Original Skin",function()LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)file.Write("nordahlclient_option/nord_s_skin.txt","0")nord_s_skin="0" end):SetImage("icon16/application_double.png")
subMenu:AddSpacer()
subMenu:AddOption("Skin 1",function()LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)file.Write("nordahlclient_option/nord_s_skin.txt","1")nord_s_skin="1" end):SetImage("icon16/application_double.png")
subMenu:AddSpacer()
subMenu:AddOption("Skin 2",function()LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)file.Write("nordahlclient_option/nord_s_skin.txt","2")nord_s_skin="2" end):SetImage("icon16/application_double.png")
z4:AddSpacer()
local subMenu,optMenu=z4:AddSubMenu(tra_scrp_nordahl_script)
optMenu:SetIcon("icon16/wand.png")
subMenu:AddOption(tra_scrp_nordahl_credit,function()gui.OpenURL("https://scriptfodder.com/users/view/76561198033784269") end):SetImage("ngui/nordahl.png")
subMenu:AddSpacer()
subMenu:AddOption(tra_scrp_nordahl_note.." :)",function()gui.OpenURL("https://scriptfodder.com/scripts/view/1402/reviews") end):SetImage("icon16/star.png")
subMenu:AddSpacer()
subMenu:AddOption("Workshop Content",function()gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=493897275") end)
z4:AddSpacer()
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4:Open()
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
--------------------------
end

local button=vgui.Create("DButton",Menu)
button:SetText("")
button:SetSize(16,16)
button:SetPos(Menu:GetWide()-25,5)
button.Paint=function()draw.RoundedBox(8,0,0,0,0,Color(0,0,0,0))
end
local zmodcm=vgui.Create("DImage",Menu)
zmodcm:SetImage("icon16/cross.png")
zmodcm:SetSize(16,16)
zmodcm:SetPos(Menu:GetWide()-25,5)
button.DoClick=function()
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
Menu:Close()
end
local button=vgui.Create("DButton",Menu)
button:SetText("")
button:SetSize(16,16)
button:SetPos(Menu:GetWide()-23-21-21,5)
button.Paint=function()draw.RoundedBox(8,0,0,0,0,Color(0,0,0,0))
end
local zmodcm=vgui.Create("DImage",Menu)
zmodcm:SetImage("icon16/arrow_refresh.png")
zmodcm:SetSize(16,16)
zmodcm:SetPos(Menu:GetWide()-23-21-21,5)
button.DoClick=function()
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
Menu:Close()
Nordah_Whitelist_Job_Menu(ply)
end
if eRight(ply)==false then return end
local xsize = 600
local ysize = 500
local players = {}
local list = vgui.Create( "DPropertySheet", Menu )
local MenuGetWide=Menu:GetWide()-9
local MenuGetTall=Menu:GetTall()-30
list.Paint=function()draw.RoundedBox(6,0,20,MenuGetWide,MenuGetTall-20,Color(0,0,0,255))draw.RoundedBox(6,1,21,MenuGetWide-2,MenuGetTall-22,Color(26,138,200,255))draw.RoundedBox(0,0,20,16,16,Color(0,0,0,255))draw.RoundedBox(0,1,21,18,18,Color(26,138,200,255))
end
list:StretchToParent( 4, 24, 4, 4 )
local dpanel = vgui.Create( "DPanel" )
dpanel.InvalidateLayout = function()
if dpanel.List then
dpanel.List:StretchToParent( 0, 35, 0, 0 )
end
end
dpanel.Paint=function()draw.RoundedBox(4,0,0,ScrW()-24,ScrH()-65,Color(0,125,194,255))
end
local listview = vgui.Create( "DListView", dpanel )
listview.Paint=function()
draw.RoundedBox(8,0,0,listview:GetWide(),listview:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listview:GetWide()-2,listview:GetTall()-2,Color(255,255,255,255))
end

col1 = listview:AddColumn(tra_nom)
col4 = listview:AddColumn("Steam_ID")
col2 = listview:AddColumn(tra_metieactuel)
col5 = listview:AddColumn("Distance")
col1:SetMinWidth( 150 )
col4:SetMinWidth( 150 )
col4:SetMaxWidth( 150 )
col2:SetMinWidth( 150 )
col2:SetMaxWidth( 150 )
col5:SetMaxWidth( 150 )

local butan=vgui.Create("DButton",dpanel)
butan:SetText("SteamID Converter")
butan:SetPos(5,5)
butan:SetWide(150)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
-- surface.SetDrawColor(255,255,255,255) 
-- surface.SetMaterial(Material("icon16/cross.png"))surface.DrawTexturedRect(4,4,16,16)
end
butan.DoClick=function()
gui.OpenURL("https://steamid.io/")
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

dpanel.Butan = butan
dpanel.List = listview
dpanel:InvalidateLayout()
list:AddSheet(zaddlisti, dpanel, "icon16/group.png", false, false,tra_listedesjoueurs)
---------------------------------------------------------

local Faitlepanno=vgui.Create("DPanel")
Faitlepanno.InvalidateLayout=function()
if Faitlepanno.List then
Faitlepanno.List:StretchToParent(0,35,0,0)
end
end
Faitlepanno.Paint=function()draw.RoundedBox(4,0,0,ScrW()-24,ScrH()-65,Color(0,125,194,255))
end
local butan=vgui.Create("DButton",Faitlepanno)
butan:SetText("    "..tra_reinitialiser)
butan:SetPos(5,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/cross.png"))surface.DrawTexturedRect(4,4,16,16)
end

local listtt=vgui.Create("DListView",Faitlepanno)

butan.DoClick=function()
surface.PlaySound(Sound( "buttons/button14.wav" ))
Add_Job_In_the_Whiteliste={}
RunConsoleCommand("MetajolistDe")
listtt:Clear()
LUTJ()

end
function LUTJ()
local lignedeu=tra_publique
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
if Add_Job_In_the_Whiteliste[v.Name]==nil then
lignedeu=tra_publique
lignetroi="0"
elseif Add_Job_In_the_Whiteliste[v.Name]=="1" then
lignedeu=tra_acceswhitelist
lignetroi="1"
elseif Add_Job_In_the_Whiteliste[v.Name]=="2" then
lignedeu=tra_groupferme
lignetroi="2"
elseif Add_Job_In_the_Whiteliste[v.Name]=="3" then
lignedeu=tra_accesvip
lignetroi="3"
end
listtt:AddLine(v.Name,lignedeu,lignetroi)

-- for c,f in pairs(Add_Job_In_the_Whiteliste)do
-- if v.Name==c then
-- if f=="0" then
-- lignedeu=tra_acceswhitelist
-- lignetroi="0"
-- elseif f=="1" then
-- lignedeu=tra_acceswhitelist
-- lignetroi="1"
-- elseif f=="2" then
-- lignedeu=tra_groupferme
-- lignetroi="2"
-- end
-- end
-- end
-- listtt:AddLine(v.Name,lignedeu,lignetroi)
end
end
LUTJ()

local butan=vgui.Create("DButton",Faitlepanno)
butan:SetText("")
butan:SetPos(110,5)
butan:SetWide(250)
butan.Paint=function()
if sysjobwi=="1" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,190,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(210,255,210,255))
surface.SetDrawColor( 255,255,255, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
elseif sysjobwi=="0" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(170,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(255,210,210,255))
surface.SetDrawColor( 255,200,200, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
end
if sysjobwi=="1" then
draw.SimpleTextOutlined("Whitelist JOB System ON","BudgetLabel",125+8,11, Color(210,255,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
elseif sysjobwi=="0" then
draw.SimpleTextOutlined("Whitelist JOB System OFF","BudgetLabel",125+8,11, Color(255,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
end
end

butan.DoClick=function()
if sysjobwi=="0" then
LocalPlayer():EmitSound("ui/buttonclick.wav",100,200)
RunConsoleCommand("sysjobwhitelist","1")
elseif sysjobwi=="1" then
RunConsoleCommand("sysjobwhitelist","0")
LocalPlayer():EmitSound("ui/buttonclick.wav",100,160)
end
end

local butan=vgui.Create("DButton",Faitlepanno)
butan:SetText("")
butan:SetPos(365,5)
butan:SetWide(200)
butan.Paint=function()
if sysjobwi=="1" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,190,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(210,255,210,255))
surface.SetDrawColor( 255,255,255, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
elseif sysjobwi=="0" then
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(170,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(2,1,17,butan:GetWide()-2,3,Color(255,210,210,255))
surface.SetDrawColor( 255,200,200, 255 ) 
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect(5,4,16,16)
end
draw.SimpleTextOutlined("Global_"..tra_accessi,"BudgetLabel",108,11, Color(210,255,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
end

local function set_G_line(a,b)
RunConsoleCommand("Metajourmalist_G",a,b)
Metajolist_f_G(LocalPlayer(),"Metajolist_f_G",{a})
listtt:Clear()
LUTJ()
end

butan.DoClick=function()
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu(tra_regl_stat_job)
optMenu:SetIcon("ngui/wljs.png")
subMenu:AddOption("(Global) "..tra_publique,function()set_G_line("0")end):SetImage("icon16/door_open.png")
subMenu:AddSpacer()
subMenu:AddOption("(Global) "..tra_acceswhitelist,function()set_G_line("1")end):SetImage("icon16/report_add.png")
subMenu:AddSpacer()
subMenu:AddOption("(Global) "..tra_accesvip,function()set_G_line("3")end):SetImage("icon16/coins_add.png")
subMenu:AddSpacer()
subMenu:AddOption("(Global) "..tra_groupferme,function()set_G_line("2")end):SetImage("icon16/delete.png")
subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
z4:Open()
LocalPlayer():EmitSound("ui/buttonclick.wav",100,200)
end

listtt.Paint=function()
draw.RoundedBox(8,0,0,listtt:GetWide(),listtt:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listtt:GetWide()-2,listtt:GetTall()-2,Color(255,255,255,255))
end
Faitlepanno.List=listtt
local col1=listtt:AddColumn(tra_metier)
local col2=listtt:AddColumn(tra_accessi)
col1:SetMinWidth(300)
col1:SetMaxWidth(300)
col2:SetMinWidth(300)
col2:SetMinWidth(300)


local function setline(a,b)
if b!="0" then
Add_Job_In_the_Whiteliste[a]=b
elseif b=="0" then
Add_Job_In_the_Whiteliste[a]=nil
end
RunConsoleCommand("Metajourmalist",a,b)
listtt:Clear()
LUTJ()
end



listtt.OnRowRightClick=function(panel,id,line)
local z4=DermaMenu()
local subMenu,optMenu=z4:AddSubMenu(tra_regl_stat_job)
optMenu:SetIcon("ngui/wljs.png")
local polici=""
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]==nil then polici=puce else polici="" end
subMenu:AddOption(polici..tra_publique,function()setline(line:GetColumnText(1),"0")end):SetImage("icon16/door_open.png")
subMenu:AddSpacer()
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]=="1" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_acceswhitelist,function()setline(line:GetColumnText(1),"1")end):SetImage("icon16/report_add.png")
subMenu:AddSpacer()
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]=="3" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_accesvip,function()setline(line:GetColumnText(1),"3")end):SetImage("icon16/coins_add.png")
subMenu:AddSpacer()
if Add_Job_In_the_Whiteliste[line:GetColumnText(1)]=="2" then polici=puce else polici="" end
subMenu:AddOption(polici..tra_groupferme,function()setline(line:GetColumnText(1),"2")end):SetImage("icon16/delete.png")

subMenu.Paint=function()draw.RoundedBox(4,0,0,subMenu:GetWide(),subMenu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,subMenu:GetWide()-2,subMenu:GetTall()-2,Color(255,255,255,255))end
z4.Paint=function()draw.RoundedBox(4,0,0,z4:GetWide(),z4:GetTall(),Color(0,0,0,255))
draw.RoundedBox(4,1,1,z4:GetWide()-2,z4:GetTall()-2,Color(255,255,255,255))end
z4:Open()
end


list:AddSheet(tra_gestiondesmetier,Faitlepanno,"ngui/wljs.png", false, false,tra_gestiondesmetitreel)



local MakePanelF=vgui.Create("DPanel")
MakePanelF.InvalidateLayout=function()
if MakePanelF.List then
MakePanelF.List:StretchToParent(0,35,0,0)
MakePanelF.Box1:SetPos(0,7)
end
end
MakePanelF.Paint=function()draw.RoundedBox(4,0,0,ScrW()-24,ScrH()-65,Color(0,125,194,255))
end
local textbox1=vgui.Create("DTextEntry",MakePanelF)
textbox1:SetWide(150)
textbox1:SetText("STEAM_0:0:00000000")
MakePanelF.Box1=textbox1
local butan=vgui.Create("DButton",MakePanelF)
butan:SetText("   "..tra_scrprecherche)
butan:SetPos(155,5)
butan:SetWide(150)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/zoom.png"))surface.DrawTexturedRect(4,4,16,16)
end
butan.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
butan.List:Clear()
for k,v in pairs(ZJOBwhitelist)do 
if v[2]==steamid64 then
butan.List:AddLine(steamid64,v[3],v[4],v[5])
end
end
surface.PlaySound(Sound( "buttons/button14.wav" ))
end
local butan2=vgui.Create("DButton",MakePanelF)
butan2:SetText("   "..zaddsupprall)
butan2:SetPos(310,5)
butan2:SetWide(170)
butan2.Paint=function()
draw.RoundedBox(6,0,0,butan2:GetWide(),butan2:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan2:GetWide()-2,butan2:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan2:GetTall()-1-butan2:GetTall()/3,butan2:GetWide()-2,butan2:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/user_delete.png"))surface.DrawTexturedRect(4,4,16,16)
end
butan2.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
RunConsoleCommand("Massremovewhitelist",steamid64)
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local listtrouver=vgui.Create("DListView",MakePanelF)
listtrouver.Paint=function()
draw.RoundedBox(8,0,0,listtrouver:GetWide(),listtrouver:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listtrouver:GetWide()-2,listtrouver:GetTall()-2,Color(255,255,255,255))
end
MakePanelF.List=listtrouver
butan.List=listtrouver
local col1=listtrouver:AddColumn("Steam ID")
col2=listtrouver:AddColumn(tra_nom)
col3=listtrouver:AddColumn(tra_metier)
col4=listtrouver:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

listtrouver.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listtrouver:RemoveLine(id)
Nordah_Whitelist_Job.RemoveJobWhitelist(line:GetColumnText(1),nil,line:GetColumnText(3))
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listtrouver:Clear()
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end
list:AddSheet(tra_scrprecherche,MakePanelF,"icon16/zoom.png", false, false,tra_scrprecherched)


local MakePanelFullacc=vgui.Create("DPanel")
MakePanelFullacc.InvalidateLayout=function()
if MakePanelFullacc.List then
MakePanelFullacc.List:StretchToParent(0,35,0,0)
MakePanelFullacc.Box1:SetPos(0,7)
MakePanelFullacc.Box2:SetPos(165,7)
end
end
MakePanelFullacc.Paint=function()draw.RoundedBox(4,0,0,ScrW()-24,ScrH()-65,Color(0,194,0,255))end
local textbox1=vgui.Create("DTextEntry",MakePanelFullacc)
textbox1:SetWide(150)
textbox1:SetText("STEAM_0:0:00000000")
MakePanelFullacc.Box1=textbox1
local textbox2=vgui.Create("DTextEntry",MakePanelFullacc)
textbox2:SetWide(150)
textbox2:SetText("Name here")
MakePanelFullacc.Box2=textbox2
local butan=vgui.Create("DButton",MakePanelFullacc)
butan:SetText(ajouter)
butan:SetPos(330,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/add.png"))surface.DrawTexturedRect(4,3,16,16)
end
butan.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
butan.List:AddLine(steamid64,textbox2:GetText(),LocalPlayer():Name(),tostring(os.date()))
RunConsoleCommand( "wjs_addbuto", steamid64,textbox2:GetText(),"Full Access")
Nordah_Whitelist_Job.AddWhitelist({LocalPlayer():Name(),steamid64,textbox2:GetText(),"Full Access",tostring( os.date() )})
surface.PlaySound(Sound( "buttons/button14.wav" ))
end
local listmetongl=vgui.Create("DListView",MakePanelFullacc)
listmetongl.Paint=function()
draw.RoundedBox(8,0,0,listmetongl:GetWide(),listmetongl:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listmetongl:GetWide()-2,listmetongl:GetTall()-2,Color(255,255,255,255))
end
MakePanelFullacc.List=listmetongl
butan.List=listmetongl
local col1=listmetongl:AddColumn("Steam ID")
col2=listmetongl:AddColumn(tra_nom)
col3=listmetongl:AddColumn(tra_ajpar)
col4=listmetongl:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

for a,z in pairs(ZJOBwhitelist)do
if( "Full Access"==z[4] )then
listmetongl:AddLine(z[2],z[3],z[1],z[5])
end
end

listmetongl.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,nil,"Full Access")
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end

list:AddSheet("Full Access",MakePanelFullacc,"icon16/accept.png", false, false,"All in this lsit have an Full Access")
------------------------------------------------------

for k,v in pairs(Add_Job_In_the_Whiteliste)do
if v=="1" or v=="3" then

local metieronglet=vgui.Create("DPanel")
metieronglet.InvalidateLayout=function()
if metieronglet.List then
metieronglet.List:StretchToParent(0,35,0,0)
metieronglet.Box1:SetPos(0,7)
metieronglet.Box2:SetPos(165,7)
end
end

metieronglet.Paint=function()draw.RoundedBox(4,0,0,ScrW()-24,ScrH()-65,Color(0,125,194,255))
end
local textbox1=vgui.Create("DTextEntry",metieronglet)
textbox1:SetWide(150)
textbox1:SetText("STEAM_0:0:00000000")
metieronglet.Box1=textbox1
local textbox2=vgui.Create("DTextEntry",metieronglet)
textbox2:SetWide(150)
textbox2:SetText("Name here")
metieronglet.Box2=textbox2
local butan=vgui.Create("DButton",metieronglet)
butan:SetText(ajouter)
butan:SetPos(330,5)
butan:SetWide(100)
butan.Paint=function()
draw.RoundedBox(6,0,0,butan:GetWide(),butan:GetTall(),Color(0,0,0,255))
draw.RoundedBox(6,1,1,butan:GetWide()-2,butan:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butan:GetTall()-1-butan:GetTall()/3,butan:GetWide()-2,butan:GetTall()/3,Color(210,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/add.png"))surface.DrawTexturedRect(4,3,16,16)
end
butan.DoClick=function()
local steamid64=util.SteamIDTo64(textbox1:GetText())
butan.List:AddLine(steamid64,textbox2:GetText(),LocalPlayer():Name(),tostring(os.date()))
--RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), "Full Access" )
RunConsoleCommand( "wjs_addbuto", steamid64,textbox2:GetText(), k )
Nordah_Whitelist_Job.AddWhitelist({LocalPlayer():Name(),steamid64,textbox2:GetText(),k,tostring( os.date() )})
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local butanc=vgui.Create("DButton",metieronglet)
butanc:SetText("CleanUp")
butanc:SetPos(440,5)
butanc:SetWide(100)
butanc.Paint=function()
draw.RoundedBox(6,0,0,butanc:GetWide(),butanc:GetTall(),Color(255,0,0,255))
draw.RoundedBox(6,1,1,butanc:GetWide()-2,butanc:GetTall()-2,Color(255,255,255,255))
draw.RoundedBox(4,1,butanc:GetTall()-1-butanc:GetTall()/3,butanc:GetWide()-2,butanc:GetTall()/3,Color(255,210,210,255))
surface.SetDrawColor(255,255,255,255) 
surface.SetMaterial(Material("icon16/bin.png"))surface.DrawTexturedRect(4,3,16,16)
end
butanc.DoClick=function()
butan.List:Clear()
for c,b in pairs(ZJOBwhitelist)do
if b[4]==k then
ZJOBwhitelist[c]=nil
end
end
RunConsoleCommand( "cleanup_joblist",k)
surface.PlaySound(Sound( "buttons/button14.wav" ))
end

local listmetongl=vgui.Create("DListView",metieronglet)
listmetongl.Paint=function()
draw.RoundedBox(8,0,0,listmetongl:GetWide(),listmetongl:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,listmetongl:GetWide()-2,listmetongl:GetTall()-2,Color(255,255,255,255))
end
metieronglet.List=listmetongl
butan.List=listmetongl
local col1=listmetongl:AddColumn("Steam ID")
col2=listmetongl:AddColumn(tra_nom)
col3=listmetongl:AddColumn(tra_ajpar)
col4=listmetongl:AddColumn(tra_date)
col1:SetMinWidth(150)
col1:SetMaxWidth(150)
col3:SetMinWidth(150)
col4:SetMinWidth(100)

for a,z in pairs(ZJOBwhitelist)do
if( k==z[4] )then
listmetongl:AddLine(z[2],z[3],z[1],z[5])
end
end


listmetongl.OnRowRightClick=function(panel,id,line)
local menu=vgui.Create("DMenu",panel)
menu:AddOption("Steam Profil",function() LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80) gui.OpenURL("http://steamcommunity.com/profiles/"..line:GetColumnText(1))end):SetImage("icon16/link.png")
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(util.SteamIDFrom64(line:GetColumnText(1)))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")
menu:AddSpacer()
menu:AddOption(zaddsuppr,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,nil,k)
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu:AddSpacer()
menu:AddOption(zaddsupprall,function()
listmetongl:RemoveLine(id)
local steamid=line:GetColumnText(1)
RunConsoleCommand("Massremovewhitelist",steamid)
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
testencore()
return
end
end
end
testencore()
surface.PlaySound(Sound( "buttons/button14.wav" ))
end):SetImage("icon16/user_delete.png")
menu.Paint=function()
draw.RoundedBox(8,0,0,menu:GetWide(),menu:GetTall(),Color(0,0,0,255))
draw.RoundedBox(8,1,1,menu:GetWide()-2,menu:GetTall()-2,Color(255,255,255,255))
end
menu:Open()
end
local petitpict="icon16/report.png"
if v=="1" then
petitpict="icon16/report.png"
elseif v=="3" then
petitpict="icon16/coins.png"
end
list:AddSheet(k,metieronglet,petitpict, false, false,tra_wlistde.." '"..k.."'" )
end
end
---------------------------------------------------------
-- for k,v in pairs( Nordah_Whitelist_Job.Tabs ) do
-- local tabpnl = v.PanelFunc()
-- tabpnl.name=v.Name
-- list:AddSheet( v.Name, tabpnl, v.Icon, false, false, v.Desc )
-- if v.Func then
-- v.Func( tabpnl )
-- end
-- end
for k,v in pairs( player.GetAll() ) do
local pos = v:GetPos()
local lgr = LocalPlayer():GetPos():Distance( pos )
local lgr=lgr/10
local lgr2=255-lgr
local lgr3=math.Round(lgr/5)
listview:AddLine( v:Name(), v:SteamID(),team.GetAllTeams()[v:Team()].Name,lgr3)
table.insert( players, v )
end
listview.OnRowRightClick = function( pnl, id, line )
local menu = vgui.Create( "DMenu", panel )
local pl = players[id]
for k,v in pairs( Nordah_Whitelist_Job.Commands ) do
if not v.Args then
else
menu:AddSpacer()
local submenu,optMenu = menu:AddSubMenu(tra_ajdalwdumetier)
if v.CommandName=="wjs_addwhite" then
optMenu:SetIcon("ngui/wljs.png")
end

submenu:AddOption( "Full Access", function()
if IsValid( pl ) then
if type( arg ) == "table" then
if not v.Clientside then
local newtbl = {}
for k,v in pairs( arg ) do
table.insert( newtbl, tostring( v ) )
end
RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), unpack( newtbl ) )
end
else
if not v.Clientside then
RunConsoleCommand( "wjs_addwhite", pl:EntIndex(), "Full Access" )
end
end
surface.PlaySound( Sound( "buttons/button14.wav" ) )
end
end):SetIcon("icon16/add.png")
submenu:AddSpacer()

for c,d in pairs( v.Args ) do
local arg = d.Value
if Add_Job_In_the_Whiteliste[d.Name] then
if Add_Job_In_the_Whiteliste[d.Name]!="2" then
submenu:AddSpacer()
submenu:AddOption( d.Name, function()
if IsValid( pl ) then
if type( arg ) == "table" then
if not v.Clientside then
local newtbl = {}
for k,v in pairs( arg ) do
table.insert( newtbl, tostring( v ) )
end
RunConsoleCommand( v.CommandName, pl:EntIndex(), unpack( newtbl ) )
end
else
if not v.Clientside then
RunConsoleCommand( v.CommandName, pl:EntIndex(), arg )
end
end
surface.PlaySound( Sound( "buttons/button14.wav" ) )
end
end):SetIcon("icon16/add.png")
end
end
end
menu:AddSpacer()
menu:AddOption("Copy SteamID",function()SetClipboardText(line:GetColumnText(2))LocalPlayer():EmitSound("ui/buttonrollover.wav",45,80)end):SetImage("icon16/application_double.png")


end
end
menu:Open()
end
end

concommand.Add("whitelist_systemjob", Nordah_Whitelist_Job_Menu )
function Nordah_Whitelist_Job.Print( tbl )
end

function ntsysjobwi(a,b,c)
sysjobwi=tostring(c[1])
end
concommand.Add("ntsysjobwi",ntsysjobwi)

end
end
----------------------------------------



if SERVER then
util.AddNetworkString("SynchAllJobWhitelisted")
util.AddNetworkString("SynchAddJobwhitelist")
util.AddNetworkString("NSynchAddJob")
local function JobWriteToFile()
file.Write( "zwhitelistjobdata/whitelistjob.txt",util.TableToJSON(ZJOBwhitelist))
MsgN( "[Update Plugin] Whitelist.")
end
local function JobListToFile()
file.Write( "zwhitelistjobdata/jobsetting.txt",util.TableToJSON(Add_Job_In_the_Whiteliste))
MsgN( "[Update Plugin] JobList.")
end
local function JobSynchAddwhite(pl,id,rs,met,date,remove)
net.Start("SynchAddJobwhitelist")
net.WriteString(pl)
net.WriteString(id)
net.WriteString(rs)
net.WriteString(met)
net.WriteString(date)
net.WriteBit(tobool(remove))
net.Broadcast()
end

function Nordah_Whitelist_Job.AddWhitelist(tbl)
local heisinjob=false
for k,v in pairs(ZJOBwhitelist)do
if (v[2]==tbl[2])and(tbl[4]==v[4])then
MsgN( "TRUE")
heisinjob=true
--return
end
end
print("Pass")
if heisinjob==true then
MsgN( "[Update Plugin] msg id 1: Whitelist is not updated because this user exist in this list of Job.")
return
end

table.insert(ZJOBwhitelist,tbl)
JobWriteToFile()
JobSynchAddwhite(tbl[1],tbl[2],tbl[3],tbl[4],tbl[5])
end
function Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,job)
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid and v[4]==job then
table.remove(ZJOBwhitelist,k)
JobWriteToFile()
JobSynchAddwhite(steamid,"","","","",true)
return
end
end
end
function Nordah_Whitelist_Job.RemoveJobWhitelist5(steamid)
JobSynchAddwhite(steamid,"","","","",true)
end
local function RemoveJobWhitelist(ply,cmd,args)
if not eRight(ply) or not args[1]then return end
Nordah_Whitelist_Job.RemoveJobWhitelist(args[1],args[2])
end
concommand.Add("wjs_remove_whitelist",RemoveJobWhitelist)
local function AddWhitelist(ply,cmd,args)
if not eRight(ply) or not args[1]or not args[2]then return end
Nordah_Whitelist_Job.AddWhitelist{ply:Name(),args[1],args[2],args[3],tostring( os.date() )}
end
concommand.Add("wjs_add_whitelist",AddWhitelist)


local function Metajourmalist(a,b,c)
if eRight(a)==true then
if tostring(c[2])=="0" then
Add_Job_In_the_Whiteliste[c[1]]=nil
else
Add_Job_In_the_Whiteliste[c[1]]=c[2]
end
for k,v in pairs( player.GetAll() ) do
if eRight(v)==true then
net.Start("NSynchAddJob")net.WriteString(c[1])net.WriteString(c[2])net.Send(v)
end
end
JobListToFile()
end
end
concommand.Add("Metajourmalist",Metajourmalist)


local function get_j_t(j_nu)
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
if "Citizen"!=v.Name then
if j_nu==nil or "0" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="1" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="2" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="3" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
end
end
end
JobListToFile()
end

local function Metajourmalist_G(a,b,c)
if eRight(a)==true then
local j_nu=tostring(c[1])
get_j_t(j_nu)
for k,v in pairs( player.GetAll() ) do
if eRight(v)==true then
v:ConCommand("Metajolist_f_G "..j_nu)
end
end
end
end
concommand.Add("Metajourmalist_G",Metajourmalist_G)

local function MetajolistDe(a,b,c)
if eRight(a)==true then
Add_Job_In_the_Whiteliste={}
for k,v in pairs( player.GetAll() ) do
if eRight(v)==true then
v:ConCommand("Metajolistcl")
end
end
JobListToFile()
end
end
concommand.Add("MetajolistDe",MetajolistDe)

function hookselection(gmjobwhitel)

if WJL_CONFIG.overrides_custom_heck==0 then print("WJL_CONFIG.overrides_custom_heck is == 0 the system is disabled") return end
if gmjobwhitel=="1" then
print("Nordahl Whitelist Job System: Enabled")


hook.Add("playerCanChangeTeam", "Nordahl_Job_Whitelist", function(a,b,c)
local meti=team.GetAllTeams()[b].Name
local d=Add_Job_In_the_Whiteliste[meti]
if d==nil then
return true
elseif d=="1" then
if PlychangeAllowed(a,meti)==true then return true end
return false,"You are not Whitelisted"
elseif d=="2" then
return false,"JOB LOCKED"
elseif d=="3" then
if PlychangeAllowed2(a,meti)==true then return true end
return false,"Job reserved for the donators"
end
end)
else
print("Nordahl Whitelist Job System: Disabled")
hook.Remove("playerCanChangeTeam","Nordahl_Job_Whitelist")

end

end

function sysjobwhitelist(ply,nom,aze)
if eRight(ply) then 
file.Write("zmodserveroption/sysjobwhitelist.txt",tostring(aze[1]))
gmjobwhitel=tostring(aze[1])
for k,v in pairs ( player.GetAll() ) do
v:ConCommand("ntsysjobwi "..tostring(aze[1]))
end
hookselection(gmjobwhitel)
end
end
concommand.Add("sysjobwhitelist",sysjobwhitelist)

local files=file.Read("zmodserveroption/sysjobwhitelist.txt", "DATA")
if (!files) then
file.CreateDir("zmodserveroption")
file.Write("zmodserveroption/sysjobwhitelist.txt","1")
gmjobwhitel="1"
hookselection(gmjobwhitel)
else
gmjobwhitel=file.Read("zmodserveroption/sysjobwhitelist.txt","DATA")
hookselection(gmjobwhitel)
end
end

if CLIENT then
ZJOBwhitelist={}
net.Receive("SynchAddJobwhitelist",function(len)
local pl=net.ReadString()
local id=net.ReadString()
local rs=net.ReadString()
local met=net.ReadString()
local date=net.ReadString()
local remove=tobool(net.ReadBit())
if remove then
for k,v in pairs(ZJOBwhitelist)do 
if v[2]==id and v[3]==met then
Nordah_Whitelist_Job.RemoveJobWhitelist(id,true,met)
table.remove(ZJOBwhitelist,k)
return
end
end
else
Nordah_Whitelist_Job.AddWhitelist({pl,id,rs,met,date},true)
end
end)
net.Receive("NSynchAddJob",function(len)
if zwjlist==nil then zwjlist=0 end
zwjlist=zwjlist+1
local meti=net.ReadString()
local val=net.ReadString()
if val=="0" then val=nil end
Add_Job_In_the_Whiteliste[meti]=val
end)
net.Receive("SynchAllJobWhitelisted",function(len)
if zwusers==nil then zwusers=0 end
zwusers=zwusers+1
Nordah_Whitelist_Job.AddWhitelist({net.ReadString(),net.ReadString(),net.ReadString(),net.ReadString(),net.ReadString()},true)
end)

local function Metajolistcl(a)
Add_Job_In_the_Whiteliste={}
end
concommand.Add("Metajolistcl",Metajolistcl)

function Metajolist_f_G(a,b,c)
local j_nu=tostring(c[1])
Add_Job_In_the_Whiteliste={}
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
if "Citizen"!=v.Name then
if j_nu==nil or "0" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="1" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="2" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
elseif j_nu=="3" then
Add_Job_In_the_Whiteliste[v.Name]=j_nu
end
end
end
end
concommand.Add("Metajolist_f_G",Metajolist_f_G)

function Nordah_Whitelist_Job.whitelistexist(steamid)
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid then
return false 
end
end
end
function Nordah_Whitelist_Job.AddWhitelist(tbl,override)
if Nordah_Whitelist_Job.whitelistexist(tbl[2])then return end
table.insert(ZJOBwhitelist,tbl)
if override then return end
end
function Nordah_Whitelist_Job.RemoveJobWhitelist(steamid,override,job)
for k,v in pairs(ZJOBwhitelist)do
if v[2]==steamid and v[4]==job then
table.remove(ZJOBwhitelist,k)
if override then return end
RunConsoleCommand("wjs_remove_whitelist",steamid,job)
return
end
end
end

end
--------------------------------------------

if CLIENT then
local args={}
timer.Simple(2,function()
for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
table.insert(args,{Name=v.Name,Value=v.Name})
end
end)
Nordah_Whitelist_Job.RegisterCommand(f2panadwl,"wjs_addwhite","Add In WhiteList",args,true)
else


local function AddWhiteListPlayer(ply,cmd,args)
local target=Nordah_Whitelist_Job.GetPlayer(args[1])
if target then
if eRight(ply) then
local reason=""
for i=2,#args do
reason=reason..tostring(args[i])
end
local heisinjob=false
for k,v in pairs(ZJOBwhitelist)do
if (v[2]==target:SteamID64())and(args[2]==v[4])then
MsgN( "TRUE")
heisinjob=true
--return
end
end
print("Pass")
if heisinjob==true then
MsgN( "[Update Plugin] msg id 2: Whitelist is not updated because this user exist in this list of Job.")
return
end
MsgAll("[JOB Whitelist Plugin] "..target:GetName().." was added in Job-WhiteList by ",ply)
Nordah_Whitelist_Job.AddWhitelist{ply:Name(),target:SteamID64(),target:Name(),args[2],tostring( os.date() )}
elseif eRight(ply) then
admincommandst(ply)
end
end
end
Nordah_Whitelist_Job.AddCommand(AddWhiteListPlayer,"wjs_addwhite")

local function AddWhitewjs_addbuto(ply,cmd,args)
local identifiant=args[1]
local lenom=args[2]
local travail=args[3]
if eRight(ply) then
local reason=""
for i=2,#args do
reason=reason..tostring(args[i])
end
local heisinjob=false
for k,v in pairs(ZJOBwhitelist)do
if (v[2]==identifiant)and(travail==v[4])then
MsgN( "TRUE")
heisinjob=true
--return
end
end
print("Pass")
if heisinjob==true then
MsgN( "[Update Plugin] msg id 2: Whitelist is not updated because this user exist in this list of Job.")
return
end
MsgAll("[JOB Whitelist Plugin] "..lenom.." was added in Job-WhiteList by ",ply)
Nordah_Whitelist_Job.AddWhitelist{ply:Name(),identifiant,lenom,travail,tostring( os.date() )}
elseif eRight(ply) then
admincommandst(ply)
end
end
--Nordah_Whitelist_Job.AddCommand(AddWhitewjs_addbuto,"wjs_addbuto")
concommand.Add("wjs_addbuto",AddWhitewjs_addbuto)
end

function PlychangeAllowed(ply,job)
local SteamID64=ply:SteamID64()
local Job=job
for k,v in pairs(ZJOBwhitelist)do
if v[2]==SteamID64 then
if Job==v[4] or v[4]=="Full Access" then
return true
end
end
end
if Add_Job_In_the_Whiteliste[Job]=="3" then
if ply:GetUserGroup() == WJL_CONFIG.ULX_DONATOR_RANK then return true end
end
return false
end
concommand.Add("PlychangeAllowed",PlychangeAllowed)

if WJL_CONFIG.Donator_Rank_Tester==1 then
function nordahl_donator_rank_tester(ply,b,c)
MsgAll("----------------------------------------------nordahl_donator_tester BEGIN----------------------------------------------------")MsgAll(" ")
MsgAll("1.Script Test:")
MsgAll("    1.1) Your user Rank=                                                           ",ply:GetUserGroup())
MsgAll("    1.2) Donator Rank name set in the script line 48: WJL_CONFIG.ULX_DONATOR_RANK= ",WJL_CONFIG.ULX_DONATOR_RANK)
MsgAll("    1.3) Your user Group is = Donator Rank set in the script:                      ",ply:GetUserGroup() == WJL_CONFIG.ULX_DONATOR_RANK)
MsgAll(" ")
MsgAll("2.In Some Words:")
if ply:GetUserGroup() == WJL_CONFIG.ULX_DONATOR_RANK then
MsgAll("    2.1) Work for your rank:                                                        "..ply:GetUserGroup())
else
MsgAll("    2.1) Dont work for you, you are    :                                            "..ply:GetUserGroup())
MsgAll("    2.1) If you are donator it's supposed work Go line 48 change the word 'donator' to fix it.")
end
MsgAll(" ")
MsgAll("---------------------------------------------nordahl_donator_tester FINISHED---------------------------------------------------")

end
concommand.Add("nordahl_donator_rank_tester",nordahl_donator_rank_tester)
end

function PlychangeAllowed2(ply,job)
local SteamID64=ply:SteamID64()
local Job=job
for k,v in pairs(ZJOBwhitelist)do
if v[2]==SteamID64 then
if v[4]=="Full Access" then
return true
end
end
end
if Add_Job_In_the_Whiteliste[Job]=="3" then
if ply:GetUserGroup() == WJL_CONFIG.ULX_DONATOR_RANK then return true end
end
return false
end

function CAddWhiteList(a,b,c)
if a:IsPlayer() then
if eRight(a)==false then
print("You Are Not Admin")
return
end
end
for k,v in pairs(ZJOBwhitelist)do
if v[2]==c[2] then
if c[4]==v[4] then
print("SteamID64 already exists for this job")
return
end
end
end

if c[1]==nil then
print("[Your command is not complet] Your Sended: Addwhitelist ??? ??? ??? ???")
print("The Format of Complet Command: Addwhitelist "..'"'.."Yourname"..'"'.." "..'"'.."SteamID64"..'"'.." "..'"'.."Nameofplayer"..'"'.." "..'"'.."JobName"..'"'.."")
return
end
if c[2]==nil then
print("[Your command is not complet]Your Sended: Addwhitelist Yourname ??? ??? ???")
print("The Format of Complet Command: Addwhitelist "..'"'.."Yourname"..'"'.." "..'"'.."SteamID64"..'"'.." "..'"'.."Nameofplayer"..'"'.." "..'"'.."JobName"..'"'.."")
return
end
if c[3]==nil then
print("[Your command is not complet]Your Sended: Addwhitelist Yourname SteamID64 ??? ???")
print("The Format of Complet Command: Addwhitelist "..'"'.."Yourname"..'"'.." "..'"'.."SteamID64"..'"'.." "..'"'.."Nameofplayer"..'"'.." "..'"'.."JobName"..'"'.."")
return
end
if c[4]==nil then
print("[Your command is not complet]Your Sended: Addwhitelist Yourname SteamID64 Nameofplayer ???")
print("The Format of Complet Command: Addwhitelist "..'"'.."Yourname"..'"'.." "..'"'.."SteamID64"..'"'.." "..'"'.."Nameofplayer"..'"'.." "..'"'.."JobName"..'"'.."")
return
end
Nordah_Whitelist_Job.AddWhitelist({c[1],c[2],c[3],c[4],tostring( os.date() )})
end
concommand.Add("Addwhitelist",CAddWhiteList)

function CMassRemovewhitelist(a,b,c)
if a:IsPlayer() then
if eRight(a)==false then
print("You Are Not Admin")
return
end
end
if c[1]==nil then
print("[Your command is not complet] Your Sended: Massremovewhitelist ???")
print("Where is the STEAM64? Replace ??? by steamid64")
return
end
print("Nordahl_Whitelist_Job_system: Massremovewhitelist")
local function testencore()
for k,v in pairs(ZJOBwhitelist)do
if v[2]==c[1] then
print(v[2].." Is removed from "..v[4])
table.remove(ZJOBwhitelist,k)
Nordah_Whitelist_Job.RemoveJobWhitelist5(c[1])
testencore()
return
end
end
end
testencore()

file.Write( "zwhitelistjobdata/whitelistjob.txt",util.TableToJSON(ZJOBwhitelist))
end
concommand.Add("Massremovewhitelist",CMassRemovewhitelist)


local function cleanup_joblist(a,b,c)
if a:IsPlayer() then
if eRight(a)==false then
print("No eres Administrador")
return
else
for k,v in pairs(ZJOBwhitelist)do
if v[4]==c[1] then
ZJOBwhitelist[k]=nil
end
end
print("Whitelist Job System: '"..c[1].."' CLEANUP DONE")
end
else
for k,v in pairs(ZJOBwhitelist)do
if v[4]==a then
ZJOBwhitelist[k]=nil
end
end
print("Whitelist Job System: '"..a.."' CLEANUP DONE")
end
file.Write( "zwhitelistjobdata/whitelistjob.txt",util.TableToJSON(ZJOBwhitelist))
end
concommand.Add("cleanup_joblist",cleanup_joblist)

if CLIENT then
local function whitelist_update(a,b,c)
if c[1]==nil then print("This is not the right command, Nordahl. ^^") return end
if zwjlist==nil then zwjlist=0 end
if zwusers==nil then zwusers=0 end
local numline=tonumber(c[1])
local numline2=tonumber(c[2])
sysjobwi=tostring(c[3])
local zloairme=CurTime()
if loadbar then loadbar:Remove() end
loadbar=vgui.Create("DFrame")
loadbar:SetPos(0,0)
loadbar:SetSize(ScrW(),ScrH())
loadbar:SetTitle("")
loadbar:SetDraggable(false)
loadbar:ShowCloseButton(false)
loadbar.Think=function()
if zwusers>=numline then
zwusers=numline
end
if zwjlist>=numline2 then
zwjlist=numline2
end
if (zwusers>=numline and zwjlist>=numline2) then
loadbar:Remove()
end
end
local scrW=ScrW()-185
local scrH=ScrH()-100
loadbar.Paint=function()
draw.RoundedBox(4,(scrW)-176,(scrH)-1,352,92,Color(0,117,223,255))
draw.RoundedBox(4,(scrW)-175,(scrH),350,90,Color(255,255,255,255))
draw.SimpleTextOutlined(WhitelistJobSystem..": "..tra_init, "BudgetLabel",scrW,(scrH)+9, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER, 2, Color(0,0,0,255))
draw.SimpleTextOutlined("Jobs:: "..zwjlist.."/"..numline2, "BudgetLabel",scrW,(scrH)+25, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER, 2, Color(0,0,0,255))
draw.SimpleTextOutlined(tra_susermax..": "..zwusers.."/"..numline, "BudgetLabel",scrW,(scrH)+40, Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER, 2, Color(0,0,0,255))
draw.RoundedBox(4,(scrW)-151,(scrH)+69-20,302,12,Color(0,117,223,255))
draw.RoundedBox(4,(scrW)-150,(scrH)+70-20,300,10,Color(0,0,50,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+70-20,(300/numline2)*zwjlist,10,Color(0,117,223,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+76-20,(300/numline2)*zwjlist,4,Color(0,125,194,255))
surface.SetDrawColor( 255,255,255, 255 )
surface.SetMaterial(Material("ngui/wljs.png"))surface.DrawTexturedRect((scrW)-170,(scrH)+67-20,16,16)
draw.RoundedBox(4,(scrW)-151,(scrH)+69,302,12,Color(0,117,223,255))
draw.RoundedBox(4,(scrW)-150,(scrH)+70,300,10,Color(0,0,50,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+70,(300/numline)*zwusers,10,Color(0,117,223,255))
draw.RoundedBox(2,(scrW)-150,(scrH)+76,(300/numline)*zwusers,4,Color(0,125,194,255))
surface.SetDrawColor( 255,255,255, 255 )
surface.SetMaterial(Material("icon16/report.png"))surface.DrawTexturedRect((scrW)-170,(scrH)+67,16,16)
end
end
concommand.Add("whitelist_update",whitelist_update)
end

function ZWUnd_SynchroConnect(a)
local tab=ZJOBwhitelist
local Jlist=Add_Job_In_the_Whiteliste
local num9=0
if eRight(a)==true then
a:ConCommand("whitelist_update "..tostring(table.Count(tab)).." "..tostring(table.Count(Jlist)).." "..tostring(gmjobwhitel))
if table.Count(Jlist)>0 then
for c,d in pairs(Jlist)do
num9=num9+ztvo timer.Simple(num9,function() if IsValid(a) then net.Start("NSynchAddJob")net.WriteString(c)net.WriteString(d)net.Send(a) else return end end)
end
end
end
if tab[1]then
local pairs=pairs
--local num2=0
if eRight(a)==true then
for c,d in pairs(tab)do
num9=num9+ztvo timer.Simple(num9,function() if IsValid(a) then net.Start("SynchAllJobWhitelisted")net.WriteString(d[1])net.WriteString(d[2])net.WriteString(d[3])net.WriteString(d[4])net.WriteString(d[5])net.Send(a) else return end end)
end
else
for c,d in pairs(tab)do
if a:SteamID64()==d[2] then
num9=num9+ztvo timer.Simple(num9,function() if IsValid(a) then net.Start("SynchAllJobWhitelisted")net.WriteString(d[1])net.WriteString(d[2])net.WriteString(d[3])net.WriteString(d[4])net.WriteString(d[5])net.Send(a) else return end end)
end
end
end
end
end
hook.Add("PlayerInitialSpawn", "ZWUnd_SynchroConnect", ZWUnd_SynchroConnect)

print("Nordahl JOB WhiteList System: OK")