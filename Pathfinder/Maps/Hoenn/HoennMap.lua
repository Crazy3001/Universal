local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

local _ss = require (cpppdpath .. "Settings/Static_Settings")

return function()

local ss = _ss()
local H_SUBWAY = ss.H_SUBWAY

local HoennMap = {}

HoennMap["Abandoned Ship 1F Room 1"] = {["Abandoned Ship 1F_B"] = {1}}
HoennMap["Abandoned Ship 1F Room 2_A"] = {["Abandoned Ship 1F_A"] = {1}}
HoennMap["Abandoned Ship 1F Room 2_B"] = {["Abandoned Ship 1F_A"] = {1}}
HoennMap["Abandoned Ship 1F_A"] = {["Abandoned Ship B1F"] = {1}, ["Abandoned Ship 1F Room 2_A"] = {}, ["Abandoned Ship 1F Room 2_B"] = {}, ["Abandoned Ship Exterior_A"] = {1}}
HoennMap["Abandoned Ship 1F_B"] = {["Abandoned Ship Exterior_B"] = {1}, ["Abandoned Ship 1F Room 1"] = {1}, ["Abandoned Ship B1F"] = {1}}
HoennMap["Abandoned Ship B1F Room 1"] = {["Abandoned Ship B1F"] = {1}}
HoennMap["Abandoned Ship B1F Room 2"] = {["Abandoned Ship B1F"] = {1}}
HoennMap["Abandoned Ship B1F Room 3"] = {["Abandoned Ship B1F"] = {1}}
HoennMap["Abandoned Ship B1F Room 4"] = {["Abandoned Ship B1F"] = {1}}
HoennMap["Abandoned Ship B1F"] = {["Storage Unit"] = {1}, ["Abandoned Ship B1F Room 4"] = {1}, ["Abandoned Ship B1F Room 3"] = {1}, ["Abandoned Ship B1F Room 2"] = {1}, ["Abandoned Ship B1F Room 1"] = {1}, ["Abandoned Ship 1F_B"] = {1}, ["Abandoned Ship 1F_A"] = {1}}
HoennMap["Abandoned Ship Exterior_A"] = {["Abandoned Ship 1F_A"] = {1}, ["Route 108"] = {1}}
HoennMap["Abandoned Ship Exterior_B"] = {["Captains Office"] = {1}, ["Abandoned Ship 1F_B"] = {1}}
HoennMap["Ancient Tomb_A"] = {["Ancient Tomb_B"] = {1}, ["Route 120_A"] = {1}}
HoennMap["Ancient Tomb_B"] = {["Ancient Tomb_A"] = {1}}
HoennMap["Backdoor House 1"] = {["Backdoor House 2"] = {1}, ["Mossdeep City"] = {1}}
HoennMap["Backdoor House 2"] = {["Backdoor House 1"] = {1}}
HoennMap["Berry Masters House"] = {["Route 123_C"] = {1}}
HoennMap["Cable Car Station 1"] = {["Cable Car Station 2"] = {0.2}, ["Route 112_B"] = {0.2}}
HoennMap["Cable Car Station 2"] = {["Cable Car Station 1"] = {0.2}, ["Mt. Chimney"] = {0.2}}
HoennMap["Captains Office"] = {["Abandoned Ship Exterior_B"] = {1}}
HoennMap["Cave Of Steel 1F_A"] = {["Valley Of Steel_B"] = {1}, ["Cave Of Steel 2F"] = {1}}
HoennMap["Cave Of Steel 1F_B"] = {["Valley Of Steel_B"] = {1}}
HoennMap["Cave Of Steel 1F_C"] = {["Valley Of Steel Eastern Peak"] = {1}, ["Valley Of Steel_B"] = {1}}
HoennMap["Cave Of Steel 2F"] = {["Cave Of Steel 1F_A"] = {1}, ["Valley Of Steel_A"] = {1}}
HoennMap["Cave of Origin 1F"] = {["Cave of Origin B1F"] = {1}, ["Cave of Origin Entrance"] = {1}}
HoennMap["Cave of Origin B1F"] = {["Cave of Origin B2F"] = {1}, ["Cave of Origin 1F"] = {1}}
HoennMap["Cave of Origin B2F"] = {["Cave of Origin B3F"] = {1}, ["Cave of Origin B1F"] = {1}}
HoennMap["Cave of Origin B3F"] = {["Marine Cave Entrance"] = {1}, ["Terra Cave Entrance"] = {1}, ["Cave of Origin B2F"] = {1}}
HoennMap["Cave of Origin Entrance"] = {["Cave of Origin 1F"] = {1}, ["Sootopolis City"] = {1}}
HoennMap["Cutter House"] = {["Rustboro City_A"] = {1}}
HoennMap["Cycle Road Stop House 1"] = {["Route 110_B"] = {0.2}, ["Route 110_D"] = {0.2, {["items"] = {"Bicycle"}}}}
HoennMap["Cycle Road Stop House 2"] = {["Route 110_A"] = {0.2}, ["Route 110_D"] = {0.2, {["items"] = {"Bicycle"}}}}
HoennMap["Desert Ruins_A"] = {["Route 111 Desert"] = {1}, ["Desert Ruins_B"] = {1}}
HoennMap["Desert Ruins_B"] = {["Desert Ruins_A"] = {1}}
HoennMap["Desert Underpass Entrance"] = {["Fossil Maniac House"] = {1}}
HoennMap["Devon Corporation 1F"] = {["Devon Corporation 2F"] = {1}, ["Rustboro City_A"] = {1}}
HoennMap["Devon Corporation 2F"] = {["Devon Corporation 3F"] = {1}, ["Devon Corporation 1F"] = {1}}
HoennMap["Devon Corporation 3F"] = {["Devon Corporation 2F"] = {1}}
HoennMap["Dewford Town Gym"] = {["Dewford Town"] = {1}}
HoennMap["Dewford Town House 1"] = {["Dewford Town"] = {1}}
HoennMap["Dewford Town House 2"] = {["Dewford Town"] = {1}}
HoennMap["Dewford Town House 3"] = {["Dewford Town"] = {1}}
HoennMap["Dewford Town"] = {["Dewford Town Gym"] = {1}, ["Dewford Town House 3"] = {1}, ["Dewford Town House 2"] = {1}, ["Dewford Town House 1"] = {1}, ["Pokecenter Dewford Town"] = {1}, ["Route 106"] = {1}, ["Route 107"] = {1, {["abilities"] = {"surf"}}}}
HoennMap["Eastern House 1"] = {["Valley Of Steel Eastern Peak"] = {1}}
HoennMap["Eastern House 2"] = {["Valley Of Steel Eastern Peak"] = {1}}
HoennMap["Eastern House 3"] = {["Valley Of Steel Eastern Peak"] = {1}}
HoennMap["Ever Grande City_A"] = {["Pokecenter Ever Grande City"] = {1}, ["Ever Grande City_B"] = {1, {["abilities"] = {"dig"}}}, ["Route 128"] = {1, {["abilities"] = {"surf"}}}, ["Victory Road Hoenn 1F_A"] = {1}}
HoennMap["Ever Grande City_B"] = {["Ever Grande City_A"] = {1, {["abilities"] = {"dig"}}}, ["Pokemon League Hoenn"] = {1}, ["Victory Road Hoenn 1F_B"] = {1}}
HoennMap["Fallarbor House"] = {["Fallarbor Town"] = {1}}
HoennMap["Fallarbor Town"] = {["Fallarbor House"] = {1}, ["Professor Cozmo House"] = {1}, ["Mart Fallarbor Town"] = {1}, ["Pokecenter Fallarbor Town"] = {1}, ["Route 113"] = {1}, ["Route 114"] = {1}}
HoennMap["Feral Site_A"] = {["Feral Site_B"] = {1}, ["Fiery Path"] = {1}}
HoennMap["Feral Site_B"] = {["Feral Site_A"] = {1}}
HoennMap["Fiery Path"] = {["Feral Site_A"] = {1}, ["Route 112_A"] = {1.5}, ["Route 112_B"] = {1.5}}
HoennMap["Fortree City"] = {["Fortree Gym"] = {1}, ["Fortree House 1"] = {1}, ["Fortree House 2"] = {1}, ["Fortree House 3"] = {1}, ["Fortree House 4"] = {1}, ["Fortree House 5"] = {1}, ["Fortree House 6"] = {1}, ["Fortree Mart"] = {1}, ["Pokecenter Fortree City"] = {1}, ["Route 119A"] = {1}, ["Route 120_A"] = {1}}
HoennMap["Fortree Gym"] = {["Fortree City"] = {1}}
HoennMap["Fortree House 1"] = {["Fortree City"] = {1}}
HoennMap["Fortree House 2"] = {["Fortree City"] = {1}}
HoennMap["Fortree House 3"] = {["Fortree City"] = {1}}
HoennMap["Fortree House 4"] = {["Fortree City"] = {1}}
HoennMap["Fortree House 5"] = {["Fortree City"] = {1}}
HoennMap["Fortree House 6"] = {["Fortree City"] = {1}}
HoennMap["Fortree Mart"] = {["Fortree City"] = {1}}
HoennMap["Fossil Maniac House"] = {["Desert Underpass Entrance"] = {1}, ["Route 114"] = {1}}
HoennMap["Glacial Site"] = {["Route 103_C"] = {1}}
HoennMap["Granite Cave 1F2"] = {["Granite Cave 1F_B"] = {1}}
HoennMap["Granite Cave 1F_A"] = {["Granite Cave B1F_A"] = {1}, ["Route 106"] = {1}}
HoennMap["Granite Cave 1F_B"] = {["Granite Cave B1F_B"] = {1}, ["Granite Cave 1F2"] = {1}}
HoennMap["Granite Cave B1F_A"] = {["Granite Cave B2F_C"] = {1}, ["Granite Cave B2F_B"] = {1}, ["Granite Cave B2F_D"] = {1}, ["Granite Cave B2F_A"] = {1}, ["Granite Cave 1F_A"] = {1}}
HoennMap["Granite Cave B1F_B"] = {["Granite Cave B2F_D"] = {1}, ["Granite Cave 1F_B"] = {1}}
HoennMap["Granite Cave B2F_A"] = {["Granite Cave B1F_A"] = {1}}
HoennMap["Granite Cave B2F_B"] = {["Granite Cave B1F_A"] = {1}}
HoennMap["Granite Cave B2F_C"] = {["Granite Cave B1F_A"] = {1}}
HoennMap["Granite Cave B2F_D"] = {["Granite Cave B1F_A"] = {1}, ["Granite Cave B1F_B"] = {1}}
HoennMap["Haunted Site"] = {["Rusturf Tunnel_C"] = {1}}
HoennMap["Historical Site_A"] = {["Historical Site_B"] = {1}, ["Historical Site_C"] = {1}, ["Route 111 Desert"] = {1}}
HoennMap["Historical Site_B"] = {["Historical Site_A"] = {1}}
HoennMap["Historical Site_C"] = {["Historical Site_A"] = {1}}
HoennMap["Hoenn Safari Zone Area 1"] = {["Hoenn Safari Zone Lobby"] = {1}, ["Hoenn Safari Zone Area 2_A"] = {1}, ["Hoenn Safari Zone Area 2_B"] = {1}, ["Hoenn Safari Zone Area 4"] = {1}, ["Hoenn Safari Zone Area 5"] = {1}}
HoennMap["Hoenn Safari Zone Area 2_A"] = {["Hoenn Safari Zone Area 1"] = {1}}
HoennMap["Hoenn Safari Zone Area 2_B"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Hoenn Safari Zone Area 2_A"] = {0.5}}
HoennMap["Hoenn Safari Zone Area 2_C"] = {["Hoenn Safari Zone Area 2_B"] = {0}, ["Hoenn Safari Zone Area 3"] = {0.2}}
HoennMap["Hoenn Safari Zone Area 2_D"] = {["Hoenn Safari Zone Area 2_A"] = {0}, ["Hoenn Safari Zone Area 3"] = {0.2}}
HoennMap["Hoenn Safari Zone Area 3"] = {["Hoenn Safari Zone Area 4"] = {1}, ["Hoenn Safari Zone Area 2_C"] = {1}, ["Hoenn Safari Zone Area 2_D"] = {1}}
HoennMap["Hoenn Safari Zone Area 4"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Hoenn Safari Zone Area 3"] = {1}}
HoennMap["Hoenn Safari Zone Area 5"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Hoenn Safari Zone Area 6"] = {1}}
HoennMap["Hoenn Safari Zone Area 6"] = {["Hoenn Safari Zone Area 5"] = {1}}
HoennMap["Hoenn Safari Zone Lobby"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Route 121"] = {1}}
HoennMap["Island Cave_A"] = {["Island Cave_B"] = {1}, ["Route 105"] = {1}}
HoennMap["Island Cave_B"] = {["Island Cave_A"] = {1}}
HoennMap["Jagged Pass_A"] = {["Mt. Chimney"] = {1}, ["Jagged Pass_B"] = {0.5}}
HoennMap["Jagged Pass_B"] = {["Jagged Pass_C"] = {0.5}}
HoennMap["Jagged Pass_C"] = {["Route 112_C"] = {0.5}}
HoennMap["Jura Cave"] = {["Jura Pass"] = {1}}
HoennMap["Jura Pass"] = {["Jura Cave"] = {1}, ["Leev Town"] = {1}}
HoennMap["Lab Littleroot Town"] = {["Littleroot Town"] = {1}}
HoennMap["Lavaridge Mart"] = {["Lavaridge Town"] = {1}}
HoennMap["Lavaridge Town Gym 1F_A"] = {["Lavaridge Town Gym B1F_I"] = {1}, ["Lavaridge Town Gym B1F_D"] = {1}, ["Lavaridge Town"] = {1}}
HoennMap["Lavaridge Town Gym 1F_B"] = {["Lavaridge Town Gym B1F_H"] = {1}, ["Lavaridge Town Gym 1F_A"] = {1}}
HoennMap["Lavaridge Town Gym 1F_C"] = {["Lavaridge Town Gym B1F_D"] = {1}, ["Lavaridge Town Gym B1F_B"] = {1}}
HoennMap["Lavaridge Town Gym 1F_D"] = {["Lavaridge Town Gym B1F_C"] = {1}, ["Lavaridge Town Gym 1F_C"] = {1}, ["Lavaridge Town Gym 1F_B"] = {1}}
HoennMap["Lavaridge Town Gym 1F_E"] = {["Lavaridge Town Gym B1F_A"] = {1}, ["Lavaridge Town Gym B1F_B"] = {1}}
HoennMap["Lavaridge Town Gym 1F_F"] = {["Lavaridge Town Gym B1F_E"] = {1}, ["Lavaridge Town Gym B1F_A"] = {1}, ["Lavaridge Town Gym B1F_F"] = {1}}
HoennMap["Lavaridge Town Gym 1F_G"] = {["Lavaridge Town Gym B1F_G"] = {1}, ["Lavaridge Town Gym B1F_A"] = {1}}
HoennMap["Lavaridge Town Gym B1F_A"] = {["Lavaridge Town Gym 1F_G"] = {1}, ["Lavaridge Town Gym 1F_F"] = {1}, ["Lavaridge Town Gym 1F_E"] = {1}}
HoennMap["Lavaridge Town Gym B1F_B"] = {["Lavaridge Town Gym B1F_J"] = {1}, ["Lavaridge Town Gym 1F_C"] = {1}, ["Lavaridge Town Gym B1F_D"] = {1}, ["Lavaridge Town Gym 1F_E"] = {1}}
HoennMap["Lavaridge Town Gym B1F_C"] = {["Lavaridge Town Gym B1F_D"] = {1}}
HoennMap["Lavaridge Town Gym B1F_D"] = {["Lavaridge Town Gym 1F_A"] = {1}, ["Lavaridge Town Gym 1F_D"] = {1}, ["Lavaridge Town Gym 1F_C"] = {1}}
HoennMap["Lavaridge Town Gym B1F_E"] = {["Lavaridge Town Gym 1F_A"] = {1}}
HoennMap["Lavaridge Town Gym B1F_F"] = {["Lavaridge Town Gym B1F_H"] = {1}}
HoennMap["Lavaridge Town Gym B1F_G"] = {}
HoennMap["Lavaridge Town Gym B1F_H"] = {["Lavaridge Town Gym 1F_B"] = {1}}
HoennMap["Lavaridge Town Gym B1F_I"] = {["Lavaridge Town Gym 1F_A"] = {1}, ["Lavaridge Town Gym B1F_H"] = {1}}
HoennMap["Lavaridge Town Gym B1F_J"] = {["Lavaridge Town Gym B1F_B"] = {1}}
HoennMap["Lavaridge Town Herb Shop"] = {["Lavaridge Town"] = {1}}
HoennMap["Lavaridge Town House"] = {["Lavaridge Town"] = {1}}
HoennMap["Lavaridge Town"] = {["Valley Of Steel Entrance"] = {1}, ["Lavaridge Town Gym 1F_A"] = {1}, ["Lavaridge Town House"] = {1}, ["Lavaridge Town Herb Shop"] = {1}, ["Lavaridge Mart"] = {1}, ["Pokecenter Lavaridge Town"] = {1}, ["Route 112_C"] = {1}} -- links
HoennMap["Leev Town Entrance"] = {["Leev Town"] = {1}, ["Leev Town Port"] = {1}}
HoennMap["Leev Town Port"] = {["Leev Town Entrance"] = {1}, ["Lilycove City Harbor"] = {1}}
HoennMap["Leev Town"] = {["Jura Pass"] = {1}, ["Pokecenter Leev Town"] = {1}, ["Leev Town Entrance"] = {1}}
HoennMap["Lilycove CIty House 3"]--[[Capital I in CIty]] = {["Lilycove City"] = {1}} 
HoennMap["Lilycove City Harbor"] = {["Leev Town Port"] = {1}, ["Lilycove City"] = {0.2}}
HoennMap["Lilycove City House 1"] = {["Lilycove City"] = {1}}
HoennMap["Lilycove City House 2"] = {["Lilycove City"] = {1}}
HoennMap["Lilycove City House 4"] = {["Lilycove City"] = {1}}
HoennMap["Lilycove City House 5"] = {["Lilycove City"] = {1}}
HoennMap["Lilycove City"] = {["Team Aqua Hideout  Entrance"] = {1}, ["Lilycove Motel 1F"] = {1}, ["Lilycove Museum 1F"] = {1}, ["Lilycove City House 1"] = {1}, ["Lilycove City House 2"] = {1}, ["Lilycove CIty House 3"] = {1}, ["Lilycove City House 4"] = {1}, ["Lilycove City House 5"] = {1}, ["Lilycove City Harbor"] = {1}, ["Pokecenter Lilycove City"] = {1}, ["Route 121"] = {1}, ["Route 124_A"] = {1, {["abilities"] = {"surf"}}}, ["Lilycove Department Store 1F"] = {1}}
HoennMap["Lilycove Department Store 1F"] = {["Lilycove City"] = {1}, ["Lilycove Department Store 2F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 2F"] = {["Lilycove Department Store 1F"] = {1}, ["Lilycove Department Store 3F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 3F"] = {["Lilycove Department Store 2F"] = {1}, ["Lilycove Department Store 4F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 4F"] = {["Lilycove Department Store 3F"] = {1}, ["Lilycove Department Store 5F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 5F"] = {["Lilycove Department Store 4F"] = {1}, ["Lilycove Department Store Roof"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store Elevator"] = {["Lilycove Department Store 1F"] = {0.2}, ["Lilycove Department Store 2F"] = {0.2}, ["Lilycove Department Store 3F"] = {0.2}, ["Lilycove Department Store 4F"] = {0.2}, ["Lilycove Department Store 5F"] = {0.2}}
HoennMap["Lilycove Department Store Roof"] = {["Lilycove Department Store 5F"] = {1}}
HoennMap["Lilycove Motel 1F"] = {["Lilycove Motel 2F"] = {1}, ["Lilycove City"] = {1}}
HoennMap["Lilycove Motel 2F"] = {["Lilycove Motel 1F"] = {1}}
HoennMap["Lilycove Museum 1F"] = {["Lilycove Museum 2F"] = {1}, ["Lilycove City"] = {1}}
HoennMap["Lilycove Museum 2F"] = {["Lilycove Museum 1F"] = {1}}
HoennMap["Littleroot Town Truck"] = {["Littleroot Town"] = {1}}
HoennMap["Littleroot Town"] = {["Player House Littleroot Town"] = {1}, ["Prof. Birch House"] = {1}, ["Lab Littleroot Town"] = {1}, ["Littleroot Town Truck"] = {1}, ["Route 101"] = {1}}
HoennMap["Low Tide Entrance Room_A"] = {["Route 125"] = {1}}
HoennMap["Marine Cave End"] = {["Marine Cave Entrance"] = {1}} --aqua leader archie (10,28)
HoennMap["Marine Cave Entrance"] = {["Marine Cave End"] = {1}--[[need to speak to npc first (16,3)]], ["Cave of Origin B3F"] = {1}}
HoennMap["Mart Fallarbor Town"] = {["Fallarbor Town"] = {1}}
HoennMap["Mart Mauville City"] = {["Mauville City"] = {1}}
HoennMap["Mart Oldale Town"] = {["Oldale Town"] = {1}}
HoennMap["Mart Petalburg City"] = {["Petalburg City"] = {1}}
HoennMap["Mart Rustboro City"] = {["Rustboro City_A"] = {1}}
HoennMap["Mart Slateport"] = {["Slateport City"] = {1}}
HoennMap["Mauville City Game Corner"] = {["Mauville City"] = {1}}
HoennMap["Mauville City Gym"] = {["Mauville City"] = {1}}
HoennMap["Mauville City House 1"] = {["Mauville City"] = {1}}
HoennMap["Mauville City House 2"] = {["Mauville City"] = {1}}
HoennMap["Mauville City Stop House 1"] = {["Mauville City"] = {0.2}, ["Route 110_A"] = {0.2}}
HoennMap["Mauville City Stop House 2"] = {["Mauville City"] = {0.2}, ["Route 117"] = {0.2}}
HoennMap["Mauville City Stop House 3"] = {["Mauville City"] = {0.2}, ["Route 111 South"] = {0.2}}
HoennMap["Mauville City Stop House 4"] = {["Mauville City"] = {0.2}, ["Route 118_A"] = {0.2}}
HoennMap["Mauville City"] = {["Mauville City Gym"] = {1}, ["Rydels Cycles"] = {1}, ["Mauville City Game Corner"] = {1}, ["Mauville City House 1"] = {1}, ["Mauville City House 2"] = {1}, ["Mart Mauville City"] = {1}, ["Mauville City Stop House 1"] = {1}, ["Mauville City Stop House 2"] = {1}, ["Mauville City Stop House 3"] = {1}, ["Mauville City Stop House 4"] = {1}, ["Pokecenter Mauville City"] = {1}}
HoennMap["Meteor Falls 1F 2R_A"] = {["Meteor Falls 1F 2R_B"] = {1}, ["Meteor falls B1F 1R_A"] = {1}}
HoennMap["Meteor Falls 1F 2R_B"] = {["Meteor falls 1F 1R_B"] = {1.5}, ["Meteor falls B1F 1R_A"] = {1}, ["Meteor falls B1F 1R_B"] = {1}}
HoennMap["Meteor Falls B1F 2R"] = {["Meteor falls B1F 1R_B"] = {1}}
HoennMap["Meteor falls 1F 1R_A"] = {["Route 114"] = {1.5}, ["Meteor falls 1F 1R_X"] = {0.7}}
HoennMap["Meteor falls 1F 1R_B"] = {["Meteor Falls 1F 2R_B"] = {0.5}, ["Meteor falls 1F 1R_A"] = {1}}
HoennMap["Meteor falls 1F 1R_C"] = {["Meteor falls B1F 1R_A"] = {0.5}}
HoennMap["Meteor falls 1F 1R_D"] = {["Meteor falls B1F 1R_B"] = {0.5}}
HoennMap["Meteor falls 1F 1R_X"] = {["Meteor falls 1F 1R_A"] = {0.7}, ["Route 115_A"] = {1.5}}
HoennMap["Meteor falls B1F 1R_A"] = {["Meteor falls 1F 1R_C"] = {1}, ["Meteor Falls 1F 2R_B"] = {1}, ["Meteor Falls 1F 2R_A"] = {1}}
HoennMap["Meteor falls B1F 1R_B"] = {["Meteor Falls 1F 2R_B"] = {1.5}, ["Meteor Falls B1F 2R"] = {1.5}, ["Meteor falls 1F 1R_D"] = {1.5}}
HoennMap["Mineral Site_A"] = {["Mineral Site_B"] = {1}, ["Route 115_A"] = {1}}
HoennMap["Mineral Site_B"] = {["Mineral Site_A"] = {1}}
HoennMap["Moon 1F_A"] = {["Moon_A"] = {1}, ["Moon_B"] = {1}, ["Moon B1F_C"] = {1}}
HoennMap["Moon 1F_B"] = {["Moon_B"] = {1}, ["Moon_C"] = {1}, ["Moon B1F_A"] = {1}}
HoennMap["Moon 1F_C"] = {["Moon_C"] = {1}, ["Moon B1F_B"] = {1}}
HoennMap["Moon 1F_D"] = {["Moon_D"] = {1}, ["Moon B1F_D"] = {1}}
HoennMap["Moon 1F_E"] = {} -- not in story yet
HoennMap["Moon 2F_A"] = {["Moon B1F_D"] = {1}, ["Moon 2F_B"] = {1}}
HoennMap["Moon 2F_B"] = {["Moon 2F_A"] = {1}, ["Moon_E"] = {1}}
HoennMap["Moon B1F_A"] = {["Moon 1F_B"] = {1}}
HoennMap["Moon B1F_B"] = {["Sootopolis City"] = {1}, ["Moon 1F_C"] = {1}}
HoennMap["Moon B1F_C"] = {["Moon 1F_A"] = {1}}
HoennMap["Moon B1F_D"] = {["Moon B1F_C"] = {1}, ["Moon 1F_D"] = {1}, ["Moon 2F_A"] = {1}}
HoennMap["Moon_A"] = {["Moon 1F_A"] = {1}}
HoennMap["Moon_B"] = {["Moon_A"] = {1}, ["Moon 1F_A"] = {1}, ["Moon 1F_B"] = {1}}
HoennMap["Moon_C"] = {["Moon_D"] = {1}, ["Moon 1F_B"] = {1}, ["Moon 1F_C"] = {1}}
HoennMap["Moon_D"] = {["Moon_A"] = {1}, ["Moon 1F_D"] = {1}}
HoennMap["Moon_E"] = {["Moon 2F_A"] = {1}}
HoennMap["Mossdeep City House"] = {["Mossdeep City"] = {1}}
HoennMap["Mossdeep City Space Center 1F"] = {["Mossdeep City Space Center 2F"] = {1}, ["Mossdeep City"] = {1}}
HoennMap["Mossdeep City Space Center 2F"] = {["Moon_A"] = {1}, ["Mossdeep City Space Center 1F"] = {1}}
HoennMap["Mossdeep City"] = {["Mossdeep Gym_A"] = {1}, ["Mossdeep City Space Center 1F"] = {1}, ["Stevens House"] = {1}, ["Mossdeep City House"] = {1}, ["Secret Base Boy House"] = {1}, ["Backdoor House 1"] = {1}, ["Pokeblock Enthusiasts House"] = {1}, ["Mossdeep Pokemart"] = {1}, ["Pokecenter Mossdeep City"] = {1}, ["Route 124_A"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 125"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 127_A"] = {1.5, {["abilities"] = {"surf"}}}}
HoennMap["Mossdeep Gym_A"] = {["Mossdeep City"] = {1}, ["Mossdeep Gym_D"] = {1}, ["Mossdeep Gym_C"] = {1}, ["Mossdeep Gym_B"] = {1}}
HoennMap["Mossdeep Gym_B"] = {["Mossdeep Gym_A"] = {1}, ["Mossdeep Gym_D"] = {1}, ["Mossdeep Gym_F"] = {1}}
HoennMap["Mossdeep Gym_C"] = {["Mossdeep Gym_E"] = {1}, ["Mossdeep Gym_A"] = {1}}
HoennMap["Mossdeep Gym_D"] = {["Mossdeep Gym_F"] = {1}, ["Mossdeep Gym_B"] = {1}, ["Mossdeep Gym_E"] = {1}}
HoennMap["Mossdeep Gym_E"] = {["Mossdeep Gym_D"] = {1}, ["Mossdeep Gym_C"] = {1}}
HoennMap["Mossdeep Gym_F"] = {["Mossdeep Gym_B"] = {1}, ["Mossdeep Gym_D"] = {1}}
HoennMap["Mossdeep Pokemart"] = {["Mossdeep City"] = {1}}
HoennMap["Mt. Chimney"] = {["Cable Car Station 2"] = {1}, ["Jagged Pass_A"] = {1}}
HoennMap["Mt. Pyre 1F"] = {["Route 122"] = {1.5}, ["Mt. Pyre 2F"] = {1.5}}
HoennMap["Mt. Pyre 2F"] = {["Mt. Pyre 1F"] = {1.5}, ["Mt. Pyre 3F"] = {1.5}}
HoennMap["Mt. Pyre 3F"] = {["Mt. Pyre 2F"] = {1.5}, ["Mt. Pyre 4F"] = {1.5}, ["Mt. Pyre Exterior"] = {1.5}}
HoennMap["Mt. Pyre 4F"] = {["Mt. Pyre 3F"] = {1.5}}
HoennMap["Mt. Pyre Exterior"] = {["Mt. Pyre 3F"] = {3}, ["Mt. Pyre Summit"] = {3}}
HoennMap["Mt. Pyre Summit"] = {["Mt. Pyre Exterior"] = {1.5}}
HoennMap["Natural Site"] = {["Route 119A"] = {1}}
HoennMap["New Mauville Entrance"] = {["Route 110_C"] = {1}, ["New Mauville"] = {1}--[[talk to shelly maybe 12, 7]]}
HoennMap["New Mauville"] = {["New Mauville Entrance"] = {1}} -- not fully supported with npc restrictions
HoennMap["Old Lady House"] = {["Route 111 North"] = {1}}
HoennMap["Oldale Town House 1"] = {["Oldale Town"] = {1}}
HoennMap["Oldale Town House 2"] = {["Oldale Town"] = {1}}
HoennMap["Oldale Town"] = {["Oldale Town House 2"] = {1}, ["Oldale Town House 1"] = {1}, ["Mart Oldale Town"] = {1}, ["Pokecenter Oldale Town"] = {1}, ["Route 101"] = {1}, ["Route 102"] = {1}, ["Route 103_A"] = {1}}
HoennMap["Pacifidlog Town House 1"] = {["Pacifidlog Town"] = {1}}
HoennMap["Pacifidlog Town House 2"] = {["Pacifidlog Town"] = {1}}
HoennMap["Pacifidlog Town House 3"] = {["Pacifidlog Town"] = {1}}
HoennMap["Pacifidlog Town House 4"] = {["Pacifidlog Town"] = {1}}
HoennMap["Pacifidlog Town House 5"] = {["Pacifidlog Town"] = {1}}
HoennMap["Pacifidlog Town"] = {["Pacifidlog Town House 1"] = {1}, ["Pacifidlog Town House 2"] = {1}, ["Pacifidlog Town House 3"] = {1}, ["Pacifidlog Town House 4"] = {1}, ["Pacifidlog Town House 5"] = {1}, ["Pokecenter Pacifidlog Town"] = {1}, ["Route 131"] = {1}, ["Route 132"] = {1}}
HoennMap["Petalburg City Gym_A"] = {["Petalburg City Gym_C"] = {1}, ["Petalburg City Gym_B"] = {1}, ["Petalburg City"] = {1}}
HoennMap["Petalburg City Gym_B"] = {["Petalburg City Gym_A"] = {1}, ["Petalburg City Gym_D"] = {1}, ["Petalburg City Gym_E"] = {1}}
HoennMap["Petalburg City Gym_C"] = {["Petalburg City Gym_A"] = {1}, ["Petalburg City Gym_E"] = {1}, ["Petalburg City Gym_F"] = {1}}
HoennMap["Petalburg City Gym_D"] = {["Petalburg City Gym_B"] = {1}, ["Petalburg City Gym_G"] = {1}}
HoennMap["Petalburg City Gym_E"] = {["Petalburg City Gym_G"] = {1}, ["Petalburg City Gym_B"] = {1}, ["Petalburg City Gym_C"] = {1}}
HoennMap["Petalburg City Gym_F"] = {["Petalburg City Gym_C"] = {1}}
HoennMap["Petalburg City Gym_G"] = {["Petalburg City Gym_I"] = {1}, ["Petalburg City Gym_D"] = {1}, ["Petalburg City Gym_E"] = {1}}
HoennMap["Petalburg City Gym_H"] = {["Petalburg City Gym_I"] = {1}}
HoennMap["Petalburg City Gym_I"] = {["Petalburg City Gym_H"] = {1}, ["Petalburg City Gym_G"] = {1}}
HoennMap["Petalburg City House 1"] = {["Petalburg City"] = {1}}
HoennMap["Petalburg City House 2"] = {["Petalburg City"] = {1}}
HoennMap["Petalburg City Wallys House"] = {["Petalburg City"] = {1}}
HoennMap["Petalburg City"] = {["Petalburg City Wallys House"] = {1}, ["Petalburg City Gym_A"] = {1}, ["Petalburg City House 2"] = {1}, ["Petalburg City House 1"] = {1}, ["Mart Petalburg City"] = {1}, ["Pokecenter Petalburg City"] = {1}, ["Route 102"] = {1}, ["Route 104_B"] = {1}}
HoennMap["Petalburg Maze"] = {["Petalburg Woods_B"] = {1}}
HoennMap["Petalburg Woods_A"] = {["Route 104_A"] = {1}, ["Route 104_B"] = {1}, ["Route 104_C"] = {1}, ["Petalburg Woods_B"] = {1, {["abilities"] = {"cut"}}}}
HoennMap["Petalburg Woods_B"] = {["Petalburg Maze"] = {1}, ["Petalburg Woods_A"] = {1}} -- link inside wood
HoennMap["Player Bedroom Littleroot Town"] = {["Player House Littleroot Town"] = {1}}
HoennMap["Player House Littleroot Town"] = {["Player Bedroom Littleroot Town"] = {1}, ["Littleroot Town"] = {1}}
HoennMap["Pokeblock Enthusiasts House"] = {["Mossdeep City"] = {1}}
HoennMap["Pokecenter Dewford Town"] = {["Dewford Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Eastern Peak"] = {["Valley Of Steel Eastern Peak"] = {1}}
HoennMap["Pokecenter Ever Grande City"] = {["Ever Grande City_A"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Fallarbor Town"] = {["Fallarbor Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Fortree City"] = {["Fortree City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Lavaridge Town"] = {["Lavaridge Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Leev Town"] = {["Leev Town"] = {1}}
HoennMap["Pokecenter Lilycove City"] = {["Lilycove City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Mauville City"] = {["Mauville City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Mossdeep City"] = {["Mossdeep City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Oldale Town"] = {["Oldale Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Pacifidlog Town"] = {["Pacifidlog Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Petalburg City"] = {["Petalburg City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Rustboro City"] = {["Rustboro City_A"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Slateport"] = {["Slateport City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Sootopolis City"] = {["Sootopolis City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Verdanturf"] = {["Verdanturf Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Western Peak"] = {["Valley Of Steel Western Peak"] = {1}}
HoennMap["Pokemon League Hoenn"] = {["Ever Grande City_B"] = {1}}
HoennMap["Pokemon Trainers School"] = {["Rustboro City_A"] = {1}}
HoennMap["Prof. Birch Bedroom"] = {["Prof. Birch House"] = {1}}
HoennMap["Prof. Birch House"] = {["Prof. Birch Bedroom"] = {1}, ["Littleroot Town"] = {1}}
HoennMap["Professor Cozmo House"] = {["Fallarbor Town"] = {1}}
HoennMap["Route 101"] = {["Littleroot Town"] = {1}, ["Oldale Town"] = {1}}
HoennMap["Route 102"] = {["Oldale Town"] = {1}, ["Petalburg City"] = {1}}
HoennMap["Route 103_A"] = {["Oldale Town"] = {0.5}, ["Route 103_B"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 103_B"] = {["Route 103_C"] = {0, {["abilities"] = {"cut"}}}, ["Route 103_A"] = {0.5, {["abilities"] = {"surf"}}}, ["Route 103_D"] = {0.5, {["abilities"] = {"surf"}}}, ["Route 110_B"] = {1}}
HoennMap["Route 103_C"] = {["Glacial Site"] = {1}, ["Route 103_B"] = {0, {["abilities"] = {"surf"}}}}
HoennMap["Route 103_D"] = {["Route 103_B"] = {0, {["abilities"] = {"cut"}}}}
HoennMap["Route 104 House"] = {["Route 104_A"] = {1}}
HoennMap["Route 104 Sailor House"] = {["Route 104_B"] = {1}}
HoennMap["Route 104_A"] = {["Route 104 House"] = {1}, ["Petalburg Woods_A"] = {1}, ["Rustboro City_A"] = {1}, ["Rustboro City_B"] = {1.1}}
HoennMap["Route 104_B"] = {["Route 104 Sailor House"] = {1}, ["Petalburg Woods_A"] = {1}, ["Route 105"] = {1.5, {["abilities"] = {"surf"}}}, ["Petalburg City"] = {1}}
HoennMap["Route 104_C"] = {["Route 104_B"] = {0.5}}
HoennMap["Route 105"] = {["Island Cave_A"] = {1}, ["Route 104_B"] = {3}, ["Route 106"] = {3}}
HoennMap["Route 106"] = {["Granite Cave 1F_A"] = {1}, ["Dewford Town"] = {1.5}, ["Route 105"] = {1.5, {["abilities"] = {"surf"}}}} -- link cave
HoennMap["Route 107"] = {["Dewford Town"] = {2}, ["Route 108"] = {2}}
HoennMap["Route 108"] = {["Abandoned Ship Exterior_A"] = {1}, ["Route 107"] = {2}, ["Route 109"] = {2}} -- link abandoned ship
HoennMap["Route 109 House"] = {["Route 109"] = {1}}
HoennMap["Route 109"] = {["Route 109 House"] = {1}, ["Route 108"] = {2, {["abilities"] = {"surf"}}}, ["Slateport City"] = {2}}
HoennMap["Route 110_A"] = {["Mauville City Stop House 1"] = {1}, ["Cycle Road Stop House 2"] = {1}, ["Route 110_B"] = {2}, ["Route 110_C"] = {1.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 110_B"] = {["Trick House"] = {1}, ["Route 103_B"] = {1}, ["Slateport City"] = {1}, ["Cycle Road Stop House 1"] = {1}, ["Route 110_A"] = {2}}
HoennMap["Route 110_C"] = {["Route 110_A"] = {1.5, {["abilities"] = {"surf"}}}, ["New Mauville Entrance"] = {1}}
HoennMap["Route 110_D"] = {["Cycle Road Stop House 1"] = {0.5}, ["Cycle Road Stop House 2"] = {0.5}}
HoennMap["Route 111 Desert"] = {["Historical Site_A"] = {1}, ["Desert Ruins_A"] = {1}, ["Route 111 North"] = {1}, ["Route 111 South"] = {1}}
HoennMap["Route 111 House 1"] = {["Route 111 South"] = {1}}
HoennMap["Route 111 North"] = {["Old Lady House"] = {1}, ["Route 111 Desert"] = {1, {["items"] = {"Go-Goggles"}}}, ["Route 112_A"] = {1}, ["Route 113"] = {1}}
HoennMap["Route 111 South"] = {["Route 111 House 1"] = {1}, ["Mauville City Stop House 3"] = {1.5}, ["Route 111 Desert"] = {1.5, {["items"] = {"Go-Goggles"}}}, ["Route 112_B"] = {1.5}}
HoennMap["Route 112_A"] = {["Fiery Path"] = {1}, ["Route 111 North"] = {1}}
HoennMap["Route 112_B"] = {["Cable Car Station 1"] = {1}, ["Fiery Path"] = {1}, ["Route 111 South"] = {1}}
HoennMap["Route 112_C"] = {["Lavaridge Town"] = {0.5}, ["Jagged Pass_C"] = {0.5}, ["Route 112_B"] = {0.5}}
HoennMap["Route 113"] = {["Fallarbor Town"] = {1.5}, ["Route 111 North"] = {1.5}}
HoennMap["Route 114 House"] = {["Route 114"] = {1}}
HoennMap["Route 114"] = {["Route 114 House"] = {1}, ["Fossil Maniac House"] = {1}, ["Fallarbor Town"] = {1.5}, ["Meteor falls 1F 1R_A"] = {1.5}}
HoennMap["Route 115_A"] = {["Mineral Site_A"] = {1}, ["Meteor falls 1F 1R_X"] = {1}, ["Route 115_B"] = {0.5}, ["Route 115_C"] = {1, {["abilities"] = {"surf"}}}}
HoennMap["Route 115_B"] = {["Route 115_A"] = {0.5, {["abilities"] = {"surf"}}}, ["Rustboro City_A"] = {1}}
HoennMap["Route 115_C"] = {["Route 115_A"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 115_B"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 115_E"] = {1.5, {["abilities"] = {"rock climb"}}}, ["Route 115_D"] = {1.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Route 115_D"] = {["Route 115_C"] = {0.5}, ["Meteor falls 1F 1R_C"] = {0.5}}
HoennMap["Route 115_E"] = {["Route 115_C"] = {1}}
HoennMap["Route 116 House"] = {["Route 116_A"] = {0.5}}
HoennMap["Route 116_A"] = {["Route 116 House"] = {1}, ["Rustboro City_A"] = {1}, ["Rusturf Tunnel_A"] = {1}, ["Route 116_C"] = {0.5, {["abilities"] = {"cut"}}}, ["Route 116_B"] = {1, {["abilities"] = {"dig"}}}, ["Verdanturf Town"] = {1, {["abilities"] = {"dig"}}}}
HoennMap["Route 116_B"] = {["Rusturf Tunnel_B"] = {1}, ["Route 116_A"] = {1, {["abilities"] = {"dig"}}}, ["Verdanturf Town"] = {1, {["abilities"] = {"dig"}}}}
HoennMap["Route 116_C"] = {["Route 116_A"] = {0.5}}
HoennMap["Route 117"] = {["Mauville City Stop House 2"] = {1.5}, ["Verdanturf Town"] = {1.5}}
HoennMap["Route 118_A"] = {["Mauville City Stop House 4"] = {0.5}, ["Route 118_B"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 118_B"] = {["Route 118_A"] = {0.5, {["abilities"] = {"surf"}}}, ["Route 119B"] = {0.5}, ["Route 123_C"] = {0.5}}
HoennMap["Route 119A"] = {["Natural Site"] = {1}, ["Weather Institute 1F"] = {1}, ["Fortree City"] = {2}, ["Route 119B"] = {2}}
HoennMap["Route 119B House"] = {["Route 119B"] = {1}}
HoennMap["Route 119B"] = {["Route 119B House"] = {1}, ["Route 118_B"] = {2}, ["Route 119A"] = {2}}
HoennMap["Route 120_A"] = {["Ancient Tomb_A"] = {1}, ["Fortree City"] = {2}, ["Route 121"] = {2}, ["Route 120_B"] = {2, {["abilities"] = {"surf"}}}}
HoennMap["Route 120_B"] = {["Route 120_A"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 121"] = {["Lilycove City"] = {1.5}, ["Route 120_A"] = {1.5}, ["Route 122"] = {1.5, {["abilities"] = {"surf"}}}, ["Hoenn Safari Zone Lobby"] = {1.5}}
HoennMap["Route 122"] = {["Route 121"] = {2, {["abilities"] = {"surf"}}}, ["Route 123_A"] = {2, {["abilities"] = {"surf"}}}, ["Mt. Pyre 1F"] = {2, {["abilities"] = {"surf"}}}}
HoennMap["Route 123_A"] = {["Route 122"] = {1}, ["Route 123_B"] = {1, {["abilities"] = {"cut"}}}, ["Route 123_C"] = {1}}
HoennMap["Route 123_B"] = {["Route 123_C"] = {1}}
HoennMap["Route 123_C"] = {["Berry Masters House"] = {1}, ["Route 118_B"] = {1}}
HoennMap["Route 124 Underwater_A"] = {["Route 124_A"] = {1.5}, ["Route 124_C"] = {1.5}, ["Route 124_D"] = {1.5}}
HoennMap["Route 124 Underwater_B"] = {["Route 124_A"] = {1.5}}
HoennMap["Route 124 Underwater_C"] = {["Route 124_B"] = {1.5}}
HoennMap["Route 124 Underwater_D"] = {["Route 124_B"] = {1.5}, ["Route 124_A"] = {1.5}}
HoennMap["Route 124 Underwater_E"] = {["Route 124_A"] = {1.5}}
HoennMap["Route 124_A"] = {["Treasure Hunter House"] = {1}, ["Lilycove City"] = {2.5}, ["Mossdeep City"] = {2.5}, ["Route 126_A"] = {2.5}, ["Route 124 Underwater_A"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_B"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_D"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_E"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 124_B"] = {["Route 124 Underwater_C"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_D"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 124_C"] = {["Route 124 Underwater_A"] = {1.5}}
HoennMap["Route 124_D"] = {["Route 124 Underwater_A"] = {1.5}}
HoennMap["Route 125"] = {["Low Tide Entrance Room_A"] = {1}, ["Mossdeep City"] = {2}} 
HoennMap["Route 126 Underwater_A"] = {["Route 126_A"] = {2}, ["Route 126_C"] = {2}, ["Sootopolis City Underwater"] = {2}}
HoennMap["Route 126 Underwater_B"] = {["Route 126_B"] = {1}, ["Route 126_A"] = {1}}
HoennMap["Route 126 Underwater_C"] = {["Route 126_C"] = {1}, ["Route 126_D"] = {1}}
HoennMap["Route 126_A"] = {["Route 124_A"] = {2}, ["Route 126 Underwater_A"] = {2}, ["Route 127_A"] = {2}}
HoennMap["Route 126_B"] = {["Route 126 Underwater_B"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 126_C"] = {["Route 126 Underwater_A"] = {1, {["abilities"] = {"dive"}}}, ["Route 126 Underwater_C"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 126_D"] = {["Route 126 Underwater_C"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 127 Underwater_A"] = {["Route 127_A"] = {2}, ["Route 128 Underwater_A"] = {2}}
HoennMap["Route 127 Underwater_B"] = {["Route 127_A"] = {1}, ["Route 127_B"] = {1}}
HoennMap["Route 127_A"] = {["Mossdeep City"] = {2}, ["Route 126_A"] = {2}, ["Route 128"] = {2}, ["Route 127 Underwater_A"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 127 Underwater_B"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 127_B"] = {["Route 127 Underwater_B"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 128 Underwater_A"] = {["Secret Underwater Cavern"] = {2.5}, ["Route 127 Underwater_A"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 128 Underwater_B"] = {["Route 128"] = {1}}
HoennMap["Route 128 Underwater_C"] = {["Route 128"] = {1}}
HoennMap["Route 128"] = {["Ever Grande City_A"] = {2}, ["Route 127_A"] = {2}, ["Route 129_A"] = {2}, ["Route 128 Underwater_B"] = {2, {["abilities"] = {"dive"}}}, ["Route 128 Underwater_C"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 129 Underwater"] = {["Route 129_A"] = {1.5}, ["Route 129_B"] = {1.5}, ["Route 130 Underwater_A"] = {1.5}}
HoennMap["Route 129_A"] = {["Route 128"] = {2}, ["Route 130_A"] = {2}, ["Route 129 Underwater"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 129_B"] = {["Route 129 Underwater"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 130 Underwater_A"] = {["Route 130_B"] = {2}, ["Route 129 Underwater"] = {2}}
HoennMap["Route 130 Underwater_B"] = {["Route 130_A"] = {1}}
HoennMap["Route 130_A"] = {["Route 129_A"] = {2}, ["Route 131"] = {2}, ["Route 130 Underwater_B"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 130_B"] = {["Route 130 Underwater_A"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 131"] = {["Pacifidlog Town"] = {2}, ["Route 130_A"] = {2}, ["Sky Pillar Entrance_A"] = {2}}
HoennMap["Route 132"] = {["Pacifidlog Town"] = {2}, ["Route 133"] = {2}}
HoennMap["Route 133"] = {["Route 132"] = {2}, ["Route 134"] = {2}}
HoennMap["Route 134"] = {["Route 133"] = {2}, ["Slateport City"] = {2}}
HoennMap["Rustboro City Building 1 1F"] = {["Rustboro City Building 1 2F"] = {1}, ["Rustboro City_A"] = {1}}
HoennMap["Rustboro City Building 1 2F"] = {["Rustboro City Building 1 3F"] = {1}, ["Rustboro City Building 1 1F"] = {1}}
HoennMap["Rustboro City Building 1 3F"] = {["Rustboro City Building 1 2F"] = {1}}
HoennMap["Rustboro City Building 2 1F"] = {["Rustboro City Building 2 2F"] = {1}, ["Rustboro City_A"] = {1}}
HoennMap["Rustboro City Building 2 2F"] = {["Rustboro City Building 2 1F"] = {1}}
HoennMap["Rustboro City Gym"] = {["Rustboro City_A"] = {1}}
HoennMap["Rustboro City House 1"] = {["Rustboro City_A"] = {1}}
HoennMap["Rustboro City House 2"] = {["Rustboro City_A"] = {1}}
HoennMap["Rustboro City House 3"] = {["Rustboro City_A"] = {1}}
HoennMap["Rustboro City_A"] = {["Devon Corporation 1F"] = {1}, ["Rustboro City Gym"] = {1}, ["Rustboro City Building 2 1F"] = {1}, ["Pokemon Trainers School"] = {1}, ["Cutter House"] = {1}, ["Rustboro City House 1"] = {1}, ["Rustboro City House 2"] = {1}, ["Rustboro City House 3"] = {1}, ["Rustboro City Building 1 1F"] = {1}, ["Mart Rustboro City"] = {1}, ["Pokecenter Rustboro City"] = {1}, ["Route 104_A"] = {1}, ["Route 115_B"] = {1}, ["Route 116_A"] = {1}}
HoennMap["Rustboro City_B"] = {["Route 104_A"] = {1}}
HoennMap["Rusturf Tunnel_A"] = {["Route 116_A"] = {1}, ["Rusturf Tunnel_B"] = {0.5, {["abilities"] = {"rock smash"}--[[npc maybe]]}}, ["Rusturf Tunnel_C"] = {0.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Rusturf Tunnel_B"] = {["Route 116_B"] = {1}, ["Verdanturf Town"] = {1}, ["Rusturf Tunnel_A"] = {0.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Rusturf Tunnel_C"] = {["Haunted Site"] = {1}, ["Rusturf Tunnel_A"] = {0.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Rydels Cycles"] = {["Mauville City"] = {1}}
HoennMap["Secret Base Boy House"] = {["Mossdeep City"] = {1}}
HoennMap["Secret Underwater Cavern"] = {["Route 128 Underwater_A"] = {1}} -- links cavern
HoennMap["Sky Pillar 1F"] = {["Sky Pillar Entrance_B"] = {1}, ["Sky Pillar 2F"] = {1}}
HoennMap["Sky Pillar 2F"] = {["Sky Pillar 1F"] = {1}, ["Sky Pillar 3F"] = {1}}
HoennMap["Sky Pillar 3F"] = {["Sky Pillar 2F"] = {1}, ["Sky Pillar 4F_A"] = {1}, ["Sky Pillar 4F_B"] = {1}}
HoennMap["Sky Pillar 4F_A"] = {["Sky Pillar 3F"] = {1}, ["Sky Pillar 5F"] = {1}}
HoennMap["Sky Pillar 4F_B"] = {["Sky Pillar 3F"] = {1}}
HoennMap["Sky Pillar 5F"] = {["Sky Pillar 4F_A"] = {1}, ["Sky Pillar 6F"] = {1}}
HoennMap["Sky Pillar 6F"] = {["Sky Pillar 5F"] = {1}}
HoennMap["Sky Pillar Entrance Cave 1F"] = {["Sky Pillar Entrance_A"] = {1}, ["Sky Pillar Entrance_B"] = {1}}
HoennMap["Sky Pillar Entrance_A"] = {["Route 131"] = {1}, ["Sky Pillar Entrance Cave 1F"] = {1}}
HoennMap["Sky Pillar Entrance_B"] = {["Sky Pillar Entrance Cave 1F"] = {1}, ["Sky Pillar 1F"] = {1}}
HoennMap["Slateport City House 1"] = {["Slateport City"] = {1}}
HoennMap["Slateport City House 2"] = {["Slateport City"] = {1}}
HoennMap["Slateport City"] = {["Slateport Harbor"] = {1}, ["Slateport Museum 1F"] = {1}, ["Slateport Shipyard 1F"] = {1}, ["Slateport City House 2"] = {1}, ["Slateport City House 1"] = {1}, ["Mart Slateport"] = {1}, ["Pokecenter Slateport"] = {1}, ["Route 109"] = {1}, ["Route 110_B"] = {1}, ["Route 134"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Slateport Harbor"] = {["Slateport City"] = {1}}
HoennMap["Slateport Museum 1F"] = {["Slateport Museum 2F"] = {1}, ["Slateport City"] = {1}}
HoennMap["Slateport Museum 2F"] = {["Slateport Museum 1F"] = {1}}
HoennMap["Slateport Shipyard 1F"] = {["Slateport Shipyard 2F"] = {1}, ["Slateport City"] = {1}}
HoennMap["Slateport Shipyard 2F"] = {["Slateport Shipyard 1F"] = {1}}
HoennMap["Sootopolis City Gym 1F"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 1"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 2"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 3"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 4"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 5"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 6"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 7"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City House 8"] = {["Sootopolis City"] = {1}}
HoennMap["Sootopolis City Underwater"] = {["Route 126 Underwater_A"] = {1}, ["Sootopolis City"] = {1}}
HoennMap["Sootopolis City"] = {["Sootopolis City Gym 1F"] = {1}, ["Cave of Origin Entrance"] = {1}, ["Pokecenter Sootopolis City"] = {1}, ["Sootopolis City Underwater"] = {1, {["abilities"] = {"dive"}}}, ["Sootopolis Mart"] = {1}, ["Sootopolis City House 1"] = {1}, ["Sootopolis City House 2"] = {1}, ["Sootopolis City House 3"] = {1}, ["Sootopolis City House 4"] = {1}, ["Sootopolis City House 5"] = {1}, ["Sootopolis City House 6"] = {1}, ["Sootopolis City House 7"] = {1}, ["Sootopolis City House 8"] = {1}, }
HoennMap["Sootopolis Mart"] = {["Sootopolis City"] = {1}}
HoennMap["Stevens House"] = {["Mossdeep City"] = {1}}
HoennMap["Storage Unit"] = {["Abandoned Ship B1F"] = {1}}
HoennMap["Team Aqua Hideout  Entrance"] = {["Team Aqua Hideout 1F_A"] = {1}, ["Lilycove City"] = {1}}
HoennMap["Team Aqua Hideout 1F_A"] = {["Team Aqua Hideout 1F_C"] = {1}, ["Team Aqua Hideout 1F_E"] = {1}, ["Team Aqua Hideout  Entrance"] = {1}}
HoennMap["Team Aqua Hideout 1F_B"] = {["Team Aqua Hideout B2F_E"] = {1}}
HoennMap["Team Aqua Hideout 1F_C"] = {["Team Aqua Hideout B1F_A"] = {1}, ["Team Aqua Hideout 1F_D"] = {1}, ["Team Aqua Hideout 1F_A"] = {1}}
HoennMap["Team Aqua Hideout 1F_D"] = {["Team Aqua Hideout 1F_C"] = {1}}
HoennMap["Team Aqua Hideout 1F_E"] = {["Team Aqua Hideout 1F_A"] = {1}}
HoennMap["Team Aqua Hideout 1F_F"] = {["Team Aqua Hideout B1F_B"] = {1}, ["Team Aqua Hideout B1F_C"] = {1}}
HoennMap["Team Aqua Hideout 1F_G"] = {["Team Aqua Hideout Warp Hallway_A"] = {1}, ["Team Aqua Hideout B1F_A"] = {1}}
HoennMap["Team Aqua Hideout B1F_A"] = {["Team Aqua Hideout B1F_F"] = {1}, ["Team Aqua Hideout 1F_G"] = {1}, ["Team Aqua Hideout B2F_A"] = {1}, ["Team Aqua Hideout 1F_C"] = {1}}
HoennMap["Team Aqua Hideout B1F_B"] = {["Team Aqua Hideout B1F_E"] = {1}, ["Team Aqua Hideout 1F_F"] = {1}}
HoennMap["Team Aqua Hideout B1F_C"] = {["Team Aqua Hideout Warp Hallway_C"] = {1}, ["Team Aqua Hideout 1F_F"] = {1}}
HoennMap["Team Aqua Hideout B1F_D"] = {["Team Aqua Hideout B2F_B"] = {1}}
HoennMap["Team Aqua Hideout B1F_E"] = {["Team Aqua Hideout B2F_E"] = {1}, ["Team Aqua Hideout B1F_B"] = {1}}
HoennMap["Team Aqua Hideout B1F_F"] = {["Team Aqua Hideout Warp Hallway_E"] = {1}, ["Team Aqua Hideout B1F_A"] = {1}}
HoennMap["Team Aqua Hideout B2F_A"] = {["Team Aqua Hideout B1F_A"] = {1}}
HoennMap["Team Aqua Hideout B2F_B"] = {["Team Aqua Hideout B1F_D"] = {1}, ["Team Aqua Hideout Warp Hallway_B"] = {1}, }
HoennMap["Team Aqua Hideout B2F_C"] = {["Team Aqua Hideout Warp Hallway_B"] = {1}, ["Team Aqua Hideout B1F_B"] = {1}, ["Team Aqua Hideout B2F_E"] = {1}}
HoennMap["Team Aqua Hideout B2F_D"] = {}
HoennMap["Team Aqua Hideout B2F_E"] = {["Team Aqua Hideout 1F_B"] = {1}, ["Team Aqua Hideout B1F_E"] = {1}, ["Team Aqua Hideout B2F_C"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_A"] = {["Team Aqua Hideout 1F_G"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_B"] = {["Team Aqua Hideout B2F_B"] = {1}, ["Team Aqua Hideout Warp Hallway_F"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_C"] = {["Team Aqua Hideout B1F_C"] = {1}, ["Team Aqua Hideout Warp Hallway_I"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_D"] = {["Team Aqua Hideout Warp Hallway_E"] = {1}, ["Team Aqua Hideout Warp Hallway_C"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_E"] = {["Team Aqua Hideout Warp Hallway_I"] = {1}, ["Team Aqua Hideout B1F_F"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_F"] = {["Team Aqua Hideout Warp Hallway_B"] = {1}, ["Team Aqua Hideout Warp Hallway_J"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_G"] = {["Team Aqua Hideout Warp Hallway_F"] = {1}, ["Team Aqua Hideout Warp Hallway_H"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_H"] = {["Team Aqua Hideout Warp Hallway_J"] = {1}, ["Team Aqua Hideout Warp Hallway_L"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_I"] = {["Team Aqua Hideout Warp Hallway_D"] = {1}, ["Team Aqua Hideout Warp Hallway_G"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_J"] = {["Team Aqua Hideout Warp Hallway_I"] = {1}, ["Team Aqua Hideout Warp Hallway_K"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_K"] = {["Team Aqua Hideout Warp Hallway_G"] = {1}, ["Team Aqua Hideout Warp Hallway_L"] = {1}}
HoennMap["Team Aqua Hideout Warp Hallway_L"] = {["Team Aqua Hideout B2F_C"] = {1}, ["Team Aqua Hideout Warp Hallway_H"] = {1}, ["Team Aqua Hideout Warp Hallway_K"] = {1}}
HoennMap["Terra Cave End"] = {["Terra Cave Entrance"] = {1}} --magma leader maxie (17, 28)
HoennMap["Terra Cave Entrance"] = {["Terra Cave End"] = {1}--[[need to speak to npc first (16,3)]], ["Cave of Origin B3F"] = {1}}
HoennMap["Transmat Station"] = {["Pokecenter Verdanturf"] = {H_SUBWAY}, ["Pokecenter Sootopolis City"] = {H_SUBWAY}, ["Pokecenter Slateport"] = {H_SUBWAY}, ["Pokecenter Rustboro City"] = {H_SUBWAY}, ["Pokecenter Petalburg City"] = {H_SUBWAY}, ["Pokecenter Pacifidlog Town"] = {H_SUBWAY}, ["Pokecenter Oldale Town"] = {H_SUBWAY}, ["Pokecenter Mossdeep City"] = {H_SUBWAY}, ["Pokecenter Mauville City"] = {H_SUBWAY}, ["Pokecenter Lilycove City"] = {H_SUBWAY}, ["Pokecenter Lavaridge Town"] = {H_SUBWAY}, ["Pokecenter Fortree City"] = {H_SUBWAY}, ["Pokecenter Fallarbor Town"] = {H_SUBWAY}, ["Pokecenter Ever Grande City"] = {H_SUBWAY}, ["Pokecenter Dewford Town"] = {H_SUBWAY}}
HoennMap["Treasure Hunter House"] = {["Route 124_A"] = {1}}
HoennMap["Trick House"] = {["Route 110_B"] = {1}}
HoennMap["Valley Of Steel Eastern Peak"] = {["Pokecenter Eastern Peak"] = {1}, ["Eastern House 1"] = {1}, ["Eastern House 2"] = {1}, ["Eastern House 3"] = {1}, ["Cave Of Steel 1F_C"] = {1}}
HoennMap["Valley Of Steel Entrance"] = {["Valley Of Steel_A"] = {1}, ["Lavaridge Town"] = {1}}
HoennMap["Valley Of Steel Western Peak"] = {["Pokecenter Western Peak"] = {1}, ["Western House 1"] = {1}, ["Western House 2"] = {1}, ["Western House 3"] = {1}, ["Western House 4"] = {1}}
HoennMap["Valley Of Steel_A"] = {["Cave Of Steel 2F"] = {1}, ["Valley Of Steel Entrance"] = {1}}
HoennMap["Valley Of Steel_B"] = {["Cave Of Steel 1F_A"] = {1}, ["Cave Of Steel 1F_C"] = {1}}
HoennMap["Verdanturf Battle Tent"] = {["Verdanturf Town"] = {1}}
HoennMap["Verdanturf House 1"] = {["Verdanturf Town"] = {1}}
HoennMap["Verdanturf House 2"] = {["Verdanturf Town"] = {1}}
HoennMap["Verdanturf House 3"] = {["Verdanturf Town"] = {1}}
HoennMap["Verdanturf Mart"] = {["Verdanturf Town"] = {1}}
HoennMap["Verdanturf Town"] = {["Verdanturf House 1"] = {1}, ["Verdanturf House 2"] = {1}, ["Verdanturf House 3"] = {1}, ["Verdanturf Battle Tent"] = {1}, ["Pokecenter Verdanturf"] = {1}, ["Route 117"] = {1}, ["Rusturf Tunnel_B"] = {1}, ["Verdanturf Mart"] = {1}, ["Route 116_A"] = {1, {["abilities"] = {"dig"}}}, ["Route 116_B"] = {1, {["abilities"] = {"dig"}}}}
HoennMap["Victory Road Hoenn 1F_A"] = {["Ever Grande City_A"] = {2}, ["Victory Road Hoenn B1F_B"] = {2}, ["Victory Road Hoenn B1F_A"] = {2}}
HoennMap["Victory Road Hoenn 1F_B"] = {["Ever Grande City_B"] = {0.5}, ["Victory Road Hoenn 1F_A"] = {0.5}, ["Victory Road Hoenn B1F_A"] = {0.5}}
HoennMap["Victory Road Hoenn 1F_C"] = {["Victory Road Hoenn B1F_A"] = {1}}
HoennMap["Victory Road Hoenn B1F_A"] = {["Victory Road Hoenn 1F_A"] = {1.5}, ["Victory Road Hoenn 1F_B"] = {1.5}, ["Victory Road Hoenn 1F_C"] = {1.5}, ["Victory Road Hoenn B2F_A"]= {1.5}}
HoennMap["Victory Road Hoenn B1F_B"] = {["Victory Road Hoenn B1F_C"] = {0.5}, ["Victory Road Hoenn 1F_A"] = {0.5}, ["Victory Road Hoenn B2F_E"] = {0.5}}
HoennMap["Victory Road Hoenn B1F_C"] = {["Victory Road Hoenn B2F_B"] = {0.5}}
HoennMap["Victory Road Hoenn B1F_D"] = {["Victory Road Hoenn B2F_A"] = {1}}
HoennMap["Victory Road Hoenn B2F_A"] = {["Victory Road Hoenn B1F_D"] = {2}, ["Victory Road Hoenn B1F_A"] = {2}}
HoennMap["Victory Road Hoenn B2F_B"] = {["Victory Road Hoenn B2F_C"] = {0.5}}
HoennMap["Victory Road Hoenn B2F_C"] = {["Victory Road Hoenn B2F_F"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Victory Road Hoenn B2F_D"] = {["Victory Road Hoenn B2F_C"] = {1}, ["Victory Road Hoenn B2F_A"] = {1}, ["Victory Road Hoenn B2F_F"] = {1}}
HoennMap["Victory Road Hoenn B2F_E"] = {["Victory Road Hoenn B2F_F"] = {0.1, {["abilities"] = {"surf"}}}, ["Victory Road Hoenn B1F_B"] = {0.1}}
HoennMap["Victory Road Hoenn B2F_F"] = {["Victory Road Hoenn B2F_E"] = {0}}
HoennMap["Weather Institute 1F"] = {["Weather Institute 2F"] = {1}, ["Route 119A"] = {1}}
HoennMap["Weather Institute 2F"] = {["Weather Institute 1F"] = {1}}
HoennMap["Western House 1"] = {["Valley Of Steel Western Peak"] = {1}}
HoennMap["Western House 2"] = {["Valley Of Steel Western Peak"] = {1}}
HoennMap["Western House 3"] = {["Valley Of Steel Western Peak"] = {1}}
HoennMap["Western House 4"] = {["Valley Of Steel Western Peak"] = {1}}
HoennMap["Leev Town"] = {["Leev Town Entrance"] = {1}, ["Jura Pass"] = {1}, ["Pokecenter Leev Town"] = {1}}
HoennMap["Leev Town Port"] = {["Leev Town Entrance"] = {1}, ["Lilycove City Harbor"] = {0.2}}
HoennMap["Leev Town Entrance"] = {["Leev Town Port"] = {1}, ["Leev Town"] = {1}}
HoennMap["Jura Cave"] = {["Jura Pass"] = {1}}
HoennMap["Jura Pass"] = {["Leev Town"] = {1}, ["Jura Cave"] = {1}}
HoennMap["Pokecenter Leev Town"] = {["Leev Town"] = {1}}

-- HoennMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return HoennMap
end