// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: createGunStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap
//	@file Args:

_radius = 100;
_status = [];
_gunStores = [];
_col_empty = "ColorYellow";
_col_west = "ColorWEST";
_col_east = "ColorEAST";
_col_mixed = "ColorOrange";

//Define GunStore variables to hold status
private ["_GS1", "_GS2", "_GS3", "_GS4", "_GS5", "_GS6", "_GS7", "_GS8"];


//Creates the markers around gunstores.
{
	if (!isPlayer _x && {["GunStore", vehicleVarName _x] call fn_startsWith}) then
	{
		_npcPos = getPosATL _x;

		if (["A3W_showGunStoreStatus"] call isConfigOn) then
		{
			// Circle zone
			_markerName = format["marker_shop_zone_%1",_x];
			deleteMarkerLocal _markerName;
			_marker = createMarkerLocal [_markerName, _npcPos];
			_markerName setMarkerShapeLocal "ELLIPSE";
			_markerName setMarkerColorLocal _col_empty;
			_markerName setMarkerSizeLocal [_radius, _radius];
			_markerName setMarkerBrushLocal "Grid";
			_markerName setMarkerAlphaLocal 0.5;
		};

		/*
		// Gun store title
		_markerName = format["marker_shop_title_%1",_x];
		deleteMarkerLocal _markerName;
		_marker = createMarkerLocal [_markerName, _npcPos];
		_markerName setMarkerShapeLocal "ICON";
		_markerName setMarkerTypeLocal "mil_dot";
		_markerName setMarkerColorLocal "ColorRed";
		_markerName setMarkerSizeLocal [1,1];
		_markerName setMarkerTextLocal "GUN STORE";
		*/

		// Gun store description
		_markerName = format["marker_shop_desc_%1",_x];
		deleteMarkerLocal _markerName;
		// _npcPos set [1, (_npcPos select 1) - 100];
		_marker = createMarkerLocal [_markerName, _npcPos];
		_markerName setMarkerShapeLocal "ICON";
		_markerName setMarkerTypeLocal "mil_dot";
		_markerName setMarkerColorLocal _col_empty;
		_markerName setMarkerSizeLocal [1,1];
		_markerName setMarkerTextLocal format ["%1 (Capture Point)", vehicleVarName _x];
		// _markerName setMarkerAlphaLocal 0.5;

		_status pushBack "EMPTY";

		_gunStores pushBack _x;
	};
} forEach entities "CAManBase";



//Used to set the status of each store.
_setStatus =
{
	if(_status select (_this select 0) == (_this select 1)) exitWith {};

	_markerNameZone = format ["marker_shop_zone_%1", _gunStores select (_this select 0)];
	_markerNameDescription = format ["marker_shop_desc_%1", _gunStores select (_this select 0)];
	switch(_this select 1) do {
		case "EMPTY": {
			_markerNameZone setmarkerColorLocal _col_empty;
			_markerNameDescription setmarkerColorLocal _col_empty;
			_markerNameDescription setMarkerTextLocal "Capture Point";
		};
		case "WEST": {
			_markerNameZone setmarkerColorLocal _col_west;
			_markerNameDescription setmarkerColorLocal _col_west;
			//_markerNameDescription setMarkerTextLocal "Capture Point (West)";
			_markerNameDescription setMarkerTextLocal format ["%1 (Capture Point) [WEST]", _gunStores select (_this select 0)];
		};
		case "EAST": {
			_markerNameZone setmarkerColorLocal _col_east;
			_markerNameDescription setmarkerColorLocal _col_east;
			_markerNameDescription setMarkerTextLocal format ["%1 (Capture Point) [EAST]", _gunStores select (_this select 0)];
		};

	};

	_status set [_this select 0, _this select 1];
};





