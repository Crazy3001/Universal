name = "Universal Traveler"
author = "Crazy3001"
description = "Press Start."


				--#################################################--
				-------------------CONFIGURATION-------------------
				--#################################################--
--Favorites:

--KANTO
--Pokecenter Celadon      --Pokecenter Lavender     --Pokecenter Pewter                 --Safari Entrance
--Pokecenter Cerulean     --Pokecenter Saffron      --Pokemon League Reception Gate     --Power Plant
--Pokecenter Cinnabar     --Pokecenter Vermilion    --Mt. Silver Pokecenter             --Indigo Plateau Center
--Pokecenter Fuchsia      --Pokecenter Viridian     --Seafoam B4F
--

--JOHTO
--Pokecenter Azalea             --Pokecenter Ecruteak     --Pokecenter Violet City     --Ruins Of Alph
--Pokecenter Blackthorn         --Pokecenter Goldenrod    --Dragons Den                --Ilex Forest
--Pokecenter Cherrygrove City   --Pokecenter Mahogany     --Johto Safari Zone Lobby    
--Pokecenter Cianwood           --Olivine Pokecenter      --National Park       
--

--HOENN
--Pokecenter Dewford Town       --Pokecenter Lavaridge Town    --Pokecenter Oldale Town       --Pokecenter Slateport
--Pokecenter Ever Grande City   --Pokecenter Lilycove City     --Pokecenter Pacifidlog Town   --Pokecenter Sootopolis City
--Pokecenter Fallabor Town      --Pokecenter Mauville City     --Pokecenter Petalburg City    --Pokecenter Verdanturf
--Pokecenter Fortree City       --Pokecenter Mossdeep City     --Pokecenter Rustboro City     --Pokemon League Hoenn
--

local location = ""

local goToNearestPokecenter = false  --set true to use the nearest pokecenter

local fight = false  --set true if you want to fight wild encounters on the way. false will run.

local autoEvolve = "off"


				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--


local pf = require "Pathfinder/MoveToApp"

local function onStart()
    shinyCounter = 0
    catchCounter = 0
    wildCounter = 0
	if goToNearestPokecenter == true then
		log("Travelling to " .. getMapName(goToNearestPokecenter) .. ".")
	else
		log("Travelling to " .. location .. ".")
	end
	
	if autoEvolve == "on" then
		if not isAutoEvolve() then
			enableAutoEvolve()
		end
	end

	if autoEvolve == "off" then
		if isAutoEvolve then
			disableAutoEvolve()
		end
	end
end

local function onPause()
	log("***********************************PAUSED************************************")
end

local function onResume()
	log("***********************************RESUMED***********************************")
 	if goToNearestPokecenter == true then
		log("Travelling to " .. getMapName(goToNearestPokecenter) .. ".")
	else
		log("Travelling to " .. location .. ".")
	end
end

local function onBattleMessage(wild)
    if stringContains(wild, "A Wild SHINY ") then
       shinyCounter = shinyCounter + 1
       wildCounter = wildCounter + 1
       log("Info | Shinies Encountered: " .. shinyCounter)
       log("Info | Pokemon Caught: " .. catchCounter)
       log("Info | Pokemon Encountered: " .. wildCounter)
    elseif stringContains(wild, "Success! You caught ") then
       catchCounter = catchCounter + 1
       log("Info | Shinies Encountered: " .. shinyCounter)
       log("Info | Pokemon Caught: " .. catchCounter)
       log("Info | Pokemon Encountered: " .. wildCounter)
    elseif stringContains(wild, "A Wild ") then
       wildCounter = wildCounter + 1
       log("Info | Shinies Encountered: " .. shinyCounter)
       log("Info | Pokemon Caught: " .. catchCounter)
       log("Info | Pokemon Encountered: " .. wildCounter)
	  end
end

local function onBattleMessage(message)
    if message == "You failed to run away!" then
        failedRun = true
    end
	if message == "You can not switch this Pokemon!" then
		canNotSwitch = true
    end
end

function onPathAction()
	if goToNearestPokecenter == true then
		pf.UseNearestPokecenter()
		if getMapName(goToNearestPokecenter) == getMapName() then
			lib.log1time("Arrived at your Destination")
		end
	else
		pf.MoveTo(location)
		if getMapName() == location then
			lib.log1time("Arrived at your Destination")
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if isWildBattle() and isPokemonUsable(getTeamSize()) then
		if fight then
			return attack() or sendUsablePokemon() or run()
		else
			return run()
		end
		
	elseif canNotSwitch then
		canNotSwitch = false
		return attack() or run()
	else
		if failedRun then
			failedRun = false
			return sendUsablePokemon() or attack()
		else 
			return run() or sendUsablePokemon()
		end
	end
	return run() or sendUsablePokemon()
end
