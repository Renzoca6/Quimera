////////////////////////////////////////////////////////////////
//  Breaching Charge, Autorun
//  Programmed by Sevan Buechele
//  @   Copyright 2018 © Sevan Buechele
//  @   All Rights Reserved.
/////////////////////////////////////////////////////////////

/*|Ammo Type|*/
game.AddAmmoType({
	name = "ammo_breachingcharge",
	dmgtype = DMG_BLAST
})

/*|Console Variables|*/
CreateConVar("sv_breachingcharge_startingammo",3,FCVAR_SERVER_CAN_EXECUTE,"This setting changes the initial ammo given.")
CreateConVar("sv_breachingcharge_enabledoorbust",0,FCVAR_SERVER_CAN_EXECUTE,"This allows doors to be busted down.")
CreateConVar("sv_breachingcharge_enablepropunfreeze",0,FCVAR_SERVER_CAN_EXECUTE,"This allows props to be unfrozen.")
CreateConVar("sv_breachingcharge_canplace",0,FCVAR_SERVER_CAN_EXECUTE,"This setting changes what surface the breaching charge can be placed on.")
CreateConVar("sv_breachingcharge_debughands",0,FCVAR_SERVER_CAN_EXECUTE,"This setting fixes custom hands that are incompatible.")