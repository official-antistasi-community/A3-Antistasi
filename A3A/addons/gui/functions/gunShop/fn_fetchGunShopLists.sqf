// Send gun shop lists to client once they're ready

params ["_client"];

// Lists not generated yet. Do it now.
if (isNil "A3A_gunShopData") then {
    [] call A3A_GUI_fnc_gatherGunShopLists;
} else {
    if (count A3A_gunShopData == 0) then {
        // gatherGunShopLists is still running, wait for it
        waitUntil { sleep 0.01; count A3A_gunShopData > 0 };
    };
};

_client publicVariableClient "A3A_gunShopData";
