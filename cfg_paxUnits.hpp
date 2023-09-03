// --- paxUnits ----------------------------------------------------------
// Group definitions for dynamic enemies

// Civs  ================================================================================
cgqc_pax_civ = [];
cgqc_pax_civ_vips = [];

// === Opfor ================================================================================
cgqc_pax_opfor_vip = [];
cgqc_pax_opfor_lead = [];
cgqc_pax_opfor_sniper = [];
cgqc_pax_opfor_soldier = [];
//Vics
cgqc_pax_opfor_vic_tank = [];
cgqc_pax_opfor_vic_apc = [];
cgqc_pax_opfor_vic_transport_squad = [];
cgqc_pax_opfor_vic_transport_team = [];
cgqc_pax_opfor_vic_transport_recon = [];
cgqc_pax_opfor_vic_transport_fuel = [];
cgqc_pax_opfor_vic_transport_ammo = [];
cgqc_pax_opfor_vic_transport_repair = [];
cgqc_pax_opfor_vic_technical_mg = [];
cgqc_pax_opfor_vic_technical_gl = [];
//Statics
cgqc_pax_opfor_aa_light = [];
cgqc_pax_opfor_aa_heavy = [];
cgqc_pax_opfor_fixed_light = [];
cgqc_pax_opfor_fixed_heavy = [];
cgqc_pax_opfor_mortar = [];
cgqc_pax_opfor_arty = [];
//Air
cgqc_pax_opfor_radar = [];
cgqc_pax_opfor_sam = [];
cgqc_pax_opfor_plane_transport = [];
cgqc_pax_opfor_plane_fighter = [];
cgqc_pax_opfor_plane_cas = [];
cgqc_pax_opfor_heli_cas_light = [];
cgqc_pax_opfor_heli_cas_heavy = [];
cgqc_pax_opfor_heli_transport = [];
//Special shit
cgqc_pax_opfor_uav = [];
cgqc_pax_opfor_ugv = [];
cgqc_pax_opfor_boat_light = [];
cgqc_pax_opfor_boat_heavy = [];
cgqc_pax_opfor_sub = [];

//=== Blufor ================================================================================
cgqc_pax_blufor_vip = [];
cgqc_pax_blufor_lead = [];
cgqc_pax_blufor_sniper = [];
cgqc_pax_blufor_soldier = [];
//Vics
cgqc_pax_blufor_tank = [];
cgqc_pax_blufor_apc = [];
cgqc_pax_blufor_squad_transport = [];
cgqc_pax_blufor_team_transport = [];
cgqc_pax_blufor_recon_transport = [];
cgqc_pax_blufor_technical_mg = [];
cgqc_pax_blufor_technical_gl = [];
//Statics
cgqc_pax_blufor_aa_light = [];
cgqc_pax_blufor_aa_heavy = [];
cgqc_pax_blufor_fixed_light = [];
cgqc_pax_blufor_fixed_heavy = [];
cgqc_pax_blufor_mortar = [];
cgqc_pax_blufor_arty = [];
//Air
cgqc_pax_blufor_radar = [];
cgqc_pax_blufor_sam = [];
cgqc_pax_blufor_planes = [];
cgqc_pax_blufor_heli_cas_light = [];
cgqc_pax_blufor_heli_cas_heavy = [];
cgqc_pax_blufor_heli_transport = [];
//Special shit
cgqc_pax_blufor_uav = [];
cgqc_pax_blufor_ugv = [];
cgqc_pax_blufor_boat_light = [];
cgqc_pax_blufor_boat_heavy = [];
cgqc_pax_blufor_sub = [];

//=== Independent ================================================================================
cgqc_pax_ind_vip = [];
cgqc_pax_ind_lead = [];
cgqc_pax_ind_sniper = [];
cgqc_pax_ind_soldier = [];
//Vics
cgqc_pax_ind_tank = [];
cgqc_pax_ind_apc = [];
cgqc_pax_ind_squad_transport = [];
cgqc_pax_ind_team_transport = [];
cgqc_pax_ind_recon_transport = [];
cgqc_pax_ind_technical_mg = [];
cgqc_pax_ind_technical_gl = [];
//Statics
cgqc_pax_ind_aa_light = [];
cgqc_pax_ind_aa_heavy = [];
cgqc_pax_ind_fixed_light = [];
cgqc_pax_ind_fixed_heavy = [];
cgqc_pax_ind_mortar = [];
cgqc_pax_ind_arty = [];
//Air
cgqc_pax_ind_radar = [];
cgqc_pax_ind_sam = [];
cgqc_pax_ind_planes = [];
cgqc_pax_ind_heli_cas_light = [];
cgqc_pax_ind_heli_cas_heavy = [];
cgqc_pax_ind_heli_transport = [];
//Special shit
cgqc_pax_ind_uav = [];
cgqc_pax_ind_ugv = [];
cgqc_pax_ind_boat_light = [];
cgqc_pax_ind_boat_heavy = [];
cgqc_pax_ind_sub = [];

// *** Override selon les mods  ***************************************************************************************************************
switch (true) do {
	// *** PAX - 2023 *******************************************************
	case (cgqc_player_has2023): {
		#include "\cgqc\pax\cfg_pax2023.hpp"

	};
	case (cgqc_player_hasIfa3): {// *** PAX - WW2 **********************************************************************************************
		#include "\cgqc\pax\cfg_paxIfa3.hpp"

	};
	case (cgqc_player_hasScandinavia): {// *** PAX - Scandinavia **********************************************************************************************
		#include "\cgqc\pax\cfg_paxScandinavia.hpp"

	};
	case (cgqc_player_hasUnsung): {// *** PAX - Unsung **********************************************************************************************
		#include "\cgqc\pax\cfg_paxUnsung.hpp"

	};
	default	{
		#include "\cgqc\pax\cfg_paxVanilla.hpp"
	};
};
// Groups built from the info
cgqc_pax_opfor_squad = [selectRandom cgqc_pax_opfor_lead, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier];
cgqc_pax_opfor_patrol = [selectRandom cgqc_pax_opfor_lead, selectRandom cgqc_pax_opfor_soldier];
cgqc_pax_opfor_team = [selectRandom cgqc_pax_opfor_lead, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier, selectRandom cgqc_pax_opfor_soldier];
cgqc_pax_opfor_hunter =  [selectRandom cgqc_pax_opfor_lead, selectRandom cgqc_pax_opfor_sniper];
cgqc_pax_opfor_utility_trucks = cgqc_pax_opfor_vic_transport_fuel + cgqc_pax_opfor_vic_transport_ammo + cgqc_pax_opfor_vic_transport_repair;