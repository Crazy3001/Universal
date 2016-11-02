name = "Universal Catcher"
author = "Crazy3001"
description = "Make sure your configuration is done properly. Press Start."


				--#################################################--
				-------------------GLOBAL SETTINGS-------------------
				--#################################################--


local allDayCatch = true
--##########################################################################################
--If you want to catch Pokemon that are not registered as caught in your Pokedex, set true.
local catchNotCaught = false
--##########################################################################################
--Determines the percentage that the opponents health has to be to start throwing pokeballs. If using False Swipe, leave at 1.
local throwHealth = 20
--##########################################################################################
--If fishing, what type of rod to use. (Old Rod, Good Rod, Super Rod)
local typeRod = "Super Rod"
--##########################################################################################
--If set true, if you have Leftovers, it will automatically put it on your lead Pokemon.--
local useLeftovers = true
--##########################################################################################
local useRole = false
--If using Role Play, put in the abilities you want to catch. If not using, put "". You can have multiple Abilities/multiple Pokemon. Example: roleAbility = {"Ability 1", "Ability 2", "Ability 3"}
local roleAbility = {""}
--If using Role Play, put in the pokemon you want to Role. If not using, put "". You can have multiple Pokemon. Example: pokemonToRole = {"Pokemon 1", "Pokemon 2"}
local pokemonToRole = {""}
--##########################################################################################
local useSwipe = true
--##########################################################################################
local useStatus = true
--##########################################################################################
--{Auto Evovle off or on.}
local autoEvolve = "off"


				--#################################################--
				-------------------ALL DAY SETTINGS-------------------
				--#################################################--

				
--Put in the pokemon you want to catch. Leave "" if none. Example: pokemonToCatch = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}
local pokemonToCatch = {""} --If you have a pokemonToRole, don't put them here too, unless you want to catch that pokemon with any ability.
--##########################################################################################
--Location you want to hunt. Example: location = "Dragons Den"
local location = ""
--Put only 1 true.
local grass = true
local water = false
local cave = false
local fish = false 
--If hunting in cave ground, put in your rectangle coordinates {X1,Y1,X2,Y2}
local caveRectangle = {1,2,3,4}
--If fishing, put in the cell number you want to fish {X,Y}
local fishingCell = {1,2}
--##########################################################################################
local useSync = false
--Put in the nature of your All Day Sync Pokemon. Example: syncNature = "Adamant"
local syncNature = ""


				--#################################################--
				-------------------MORNING SETTINGS-------------------
				--#################################################--

				
--Put in the pokemon you want to catch. Leave "" if none. Example: pokemonToCatch = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}
local pokemonToCatchMorning = {} --If you have a pokemonToRole, don't put them here too, unless you want to catch that pokemon with any ability.
--##########################################################################################
--Location you want to hunt. Example: location = "Dragons Den"
local locationMorning = ""
--Put only 1 true.
local grassMorning = true
local waterMorning = false
local caveMorning = false
local fishMorning = false
--If hunting in cave ground, put in your rectangle coordinates {X1,Y1,X2,Y2}
local caveRectangleMorning = {1,2,3,4}
--If fishing, put in the cell number you want to fish {X,Y}
local fishingCellMorning = {1,2}
--##########################################################################################
local useSyncMorning = false
--Put in the nature of your All Day Sync Pokemon. Example: syncNature = "Adamant"
local syncNatureMorning = ""


				--#################################################--
				-------------------DAY SETTINGS-------------------
				--#################################################--

				
--Put in the pokemon you want to catch. Leave "" if none. Example: pokemonToCatch = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}
local pokemonToCatchDay = {} --If you have a pokemonToRole, don't put them here too, unless you want to catch that pokemon with any ability.
--##########################################################################################
--Location you want to hunt. Example: location = "Dragons Den"
local locationDay = ""
--Put only 1 true.
local grassDay = true 
local waterDay = false 
local caveDay = false 
local fishDay = false 
--If hunting in cave ground, put in your rectangle coordinates {X1,Y1,X2,Y2}
local caveRectangleDay = {1,2,3,4}
--If fishing, put in the cell number you want to fish {X,Y}
local fishingCellDay = {1,2}
--##########################################################################################
local useSyncDay = false
--Put in the nature of your All Day Sync Pokemon. Example: syncNature = "Adamant"
local syncNatureDay = ""


				--#################################################--
				-------------------NIGHT SETTINGS-------------------
				--#################################################--

				
