#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"a3a_unit_west_rifleman"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_Events", "A3A_core", "A3A_config_fixes"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};
class CfgFunctions
{
    class A3A
    {
		class zeus{
            file = QPATHTOFOLDER(functions);
			class initUnitLoadout{};
		}
	};
};
class CfgEditorCategories
{
	class a3a_occupants
	{
		displayName = "A3A Occupants";
	};
	class a3a_invaders
	{
		displayName = "A3A Invaders";
	};
	class a3a_rebels
	{
		displayName = "A3A Rebels";
	};
	class a3a_civilian
	{
		displayName = "A3A Civilian";
	};
};
class CfgEditorSubcategories
{
	class a3a_men_internal
	{
		displayName = "Men (Internal A3A use)";
	};
	class a3a_military
	{
		displayName = "Men (Military)";
	};
	class a3a_militia
	{
		displayName = "Men (Militia)";
	};
	class a3a_specops
	{
		displayName = "Men (Spec Ops)";
	};
	class a3a_other
	{
		displayName = "Men (Other)";
	};
};

#include "CfgVehicles.hpp"