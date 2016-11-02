name = "Basic Catcher"
author = "Crazy3001"
description = "Make sure your configuration is done properly. Press Start."


				--#################################################--
				-------------------GLOBAL SETTINGS-------------------
				--#################################################--

				
--Put in the pokemon you want to catch. Leave "" if none. Example: pokemonToCatch = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}
local pokemonToCatch = {"Charmander"} --If you have a pokemonToRole, don't put them here too, unless you want to catch that pokemon with any ability.
--##########################################################################################
--If you want to catch Pokemon that are not registered as caught in your Pokedex, set true.
local catchNotCaught = true
--##########################################################################################
--Determines the percentage that the opponents health has to be to start throwing pokeballs. If using False Swipe, leave at 1.
local throwHealth = 1
--##########################################################################################
--Must be filled in. Determines what type of ball to use when catching, and what type to buy. Example: typeBall = "Pokeball"
local typeBall = "Pokeball"
--##########################################################################################
--If fishing, what type of rod to use. (Old Rod, Good Rod, Super Rod)
local typeRod = "Super Rod"
--##########################################################################################
--If set true, if you have Leftovers, it will give it to your lead Pokemon.--
local useLeftovers = true
--##########################################################################################
--{Auto Evovle off or on.}
local autoEvolve = "off"


				--#################################################--
				-------------------LOCATION SETTINGS-------------------
				--#################################################--


--Location you want to hunt. Example: location = "Dragons Den"
local location = "Cinnabar mansion 3"
--##########################################################################################
--Put only 1 true.
local grass = false
local water = false
local cave = true
local fish = false 
--If hunting in cave ground, put in your rectangle coordinates {X1,Y1,X2,Y2}
local caveRectangle = {1,10,14,25}
--If fishing, put in the cell number you want to fish {X,Y}
local fishingCell = {1,2}
		
		
				--#################################################--
				-------------------TEAM SETTINGS-------------------
				--#################################################--

				
--##########################################################################################
--If using a Sync Pokemon, set true.
local useSync = true
--Put in the nature of your All Day Sync Pokemon. Example: syncNature = "Adamant"
local syncNature = "Timid"
--##########################################################################################
--If using Role Play, set true.
local useRole = false
--If using Role Play, put in the abilities you want to catch. If not using, put "". You can have multiple Abilities/multiple Pokemon. Example: roleAbility = {"Ability 1", "Ability 2", "Ability 3"}
local roleAbility = {""}
--If using Role Play, put in the pokemon you want to Role. If not using, put "". You can have multiple Pokemon. Example: pokemonToRole = {"Pokemon 1", "Pokemon 2"}
local pokemonToRole = {""}
--##########################################################################################
--If using False Swipe, set true.
local useSwipe = true
--##########################################################################################
--If using a Status Move, set true.
--Status Move List - {"glare", "stun spore", "thunder wave", "hypnosis", "lovely kiss", "sing", "sleep spore", "spore"}
local useStatus = true


				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--
				

local pf = require "Pathfinder/MoveToApp"

function onStart()
healCounter = 0
shinyCounter = 0
catchCounter = 0
wildCounter = 0

	if autoEvolve == "on" then
		if not isAutoEvolve() then
			enableAutoEvolve()
		end
	end

	if autoEvolve == "off" then
		if isAutoEvolve() then
			disableAutoEvolve()
		end
	end

	log("****************************************BOT STARTED*****************************************")
end

function onPause()
	log("***********************************PAUSED - SESSION STATS***********************************")
    log("You have visited the PokeCenter " .. healCounter .. " times.")
    log("Pokemon Encountered: " .. wildCounter)
	log("Shinies Encountered: " .. shinyCounter)
    log("Pokemon Caught: " .. catchCounter)
    log("********************************************************************************************")
end

function onResume()
	log("****************************************BOT RESUMED*****************************************")
end

function onDialogMessage(message)
    if stringContains(message, "There you go, take care of them!") then
		healCounter = healCounter + 1
		log("You have visited the PokeCenter ".. healCounter .." times.")
    end
end

function onBattleMessage(wild)
	if stringContains(wild, "A Wild SHINY ") then
		shinyCounter = shinyCounter + 1
		wildCounter = wildCounter + 1
		log("Info | Shineys encountered: " .. shinyCounter)
		log("Info | Pokemon caught: " .. catchCounter)
		log("Info | Pokemon encountered: " .. wildCounter)
	elseif stringContains(wild, "Success! You caught ") then
		catchCounter = catchCounter + 1
		log("Info | Shineys encountered: " .. shinyCounter)
		log("Info | Pokemon caught: " .. catchCounter)
		log("Info | Pokemon encountered: " .. wildCounter)
	elseif stringContains(wild, "A Wild ") then
	    wildCounter = wildCounter + 1
	    log("Info | Shineys encountered: " .. shinyCounter)
	    log("Info | Pokemon caught: " .. catchCounter)
	    log("Info | Pokemon encountered: " .. wildCounter)
	end
	for _,value in pairs(roleAbility) do
		if stringContains(wild, "is now "..value) then
			roleMatched = true
			log("######ROLE ABILITY MATCHED!######")
			break
		end
	end