--Put in the pokemon you want to catch. Leave "" if none. Example: pokemonToCatch = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}
local pokemonToCatchNight = {""} --If you have a pokemonToRole, don't put them here too, unless you want to catch that pokemon with any ability.
--##########################################################################################
--Location you want to hunt. Example: location = "Dragons Den"
local locationNight = ""
--Put only 1 true.
local grassNight = true
local waterNight = false
local caveNight = false
local fishNight = false
--If hunting in cave ground, put in your rectangle coordinates {X1,Y1,X2,Y2}
local caveRectangleNight = {1,2,3,4}
--If fishing, put in the cell number you want to fish {X,Y}
local fishingCellNight = {1,2}
--##########################################################################################
local useSyncNight = false
--Put in the nature of your All Day Sync Pokemon. Example: syncNature = "Adamant"
local syncNatureNight = "Timid"


				--#################################################--
				-------------------POKEBALL SETTINGS-------------------
				--#################################################--


--Must be filled in. Determines what type of ball to use when catching, and what type to buy. Example: typeBall = "Pokeball"
local typeBall = "Pokeball"


				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--
				

local pf = require "Pathfinder/MoveToApp"

local function onStart()
local syncId = hasSync(syncNature)
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

local function onPause()
	log("***********************************PAUSED - SESSION STATS***********************************")
    log("You have visited the PokeCenter " .. healCounter .. " times.")
    log("Pokemon Encountered: " .. wildCounter)
	log("Shinies Encountered: " .. shinyCounter)
    log("Pokemon Caught: " .. catchCounter)
    log("********************************************************************************************")
end

local function onResume()
	log("****************************************BOT RESUMED*****************************************")
end

local function onDialogMessage(message)
    if stringContains(message, "There you go, take care of them!") then
		healCounter = healCounter + 1
		log("You have visited the PokeCenter ".. healCounter .." times.")
    end
end

local function onBattleMessage(wild)
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

local function sortTeam()
	if allDayCatch and useSync and hasSync(syncNature) then
		if hasSync(syncNature) == 1 then
			return true
		else
			return swapPokemon(hasSync(syncNature), 1)
		end
	end
	
	if not allDayCatch and isMorning() and useSyncMorning and hasSync(syncNatureMorning) then
		if hasSync(syncNatureMorning) == 1 then
			return true
		else
			return swapPokemon(hasSync(syncNatureMorning), 1)
		end
	end
	
	if not allDayCatch and isNoon() and useSyncDay and hasSync(syncNatureDay) then
		if hasSync(syncNatureDay) == 1 then
			return true
		else
			return swapPokemon(hasSync(syncNatureDay), 1)
		end
	end
	
	if not allDayCatch and isNight() and useSyncNight and hasSync(syncNatureNight) then
		if hasSync(syncNatureNight) == 1 then
			return true
		else
			return swapPokemon(hasSync(syncNatureNight), 1)
		end
	end
	return false
end

local function isTeamSorted()
	if allDayCatch and hasSync(syncNature) and hasSync(syncNature) ~= 1 then
		return false
	end
	if not allDayCatch and isMorning() and hasSync(syncNatureMorning) and hasSync(syncNatureMorning) ~= 1 then
		return false
	end
	if not allDayCatch and isNoon() and hasSync(syncNatureDay) and hasSync(syncNatureDay) ~= 1 then
		return false
	end
	if not allDayCatch and isNight() and hasSync(syncNatureNight) and hasSync(syncNatureNight) ~= 1 then
		return false
	end
	return true
end

local function isTeamUsable()
	if allDayCatch and useSync and not hasUsableSync(syncNature) then
		return false
	
	
	elseif not allDayCatch and isMorning() and not hasUsableSync(syncNatureMorning) then
		return false
	
	
	elseif not allDayCatch and isNoon() and not hasUsableSync(syncNatureDay) then
		return false
	
	
	elseif not allDayCatch and isNight() and not hasUsableSync(syncNatureNight) then
		return false

	
	elseif useRole and not hasUsablePokemonWithMove("Role Play") then
		return false
	
	
	elseif useSwipe and not hasUsablePokemonWithMove("False Swipe") then
		return false
	
	else
		return true
	end
end

