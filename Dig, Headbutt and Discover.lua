name = "Dig, Headbutt and Discover"
author = "Programminghigh"
description = [[Dig, Headbutt and Discover]]


				--#################################################--
				-------------------GLOBAL SETTINGS-------------------
				--#################################################--

				
--Put in the pokemon you want to catch. Leave "" if none. Example: pokemonToCatch = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}
local pokemonToCatch = {"Venipede", "Drilbur", "Roggenrola", "Skarmory", "Larvitar", "Chimchar", "Trevenant", "Joltik", "Scyther", "Gligar", "Bulbasaur", "Charmander", "Squirtle"} --If you have a pokemonToRole, don't put them here too, unless you want to catch that pokemon with any ability.--##########################################################################################
--##########################################################################################
--If you want to catch Pokemon that are not registered as caught in your Pokedex, set true.
local catchNotCaught = false
--##########################################################################################
--Determines the percentage that the opponents health has to be to start throwing pokeballs. If using False Swipe, leave at 1.
local throwHealth = 10
--##########################################################################################
--Must be filled in. Determines what type of ball to use when catching, and what type to buy. Example: typeBall = "Pokeball"
local typeBall = "Pokeball"
--##########################################################################################
--If set true, if you have Leftovers, it will give it to your lead Pokemon.--
local useLeftovers = true
--##########################################################################################


				--#################################################--
				-------------------TEAM SETTINGS-------------------
				--#################################################--

				
--##########################################################################################
--If using a Sync Pokemon, set true.
local useSync = false
--Put in the nature of your All Day Sync Pokemon. Example: syncNature = "Adamant"
local syncNature = ""
--##########################################################################################
--If using Role Play, set true.
local useRole = false
--If using Role Play, put in the abilities you want to catch. If not using, put "". You can have multiple Abilities/multiple Pokemon. Example: roleAbility = {"Ability 1", "Ability 2", "Ability 3"}
local roleAbility = {""}
--If using Role Play, put in the pokemon you want to Role. If not using, put "". You can have multiple Pokemon. Example: pokemonToRole = {"Pokemon 1", "Pokemon 2"}
local pokemonToRole = {""}
--##########################################################################################
--If using False Swipe, set true.
local useSwipe = false
--##########################################################################################
--If using a Status Move, set true.
--Status Move List - {"glare", "stun spore", "thunder wave", "hypnosis", "lovely kiss", "sing", "sleep spore", "spore"}
local useStatus = false


				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--
				

local pf = require "Pathfinder/MoveToApp" -- requesting table with methods
local Lib = require "Pathfinder/Lib/lib"
local map = nil

local DigMaps = {
	"Viridian City",
	"Viridian Forest",
	"Pewter City",
	"Route 3",
	"Mt. Moon 1F",
	"Mt. Moon B2F_C",
	"Mt. Moon B2F_B",
	"Route 25",
	"Route 5_A",
    "Route 10_B",
	"Route 10_A",
	"Rock Tunnel 1_A",
	"Rock Tunnel 2_B",
	"Lavender Town",
	"Route 14",
	"Route 15",
	"Route 17",
	"Route 16",
	"Celadon City",
	"Route 8",
	"Saffron City",
	"Route 6",
	"Vermilion City",
	"Digletts Cave Entrance 2",
	"Digletts Cave",
	"Viridian City",
	"Route 27",
	"Slowpoke Well",
	"Slowpoke Well L1",
	"Ecruteak City",
	"Mt. Mortar 1F_A",
	"Mt. Mortar Lower Cave",
	"Mt. Mortar 1F_C",
	"Mt. Mortar Lower Cave",
	"Mt. Mortar B1F_B",
	"Mt. Mortar B1F_A",
	"Mt. Mortar 1F_B",
	"Dark Cave South",
	"Item Maniac House"
}

local ManiacList = {
	{["item"]="Nugget", ["option"]="Nuggets.", ["page"]=1}, 
	{["item"]="Big Nugget", ["option"]="Big Nugget.", ["page"]=1}, 
	{["item"]="Pearl", ["option"]="Pearl.", ["page"]=1}, 
	{["item"]="Big Pearl", ["option"]="Big Pearl.", ["page"]=1}, 
	{["item"]="Star Piece", ["option"]="Star Piece.", ["page"]=2}, 
	{["item"]="Stardust", ["option"]="Stardust.", ["page"]=2}, 
	{["item"]="Tiny Mushroom", ["option"]="Tiny Mushroom.", ["page"]=2}, 
	{["item"]="Big Mushroom", ["option"]="Big Mushroom.", ["page"]=2}
}

local function useManiac()
	local map = getMapName()
    local pushLog = "Pathfinder: Pushing dialog: "
	if pf.moveTo(map, "Item Maniac House") then
		return true
    end
	if ManiacList[1] then
		if not hasItem(ManiacList[1]["item"]) then
			return table.remove(ManiacList, 1)
		end
		if ManiacList[1]["page"] > 1 then
			pushDialogAnswer("More.")
			pushLog = pushLog .. "More., "
		end
		pushDialogAnswer(ManiacList[1]["option"])
		talkToNpcOnCell(6,5)
		Lib.log1time(pushLog .. ManiacList[1]["option"] .. ".")
		return
	else
		fatal("No more items to sell.")
	end
