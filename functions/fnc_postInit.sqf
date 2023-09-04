// --- postInit ----------------------------------------------------------
// Start everything before everything
diag_log "[CGQC_INIT] === postInit started =====================================";
if (!isServer) then {
	// Start with a silent black screen.

	0 fadeSound 0;
	titleCut ["", "BLACK FADED", 999];
};
diag_log "[CGQC_INIT] === postInit done =====================================";