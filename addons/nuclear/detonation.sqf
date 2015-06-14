private ["_object", "_xpos", "_ypos"];

_object = _this select 0;
_xpos = getpos _object select 0;
_ypos = getpos _object select 1;
call compile preprocessfile "addons\nuclear\config.sqf";

[_object] execvm "addons\nuclear\script\destroy.sqf";

[_xpos, _ypos] execvm "addons\nuclear\script\escape.sqf";

[] execVM "addons\nuclear\script\athmo.sqf";

sleep 2;

[_xpos, _ypos] execvm "addons\nuclear\script\glare.sqf";
[_xpos, _ypos] execvm "addons\nuclear\script\light.sqf";
[_xpos, _ypos] exec "addons\nuclear\script\blast_1.sqs";
[_xpos, _ypos] exec "addons\nuclear\script\blast1.sqs";
[_xpos, _ypos] exec "addons\nuclear\script\hat.sqs";
[_xpos, _ypos] execvm "addons\nuclear\script\ears.sqf";
[_xpos, _ypos] execvm "addons\nuclear\script\aperture.sqf";

sleep 0.5;
[_xpos, _ypos] exec "addons\nuclear\script\hatnod.sqs";
[_xpos, _ypos] exec "addons\nuclear\script\blast1.sqs";
[_xpos, _ypos] execvm "addons\nuclear\script\damage.sqf";

[_xpos, _ypos] exec "addons\nuclear\script\ring1.sqs";
sleep 0.5;
[_xpos, _ypos] exec "addons\nuclear\script\ring2.sqs";

[_xpos, _ypos] exec "addons\nuclear\script\blast2.sqs";
sleep 0.4;
[_xpos, _ypos] exec "addons\nuclear\script\blast3.sqs";

sleep 5;
[_xpos, _ypos] execvm "addons\nuclear\script\heartbeat.sqf";

sleep 60;

sleep 10;
[_xpos, _ypos] execvm "addons\nuclear\script\dust.sqf";
[_xpos, _ypos] execvm "addons\nuclear\script\snow.sqf";