local function allDayPath()
	if getMapName() == location then
		if huntIn == grass then
			moveToGrass()
		end
		if huntIn == water then
			moveToWater()
		end
		if huntIn == cave then
			return moveToRectangle(caveRectangle[1], caveRectangle[2], caveRectangle[3], caveRectangle[4])
		end
		if huntIn == fishing then
			if isOnCell(fishingCell[1], fishingCell[2]) then
				if useItem(typeRod) then return end
			else
				moveToCell(fishingCell[1], fishingCell[2])
			end
		end
	else pf.MoveTo(location)
	end	
end

local function morningPath()
	if getMapName() == locationMorning then
		if grassMorning == true then
			moveToGrass()
		elseif waterMorning == true then
			moveToWater()
		elseif caveMorning == true then
			moveToRectangle(caveRectangleMorning[1],caveRectangleMorning[2],caveRectangleMorning[3],caveRectangleMorning[4])
		elseif fishMorning == true then
			if isOnCell(fishingCellMorning[1], fishingCellMorning[2]) then
				if useItem(typeRod) then return end
			else
				moveToCell(fishingCellMorning[1], fishingCellMorning[2])
			end
		end
	else pf.MoveTo(locationMorning)
	end	
end

local function dayPath()
	if getMapName() == locationDay then
		if grassDay == true then
			moveToGrass()
		elseif waterDay == true then
			moveToWater()
		elseif caveDay == true then
			return moveToRectangle(caveRectangleDay[1],caveRectangleDay[2],caveRectangleDay[3],caveRectangleDay[4])
		elseif fishDay == true then
			if isOnCell(fishingCellDay[1], fishingCellDay[2]) then
				if useItem(typeRod) then return end
			else
				moveToCell(fishingCellDay[1], fishingCellDay[2])
			end
		end
	else pf.MoveTo(locationDay)
	end	
end

local function nightPath()
	if getMapName() == locationNight then
		if grassNight == true then
			moveToGrass()
		elseif waterNight == true then
			moveToWater()
		elseif caveNight == true then
			return moveToRectangle(caveRectangleNight[1], caveRectangleNight[2], caveRectangleNight[3], caveRectangleNight[4])
		elseif fishNight == true then
			if isOnCell(fishingCellNight[1], fishingCellNight[2]) then
				if useItem(typeRod) then return end
			else
				moveToCell(fishingCellNight[1], fishingCellNight[2])
			end
		end
	else 
		pf.MoveTo(locationNight)
	end	
end

local function goToPath()
	if allDayCatch then
		allDayPath()
	else
		if isMorning() then
			morningPath()
		end
		if isNoon() then
			dayPath()
		end
		if isNight() then
			nightPath()
		end
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
	if allDayCatch then
		if isWildBattle() and isOnList(pokemonToRole) and hasUsablePokemonWithMove("Role Play") then
			startRole()
		elseif isWildBattle() and isOpponentShiny() or isOnList(pokemonToCatch) or (catchNotCaught and not isAlreadyCaught()) then
			startBattle()
		else
			return run() or sendUsablePokemon() 
		end
	end
	
	if not allDayCatch and isMorning() then
		if isWildBattle() and isOnList(pokemonToRole) and hasUsablePokemonWithMove("Role Play") then
			startRole()
		elseif isWildBattle() and isOpponentShiny() or isOnList(pokemonToCatchMorning) or (catchNotCaught and not isAlreadyCaught()) or (hasUsablePokemonWithMove("Role Play") and isOnList(pokemonToRole)) then
			startBattle()
		else
			return run() or sendUsablePokemon() 
		end
	end	
	
	if not allDayCatch and isNoon() then
		if isWildBattle() and isOnList(pokemonToRole) and hasUsablePokemonWithMove("Role Play") then
			startRole()
		elseif isWildBattle() and isOpponentShiny() or isOnList(pokemonToCatchDay) or (catchNotCaught and not isAlreadyCaught()) or (hasUsablePokemonWithMove("Role Play") and isOnList(pokemonToRole)) then
			startBattle()
		else
			return run() or sendUsablePokemon() 
		end
	end
	
	if not allDayCatch and isNight() then
		if isWildBattle() and isOnList(pokemonToRole) and hasUsablePokemonWithMove("Role Play") then
			startRole()
		elseif isWildBattle() and isOpponentShiny() or isOnList(pokemonToCatchNight) or (catchNotCaught and not isAlreadyCaught()) or (hasUsablePokemonWithMove("Role Play") and isOnList(pokemonToRole)) then
			startBattle()
		else
			return run() or sendUsablePokemon() 
		end
	end
end