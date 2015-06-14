//
// Author: Motavar@judgement.net
//


//Define GunStore variables to hold status
private ["_GS1", "_GS2", "_GS3", "_GS4", "_GS5", "_GS6", "_GS7", "_GS8"];


_trgt = cursorTarget;
_playerteam = side player;
_trgtName = vehicleVarName _trgt;


systemChat format["Name: %1 ", _trgtName];
systemChat format["Variable Side: %1 ", _trgt getVariable ['Side','']];
systemChat format["Player's Team: %1 ", _playerteam];

  

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





//OPFOR - RED
//=============================================================================================================
	if (  (_trgt getVariable ['Side',''] =='WEST') && (_playerteam == EAST) ) then
	{
		systemChat "Attempt: Convert West to East";
		
		switch (_trgtName) do 
		{
		
			case "GunStore1" : 	
			{ 	
				if ( (_GS2 == "EAST") && (_GS3 == "EAST") && (_GS4 == "EAST") && (_GS5 == "EAST") && (_GS6 == "EAST") && (_GS7 == "EAST") && (_GS8 == "EAST")) then 
				{
					_trgt setVariable["Side", "EAST", true];
				} else {
					["Sorry, you need to capture the previous Gun Stores before this one", 5] call mf_notify_client;
				};
			};

			case "GunStore2" : 	
			{ 	
				if (_GS3 == "EAST") then { _trgt setVariable["Side", "EAST", true];  } else { ["Sorry, you need to capture Gun Store 3 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore3" : 	
			{ 	
				if (_GS4 == "EAST") then { _trgt setVariable["Side", "EAST", true];  } else { ["Sorry, you need to capture Gun Store 4 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore4" : 	
			{ 	
				if (_GS5 == "EAST") then { _trgt setVariable["Side", "EAST", true];  } else { ["Sorry, you need to capture Gun Store 5 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore5" : 	
			{ 	
				if (_GS6 == "EAST") then { _trgt setVariable["Side", "EAST", true];  } else { ["Sorry, you need to capture Gun Store 6 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore6" : 	
			{ 	
				if (_GS7 == "EAST") then { _trgt setVariable["Side", "EAST", true];  } else { ["Sorry, you need to capture Gun Store 7 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore7" : 	
			{ 	
				if (_GS8 == "EAST") then { _trgt setVariable["Side", "EAST", true];  } else { ["Sorry, you need to capture Gun Store 8 before this one", 5] call mf_notify_client;	};
			};

		};
		
	};






//BLUEFOR - BLUE
//=============================================================================================================
	

	if ((_trgt getVariable ['Side',''] == 'EAST') && (_playerteam == WEST)) then 
	{
		systemChat "Attempt: Convert East to West";
		
		switch (_trgtName) do  {
		
			case "GunStore8" : 	
			{ 	
				if ( (_GS7 == "WEST") && (_GS6 == "WEST") && (_GS5 == "WEST") && (_GS4 == "WEST") && (_GS3 == "WEST") && (_GS2 == "WEST") && (_GS1 == "WEST") ) then 
				{
					_trgt setVariable["Side", "WEST", true];
					["Gun Store Captured!", 5] call mf_notify_client;
				} else {
					["Sorry, you need to capture the previous Gun Stores before this one", 5] call mf_notify_client;
				};
			};

			case "GunStore7" : 	
			{ 	
				if (_GS6 == "WEST") then { _trgt setVariable["Side", "WEST", true]; ["Gun Store Captured!", 5] call mf_notify_client; } else { ["Sorry, you need to capture Gun Store 6 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore6" : 	
			{ 	
				if (_GS5 == "WEST") then { _trgt setVariable["Side", "WEST", true]; ["Gun Store Captured!", 5] call mf_notify_client; } else { ["Sorry, you need to capture Gun Store 5 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore5" : 	
			{ 	
				if (_GS4 == "WEST") then { _trgt setVariable["Side", "WEST", true]; ["Gun Store Captured!", 5] call mf_notify_client; } else { ["Sorry, you need to capture Gun Store 4 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore4" : 	
			{ 	
				if (_GS3 == "WEST") then { _trgt setVariable["Side", "WEST", true]; ["Gun Store Captured!", 5] call mf_notify_client; } else { ["Sorry, you need to capture Gun Store 3 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore3" : 	
			{ 	
				if (_GS2 == "WEST") then { _trgt setVariable["Side", "WEST", true]; ["Gun Store Captured!", 5] call mf_notify_client; } else { ["Sorry, you need to capture Gun Store 2 before this one", 5] call mf_notify_client;	};
			};

			case "GunStore2" : 	
			{ 	
				if (_GS1 == "WEST") then { _trgt setVariable["Side", "WEST", true]; ["Gun Store Captured!", 5] call mf_notify_client; } else { ["Sorry, you need to capture Gun Store 1 before this one", 5] call mf_notify_client;	};
			};

		};

	};












