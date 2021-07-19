/*
This file covers:
  vehicle hardpoints, for loading loot boxes, Weapon and such.
  Offsets for the statics/crates/anything else you want to make loadable onto vehicles.
  weapon defines

These points are coordinates relative to the objects hitbox/mesh.
There is a command that can find the position on a vehicle that you are looking at available on the Git Repo's Wiki.
These coords generally don't have to be more than 2 decimal places for precision, more is just overkill and harms readability.

Always think of the next guy that may have to work on your code. Chances are it will be you!
*/

/*The first section is for setting the nodes that weapons and boxes should attach to.

    This has the model path for the vehicle, then 3 sections as follows; Node size (always 1), Node location and locked seats.

      The node location is a set of 3 coordinates in reference to the vehicle model, this defines where the node should be.

      The locked seat list is the set of seats that should be made unusable when the node has something on it.
      This stops people being clipped into the crate/static when it is loaded. It is populated with the seat IDs for each one to be disabled.
*/
A3A_logistics_vehicleHardpoints append [
  ["modelpath", [
    [1, [0,0,0], [1,2,3,4]]//This line would assign a cargo node at 0,0,0 on the model, and block seats 1-4 when in use.
    [1, [0,0,0], [1,2,3,4]]//This line would assign a cargo node at 0,0,0 on the model, and block seats 1-4 when in use.
  ]]
];//To make it easier to navigate, it is a good idea to keep the lines for similar vehicles together. Usually, we list 4 wheeled vehicles, then 6 wheeled, then 8 wheeled, then boats. It is also good to keep multiple versions of the same vehicle together, such as covered and open versions of the same truck.

/*The next section is for adding static weapons to the weapon sets.
  The weapon sets are used to tell the game what weapons can be mounted on what vehicles and are separated into 2 categories.
  smallVic and largeVic.
  smallVic is used for things like offroads, where low mounted weapons such as RHS's NSV cannot be used.
  largeVic is used for larger trucks where basically any weapon can be mounted and used.

  Adding weapons to these arrays is as simple as pasting the model path to the static weapon's model.
*/


/*The last section is for defining the offsets for statics, crates and any other item you might want to load onto a vehicle.
  This is usually separated into 3 sections; Weapons, Crates and Other.
  The first 2 are self explanatory, the 3rd is for things like quadbikes, as they can be loaded onto vehicles if they are initialised properly.
  This is filled by listing the model path, the coordinate offset(for tweaking it so that its base is centered on the node), and any angle offset it needs (in case the weapon should be facing any other direction than forward by default.),
  finally you list the node size that the entry should use from 1 to x, for reference a crate usually is either 1 or 2, and a static is 2 or 4, but it can be any size you want EXCEPT 0 or negative numbers!!!!
  in addition if your defining offsets for weapons youd want to add in one more entry after size that of recoil, this is how much newtonian force is applied to the vehicle when you fire the static
*/
A3A_logistics_attachmentOffset append [
//model           //offset        //rotation  //size  //recoil (if weapon)
  ["modelPath",     [0, 0, 0],      [0,0,0],    2,      200],   //some small static
  ["modelPath",     [0, 0, 0],      [0,0,0],    1]              //some small cargo
];

/*
    Next up is to add all covered or closed vehicles to this next section, this is needed to prevent statics being loaded inside of closed vehicles or covered vehicle, where they become usless, and it quite franckly looks silly.
    can be by classname or model
*/
A3A_logistics_coveredVehicles append [
    "modelPath", "modelPath", "className", "className"
];

/*
    Finally you need to declair weapons that you have added here, this is done with arrays consisting of pairs of the model of the weapon, and an array of all vehicle models the weapon is not allowed on.
    This blacklisted vehicles already include closed and covered vehicles so you don't have to add those
*/
A3A_logistics_weapons append [
    ["weaponModelPath", []]
    ,["weaponModelPath", ["vehModelPath", "vehModelPath"]]
];
//That covers everything, you should make you file by replacing values in an already complete file rather than using this as the active files will have the proper commenting there already. Using this one would leave a tonne of unnecessary comments in the file.