end

function onStart()

pf.enableDigPath()

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
	log("$$$Pokedollars$$$_____" .. getMoney())
	log("Pokemon Sync Nature_____" .. getPokemonNature(1))
	log("Revives Remaining_____" .. getItemQuantity("Revive"))
	log("Super Potions_____" .. getItemQuantity("Super Potion"))
    log("********************************************************************************************")
end

function onResume()
	log("****************************************BOT RESUMED*****************************************")
end

function onDialogMessage(message)
    if stringContains(message, "There you go, take care of them!") then
		healCounter = healCounter + 1
		log("You have visited the PokeCenter ".. healCounter .." times.")
	elseif stringContains(message, "Nugget") then
	playSound("Assets/sound2.wav")	
	elseif stringContains(message, "Big Nugget") then
	playSound("Assets/sound2.wav")
	elseif stringContains(message, "Pearl") then
	playSound("Assets/sound2.wav")
	elseif stringContains(message, "Big Pearl") then
	playSound("Assets/sound2.wav")
	elseif stringContains(message, "Star Piece") then
	playSound("Assets/sound2.wav")
	elseif stringContains(message, "Stardust") then
	playSound("Assets/sound2.wav")
	elseif stringContains(message, "Tiny Mushroom") then
	playSound("Assets/sound2.wav")
	elseif stringContains(message, "Big Mushroom") then
	playSound("Assets/sound2.wav")
    end
end

function onBattleMessage(wild)
	if stringContains(wild, "A Wild SHINY ") then
		shinyCounter = shinyCounter + 1
		wildCounter = wildCounter + 1
		log("Info | Shineys encountered: " .. shinyCounter)
		log("Info | Pokemon caught: " .. catchCounter)
		log("Info | Pokemon encountered: " .. wildCounter)
		log("Info | $$$Pokedollars$$$_____" .. getMoney())
	elseif stringContains(wild, "Success! You caught ") then
		catchCounter = catchCounter + 1
		playSound("Assets/sound1.wav")	
		log("Info | Shineys encountered: " .. shinyCounter)
		log("Info | Pokemon caught: " .. catchCounter)
		log("Info | Pokemon encountered: " .. wildCounter)
		log("Info | $$$Pokedollars$$$_____" .. getMoney())
	elseif stringContains(wild, "A Wild ") then
	    wildCounter = wildCounter + 1
	    log("Info | Shineys encountered: " .. shinyCounter)
	    log("Info | Pokemon caught: " .. catchCounter)
	    log("Info | Pokemon encountered: " .. wildCounter)
		log("Info | $$$Pokedollars$$$_____" .. getMoney())	
	end
	for _,value in pairs(roleAbility) do
		if stringContains(wild, "is now "..value) then
			roleMatched = true
			log("######ROLE ABILITY MATCHED!######")
			break
		end
	end
end

function TableLength(T)
 local count = 0
 for _ in pairs(T) do count = count + 1 end
 return count
end

function isOnList(List)
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

function hasUsablePokemonWithMove(Move)
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

function hasPokemonWithMove(Move)
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

function hasUsableSync(Nature)
    for i=1, getTeamSize(), 1 do
        if getPokemonAbility(i) == "Synchronize" and getPokemonNature(i) == Nature and getPokemonHealth(i) >= 1 then
            return i, true
        end
    end
    return 0, false
end

function hasSync(Nature)
    for i=1, getTeamSize(), 1 do
        if getPokemonAbility(i) == "Synchronize" and getPokemonNature(i) == Nature then
            return i, true
        end
    end
    return 0, false
end

function getPokemonIdWithItem(ItemName)	
	for i=1, getTeamSize(), 1 do
		if getPokemonHeldItem(i) == ItemName then
			return i
		end
	end
	return 0
end

function getFirstUsablePokemon()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) then
			return i
		end
	end
	return 0
end



function leftovers()
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

function sortTeam()
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

function isTeamSorted()
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

function isTeamUsable()
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

function startRole()
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

function startBattle()
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

function onBattleAction()
	if isWildBattle() and isOnList(pokemonToRole) and hasUsablePokemonWithMove("Role Play") then
		startRole()
	elseif isWildBattle() and isOpponentShiny() or isOnList(pokemonToCatch) or (catchNotCaught and not isAlreadyCaught()) then
		startBattle()
	else
		return run() or sendUsablePokemon() 
	end
end

function goToMap()
map = getMapName()
	if not pf.moveTo(map, DigMaps[1]) then
		table.remove(DigMaps, 1)
		if DigMaps[1] then
			log("Map " .. map .. "has nothing more to do, moving to:" .. tostring(DigMaps[1]))
			pf.moveTo(map, DigMaps[1])
		else 
			useManiac()
			log("No more maps visit, using Item Maniac.")
		end
	end
end

function onPathAction()

if getPokemonHealthPercent(1) <= 0 and getItemQuantity("Revive")>0 then 
       return useItemOnPokemon("revive", 1)
end   
map = getMapName()
usedRole = false
roleMatched = false

    if useLeftovers then
        if leftovers() then
            return true
        end
    end
        
    if isTeamSorted() then
        if isTeamUsable() then
            goToMap()
        else
            pf.useNearestPokecenter(map)
        end
    else
        sortTeam()
    end
end