end

local function TableLength(T)
 local count = 0
 for _ in pairs(T) do count = count + 1 end
 return count
end

local function isOnList(List)
	result = false
    if List[1] ~= "" then
	    for i=1, TableLength(List), 1 do
		    if getOpponentName() == List[i] then
			    result = true
		    end
	    end
    end
    return result
end

local function isOnCell(X, Y)
	if getPlayerX() == X and getPlayerY() == Y then
		return true
	end
	return false
end

local function hasUsablePokemonWithMove(Move)
	local hasUsablePokemonWithMove = {}
	hasUsablePokemonWithMove["id"] = 0
	hasUsablePokemonWithMove["move"] = nil
	local statusMoveList = {"glare", "stun spore", "thunder wave", "hypnosis", "lovely kiss", "sing", "sleep spore", "spore"}
	if Move == statusMove then
		for _,Move in pairs(statusMoveList) do
			for i=1, getTeamSize(), 1 do
				if hasMove(i, Move) and getRemainingPowerPoints(i, Move) >= 1 and isPokemonUsable(i) then
					hasUsablePokemonWithMove["id"] = i
					hasUsablePokemonWithMove["move"] = Move
					return hasUsablePokemonWithMove, true
				end
			end
		end
	else
		for i=1, getTeamSize(), 1 do
			if hasMove(i, Move) and getRemainingPowerPoints(i, Move) >= 1 and isPokemonUsable(i) then
				return i, true
			end
		end		
	end
	return false
end

local function hasPokemonWithMove(Move)
	local hasPokemonWithMove = {}
	hasPokemonWithMove["id"] = 0
	hasPokemonWithMove["move"] = nil
	local statusMoveList = {"glare", "stun spore", "thunder wave", "hypnosis", "lovely kiss", "sing", "sleep spore", "spore"}
	if Move == statusMove then
		for _,Move in pairs(statusMoveList) do
			for i=1, getTeamSize(), 1 do
				if hasMove(i, Move) then
					hasPokemonWithMove["id"] = i
					hasPokemonWithMove["move"] = Move
					return hasPokemonWithMove, true
				end
			end
		end
	else
		for i=1, getTeamSize(), 1 do
			if hasMove(i, Move) then
				return i, true
			end
		end		
	end
	return false
end

local function hasUsableSync(Nature)
    for i=1, getTeamSize(), 1 do
        if getPokemonAbility(i) == "Synchronize" and getPokemonNature(i) == Nature and getPokemonHealth(i) >= 1 then
            return i, true
        end
    end
    return 0, false
end

local function hasSync(Nature)
    for i=1, getTeamSize(), 1 do
        if getPokemonAbility(i) == "Synchronize" and getPokemonNature(i) == Nature then
            return i, true
        end
    end
    return 0, false
end

local function getPokemonIdWithItem(ItemName)	
	for i=1, getTeamSize(), 1 do
		if getPokemonHeldItem(i) == ItemName then
			return i
		end
	end
	return 0
end

local function getFirstUsablePokemon()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) then
			return i
		end
	end
	return 0
end

local function leftovers()
	ItemName = "Leftovers"
	local PokemonNeedLeftovers = getFirstUsablePokemon()
	local PokemonWithLeftovers = getPokemonIdWithItem(ItemName)
	
	if getTeamSize() > 0 then
		if PokemonWithLeftovers > 0 then
			if PokemonNeedLeftovers == PokemonWithLeftovers  then
				return false -- now leftovers is on rightpokemon
			else
				takeItemFromPokemon(PokemonWithLeftovers)
				return true
			end
		else

			if hasItem(ItemName) and PokemonNeedLeftovers ~= 0 then
				giveItemToPokemon(ItemName,PokemonNeedLeftovers)
				return true
			else
				return false
			end
		end
	else
		return false
	end
end

