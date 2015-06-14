//
// Author: Motavar@judgement.net
//


//Define GunStore variables to hold status
private ["_GS1", "_GS2", "_GS3", "_GS4", "_GS5", "_GS6", "_GS7", "_GS8"];


//##################################################
// SCAN THROUGH ALL STORES AND RECORD THEIR STATUS
	{

		if (!isPlayer _x && (vehicleVarName _x =="GunStore1")) then
		{
			_GS1 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore2")) then
		{
			_GS2 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore3")) then
		{
			_GS3 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore4")) then
		{
			_GS4 = _x getVariable ['Side',''];
		};


		if (!isPlayer _x && (vehicleVarName _x =="GunStore5")) then
		{
			_GS5 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore6")) then
		{
			_GS6 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore7")) then
		{
			_GS7 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore8")) then
		{
			_GS8 = _x getVariable ['Side',''];
		};
			

} forEach entities "CAManBase";

//##################################################






//#####################################################
// MAIN LOOP - CHECK IF GunStore State Changed
//#####################################################

showmarkers = true;
while {showmarkers} do
{

	//##################################################
	// SCAN THROUGH ALL STORES
	//##################################################
	{

//if ( _x getVariable ['Side',''] != _GS2) then 

		if (!isPlayer _x && (vehicleVarName _x =="GunStore1")) then
		{
			_GS1 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore2")) then
		{
			_GS2 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore3")) then
		{
			_GS3 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore4")) then
		{
			_GS4 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore5")) then
		{
			_GS5 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore6")) then
		{
			_GS6 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore7")) then
		{
			_GS7 = _x getVariable ['Side',''];
		};

		if (!isPlayer _x && (vehicleVarName _x =="GunStore8")) then
		{
			_GS8 = _x getVariable ['Side',''];
		};


	} forEach entities "CAManBase";
	//##################################################			



//CHECK FOR END GAME
//===============================================================================================================================
	if ((_GS1=="WEST") && (_GS2=="WEST") && (_GS3=="WEST") && (_GS4=="WEST") && (_GS5=="WEST") && (_GS6=="WEST") && (_GS7=="WEST") && (_GS8=="WEST")) then 
	{
		[] execVM "server\functions\endMissionLose.sqf";
			//[] execVM "addons\nuclear\Nuke1.sqf";
		showmarkers = false;
	};

	if ((_GS1=="EAST") && (_GS2=="EAST") && (_GS3=="EAST") && (_GS4=="EAST") && (_GS5=="EAST") && (_GS6=="EAST") && (_GS7=="EAST") && (_GS8=="EAST")) then 
	{
		[] execVM "server\functions\endMissionLose.sqf";
			//[] execVM "addons\nuclear\Nuke1.sqf";
		showmarkers = false;
	};
//===============================================================================================================================		


sleep .5;
};