if (["A3W_showGunStoreStatus"] call isConfigOn) then
{


		{
			// SCAN THROUGH ALL STORES AND RECORD THEIR STATUS
			//=================================================
			if (vehicleVarName _x =="GunStore1") then
			{
				_GS1 = _x getVariable ['Side',''];
			};

			if (vehicleVarName _x =="GunStore2") then
			{
				_GS2 = _x getVariable ['Side',''];
			};

			if (vehicleVarName _x =="GunStore3") then
			{
				_GS3 = _x getVariable ['Side',''];
			};

			if (vehicleVarName _x =="GunStore4") then
			{
				_GS4 = _x getVariable ['Side',''];
			};


			if (vehicleVarName _x =="GunStore5") then
			{
				_GS5 = _x getVariable ['Side',''];
			};

			if (vehicleVarName _x =="GunStore6") then
			{
				_GS6 = _x getVariable ['Side',''];
			};

			if (vehicleVarName _x =="GunStore7") then
			{
				_GS7 = _x getVariable ['Side',''];
			};

			if (vehicleVarName _x =="GunStore8") then
			{
				_GS8 = _x getVariable ['Side',''];
			};
			
		} forEach _gunStores;




//Check each store to see if their state has changed and then calls the update function to make the display the correct state.
showmarkers = true;
while {showmarkers} do
{
		{
			_npc = _x;

			if (_npc getVariable ["Side",""] == "WEST") then
			{
				[_forEachIndex, "WEST", true] call _setStatus;
			};
			
			if (_npc getVariable ["Side",""] == "EAST") then
			{
				[_forEachIndex, "EAST", true] call _setStatus;
			};
			
		
			// SCAN THROUGH ALL STORES AND RECORD THEIR STATUS
			//=================================================
			if (vehicleVarName _x =="GunStore1") then
			{
				if ( _x getVariable ['Side',''] != _GS1) then 
				{
					_GS1 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #1 BASE CAPTURED!"];
				};				
			};

			if (vehicleVarName _x =="GunStore2") then
			{
				if ( _x getVariable ['Side',''] != _GS2) then 
				{
					_GS2 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #2 CAPTURED!"];
				};				
			};


			if (vehicleVarName _x =="GunStore3") then
			{
				if ( _x getVariable ['Side',''] != _GS3) then 
				{
					_GS3 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #3 CAPTURED!"];
				};				

			};


			if (vehicleVarName _x =="GunStore4") then
			{
				if ( _x getVariable ['Side',''] != _GS4) then 
				{
					_GS4 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #4 CAPTURED!"];
				};				

			};


			if (vehicleVarName _x =="GunStore5") then
			{
				
				if ( _x getVariable ['Side',''] != _GS5) then 
				{
					_GS5 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #5 CAPTURED!"];
				};				
			};


			if (vehicleVarName _x =="GunStore6") then
			{
				if ( _x getVariable ['Side',''] != _GS6) then 
				{
					_GS6 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #6 CAPTURED!"];
				};				
			};


			if (vehicleVarName _x =="GunStore7") then
			{
				if ( _x getVariable ['Side',''] != _GS7) then 
				{
					_GS7 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #7 CAPTURED!"];
				};				
				
			};

			if (vehicleVarName _x =="GunStore8") then
			{
				if ( _x getVariable ['Side',''] != _GS8) then 
				{
					_GS8 = _x getVariable ['Side',''];
					playSound "thunder_1";
					playSound "air_raid";
					hint format ["Gun Store #8 BASE CAPTURED!"];
				};				
			};

			
		} forEach _gunStores;


_playerteam = side player;

	//CHECK FOR END GAME
	//=================================================================
	if (_playerteam == WEST) then {

		if ((_GS1=="WEST") && (_GS2=="WEST") && (_GS3=="WEST") && (_GS4=="WEST") && (_GS5=="WEST") && (_GS6=="WEST") && (_GS7=="WEST") && (_GS8=="WEST")) then
		{
			hint format ["YOUR TEAM WON"];
			[] execVM "client\functions\endMissionWin.sqf";
			showmarkers = false;
		};
	
		if ((_GS1=="EAST") && (_GS2=="EAST") && (_GS3=="EAST") && (_GS4=="EAST") && (_GS5=="EAST") && (_GS6=="EAST") && (_GS7=="EAST") && (_GS8=="EAST")) then
		{
			hint format ["YOUR TEAM LOST"];
			[] execVM "client\functions\endMissionLose.sqf";
			showmarkers = false;
		};

	};


	if (_playerteam == EAST) then {

		if ((_GS1=="EAST") && (_GS2=="EAST") && (_GS3=="EAST") && (_GS4=="EAST") && (_GS5=="EAST") && (_GS6=="EAST") && (_GS7=="EAST") && (_GS8=="EAST")) then
		{
			hint format ["YOUR TEAM WON"];
			[] execVM "client\functions\endMissionWin.sqf";
			showmarkers = false;
		};
	
		if ((_GS1=="WEST") && (_GS2=="WEST") && (_GS3=="WEST") && (_GS4=="WEST") && (_GS5=="WEST") && (_GS6=="WEST") && (_GS7=="WEST") && (_GS8=="WEST")) then
		{
			hint format ["YOUR TEAM LOST"];
			[] execVM "client\functions\endMissionLose.sqf";
			showmarkers = false;
		};

	};
	//=================================================================



		sleep 1;
	};


};