local function sortTeam()
	if useSync and hasSync(syncNature) then
		if hasSync(syncNature) == 1 then
			return true
		else
			return swapPokemon(hasSync(syncNature), 1)
		end
	end
	if not useSync and useRole and hasPokemonWithMove("Role Play") then
		if hasPokemonWithMove("Role Play") == 1 then
			return true
		else
			return swapPokemon(hasPokemonWithMove("Role Play"), 1)
		end
	end
	if not useSync and not useRole and useSwipe and hasPokemonWithMove("False Swipe") then
		if hasPokemonWithMove("False Swipe") == 1 then
			return true
		else
			return swapPokemon(hasPokemonWithMove("False Swipe"), 1)
		end
	end
	return false
end

local function isTeamSorted()
	if useSync and hasSync(syncNature) and hasSync(syncNature) ~= 1 then
		return false
	end
	if not useSync and useRole and hasPokemonWithMove("Role Play") and hasPokemonWithMove("Role Play") ~= 1 then
		return false
	end
	if not useSync and not useRole and useSwipe and hasPokemonWithMove("False Swipe") and hasPokemonWithMove("False Swipe") ~= 1 then
		return false
	end
	return true
end

local function isTeamUsable()
	if useSync and not hasUsableSync(syncNature) then
		return false
		
	
	elseif useRole and not hasUsablePokemonWithMove("Role Play") then
		return false
	
	
	elseif useSwipe and not hasUsablePokemonWithMove("False Swipe") then
		return false
	
	else
		return true
	end
end

local function goToPath()
	if getMapName() == location then
		if grass then
			if moveToGrass() then return end
		elseif water then
			if moveToWater() then return end
		elseif cave then
			if moveToRectangle(caveRectangle[1],caveRectangle[2],caveRectangle[3],caveRectangle[4]) then return end
		elseif fish then
			if isOnCell(fishCell[1],fishCell[2]) then
				if useItem(typeRod) then return end
			else
				moveToCell(fishCell[1],fishCell[2])
			end
		end
	else pf.MoveTo(location)
	end	
end

local function startRole()
	if usedRole == false then
		if hasUsablePokemonWithMove("Role Play") then
			if getActivePokemonNumber() == hasUsablePokemonWithMove("Role Play") then
				if useMove("Role Play") then
					usedRole = true
				end
			else
				if sendPokemon(hasUsablePokemonWithMove("Role Play")) then return end
			end
		else
			startBattle()
		end
	else
		if roleMatched == true then
			startBattle()
		else
			run()
		end
	end	
end

local function startBattle()
	if getOpponentHealthPercent() > throwHealth then	
		if hasUsablePokemonWithMove("False Swipe") then
			if getActivePokemonNumber() == hasUsablePokemonWithMove("False Swipe") then
				if useMove("False Swipe") then return end
			else
				if sendPokemon(hasUsablePokemonWithMove("False Swipe")) then return end
			end
		elseif hasUsablePokemonWithMove(statusMove) then
			if getActivePokemonNumber() == hasUsablePokemonWithMove(statusMove)["id"] then
				if getOpponentStatus() == "None" then
					if useMove(hasPokemonWithMove(statusMove)["move"]) then return end
				else
					if useItem(typeBall) then return end
				end
			else
				if sendPokemon(hasUsablePokemonWithMove(statusMove)["id"]) then return end
			end

		else
			if isPokemonUsable(getActivePokemonNumber()) then
				if weakAttack() then return end
			else
				if sendUsablePokemon() or sendAnyPokemon() or run() then return end
			end
		end

	else
		if hasUsablePokemonWithMove(statusMove) then
			if getActivePokemonNumber() == hasUsablePokemonWithMove(statusMove)["id"] then
				if getOpponentStatus() == "None" then
					if useMove(hasPokemonWithMove(statusMove)["move"]) then return end
				else
					if useItem(typeBall) then return end
				end
			else
				if sendPokemon(hasUsablePokemonWithMove(statusMove)["id"]) then return end
			end
		else
			if isPokemonUsable(getActivePokemonNumber()) then
				if useItem(typeBall) then return end
			else
				if sendUsablePokemon() or sendAnyPokemon() or run() then return end
			end
		end
	end	
end

function onPathAction()
usedRole = false
roleMatched = false

	if useLeftovers then
		if leftovers() then
			return true
		end
	end
		
	if isTeamSorted() then
		if isTeamUsable() then
			goToPath()
		else
			pf.UseNearestPokecenter()
		end
	else
		sortTeam()
	end
end

function onBattleAction()
	if isWildBattle() and isOnList(pokemonToRole) and hasUsablePokemonWithMove("Role Play") then
		startRole()
	elseif isWildBattle() and isOpponentShiny() or isOnList(pokemonToCatch) or (catchNotCaught and not isAlreadyCaught()) then
		startBattle()
	else
		return run() or sendUsablePokemon() 
	end
end