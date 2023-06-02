// --- trainingParachute ----------------------------------------------------------
// Paradrop shenanigans
_jumpHeight = _this select 0;

if (backpack player isEqualTo "B_Parachute") then { 
	// Ask to click on map 
	hint "Click on map to choose jump point.";  
	// Define the event handler function for MapSingleClick  
	onMapClick = {  
		params["_control", "_pos", "_shift", "_alt", "_ctrl"];  
		// Store the clicked position  
		y_clickedPos = _pos; 
		// Remove the MapSingleClick event handler  
		removeMissionEventHandler ["MapSingleClick", y_clickEvent];  
		openMap [false, false];  
		hintSilent "";
	}; 
	// Add the MapSingleClick event handler  
	y_clickEvent = addMissionEventHandler ["MapSingleClick", onMapClick];  
	openMap [true, true]; 
	// Wait for the player to click on the map  
	waitUntil {sleep 0.5; !(isNil "y_clickedPos") };  
	
	// Good to jump  
	// Fade to black   
	cutText ["", "BLACK FADED", 999]; 
	titleText ["Prêt?", "PLAIN"]; 
	
	// Teleport to location  
	player setPos [y_clickedPos select 0, y_clickedPos select 1, _jumpHeight]; 
	
	// Give some velocity  
	player setVelocity [(vectorDir player select 0)*300, (vectorDir player select 1)*300, (vectorDir player select 2)]; 
	// max not sure this is needed. 
	titleFadeOut 2; 
	// Wake up with blur 
	"dynamicBlur" ppEffectEnable true; 
	"dynamicBlur" ppEffectAdjust [6]; 
	"dynamicBlur" ppEffectCommit 0; 
	titleCut ["", "BLACK IN", 2]; 
	"dynamicBlur" ppEffectAdjust [0.0]; 
	"dynamicBlur" ppEffectCommit 2; 
	waitUntil{isTouchingGround player}; 
	hint "Good job! Ace Self->Action: Drop ton parachute!"; 
 
} else { 
 hint "Sans parachute? T'es malade!"; 
};