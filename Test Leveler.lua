name = "Universal Leveler"
author = "Crazy3001"

				--#################################################--
				-------------------CONFIGURATION-------------------
				--#################################################--
--Favorites:
--Seafoam B4F 
--Dragons Den
--Victory Road Kanto 3F
--
--


				--#################################################--
				-------------------GLOBAL SETTINGS-------------------
				--#################################################--
				

--When leveling, if there are any Pokemon you do not want to fight, put them in here. Example : evadeThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Leave an empty "" here if you aren't using it--
local evadeThesePokemon = {""}
	
--Will level your pokemon to this level then stop. Put 101 if EV Training or if you want level 100 Pokemon to fight.--
local levelPokesTo = 100

--What level you want your pokemon to start fight instead of switching out.
local minLevel = 1

-- The Bot will heal your Pokemon when the Count of alive Pokemon get to this number
local keepAlive = 0

--This is the percentage of your last alive usable poke's health that we'll stop fighting at and go to pokecenter--
local healthToRunAt = 30 

--If set true, if you have Leftovers, it will automatically give it to your first usable pokemon.--
local useLeftovers = true

--Type of rod you want to use when fishing
local typeRod = "Super Rod"

--the below is case-sensitive, add more moves by adding commas. ex : movesNotToForget = {"Move 1", "Move 2", "Move 3"}--
--Leave an empty "" here if you aren't using it--
local movesNotToForget = {"Dig", "Cut", "Surf", "Flash", "Rock Smash", "Dive"}


				--#################################################--
				-------------------LOCATION SETTINGS-------------------
				--#################################################--

				
--Case Sensitive--
--Put the name of the map you want to train at between "". {Example: location = "Route 121"}
local location = ""

-- Put "Grass" for grass, "Water" for water, {x, y} for fishing cell, {x1, y1, x2, y2} for rectangle
-- If you're using a rectangle, you can set more rectangles to hunt in just by adding 4 more parameters. Example: local area = {x1, y1, x2, y2, x1, y1, x2, y2}
local area = "Water"
		
-- If you're using multiple rectangles, this is the amount of time in minutes that we'll stay in one rectangle before moving to a different one
local minutesToMoveArea = 30


				--#################################################--
				-------------------CATCH SETTINGS-------------------
				--#################################################--
				
				
--Will catch any Pokemon that is not registered as owned in your Pokedex.
local catchNotCaught = false

--the below is case-sensitive, add more moves by adding commas. example : catchThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
local catchThesePokemon = {""}

--If using False Swipe for catching, set true.
local useSwipe = false

--Determines the percentage that the opponents health has to be to start throwing pokeballs. If using False Swipe, leave at 1.
local throwHealth = 10
				

				--#################################################--
				-------------------BALL SETTINGS-------------------
				--#################################################--
				
				
--Must be filled in. Determines what type of ball to use when catching, and what type to buy. Example: typeBall = "Pokeball"
local typeBall = "Pokeball"
--Set true if you want to buy your type of ball when you get low.
local buyBalls = false
--If buying balls, put in the amount of balls you want to have in your inventory.
local buyBallAmount = 500
--Will buy more balls when your type of ball reaches X.
local buyBallsAt = 100
		

				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--

				
description = "Leveling pokemon to level " .. levelPokesTo .. ". Press Start"

local pf = require "PathFinder/MoveToApp"
local Lib = require "PathFinder/Lib/lib"
local map = nil

function onStart()
    healCounter = 0
    shinyCounter = 0
    catchCounter = 0
    wildCounter = 0
    rand = 0 -- Used to represent each rectangle in area
    tmpRand = 0 -- Used to make sure rand is different every time we call math.random
    lineSwitch = false -- Used in moveToLine()
    rectTimer = os.time()
	locTimer = os.time()
    pokemonTable = {}
    for i = 1, getTeamSize() do
        pokemonTable[i] = {}
        pokemonTable[i][0] = getPokemonName(i)
        pokemonTable[i][1] = getPokemonUniqueId(i)
        pokemonTable[i][2] = getPokemonLevel(i)
    end
    startMoney = getMoney()
end

function onPause()
    log("********************************************************************************************")
    log("******************************PAUSED - SESSION STATS***********************************")
    log("********************************************************************************************")
    for i = 1, #pokemonTable do
        log("Your level " .. getLevelFromId(pokemonTable[i][1]) .. " " .. pokemonTable[i][0] .. " gained " .. getLevelFromId(pokemonTable[i][1]) - pokemonTable[i][2] .. " levels!")
    end
    log("Shinies encountered: " .. shinyCounter)
    log("Pokemon encountered: " .. wildCounter)
    log("Pokemon caught: " .. catchCounter)
    log("You have visited the PokeCenter ".. healCounter .." times.")
    log("You have earned ".. tostring(getMoney() - startMoney) .." PokeDollars!")
    log("*********************************************************************************************")
end

function onResume()
   log("*********************************************************************************************")
   log("************************************SESSION RESUMED************************************")
   log("*********************************************************************************************")
end

function onDialogMessage(pokecenter)
    if stringContains(pokecenter, "There you go, take care of them!") then
		healCounter = healCounter + 1
		log("You have visited the PokeCenter ".. healCounter .." times.")
    end
end

function onBattleMessage(wild)
    if stringContains(wild, "A Wild SHINY ") then
       shinyCounter = shinyCounter + 1
       wildCounter = wildCounter + 1
	   log("******SHINY******SHINY******SHINY******SHINY******SHINY******SHINY******")
    elseif stringContains(wild, "Success! You caught ") then
       catchCounter = catchCounter + 1
    elseif stringContains(wild, "A Wild ") then
       wildCounter = wildCounter + 1
	    log("********************************************************************************************")
		log("*********************************** SESSION STATS ***************************************")
		log("********************************************************************************************")
		log("Shinies encountered: " .. shinyCounter)
		log("Pokemon encountered: " .. wildCounter)
		log("Pokemon caught: " .. catchCounter)
		log("You have visited the PokeCenter ".. healCounter .." times.")
		log("*********************************************************************************************")
    elseif stringContains(wild, "You failed to run away") then
        failedRun = true
    elseif stringContains(wild, "You can not switch this Pokemon") then    
        canNotSwitch = true
    end
end

function onLearningMove(moveName, pokemonIndex)
   forgetAnyMoveExcept(movesNotToForget)
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

function isOnCell(X, Y)
	if getPlayerX() == X and getPlayerY() == Y then
		return true
	end
	return false
end

function getPokemonIdWithItem(ItemName)	
	for i=1, getTeamSize(), 1 do
		if getPokemonHeldItem(i) == ItemName then
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

function isSorted()
	local pokemonsUsable = getTotalPokemonToLevelCount()
	for pokemonId=1, pokemonsUsable, 1 do
		if not isPokemonUsable(pokemonId) or getPokemonLevel(pokemonId) >= levelPokesTo then --Move it at bottom of the Team
			for pokemonId_ = pokemonsUsable + 1, getTeamSize(), 1 do
				if isPokemonUsable(pokemonId_) and getPokemonLevel(pokemonId_) < levelPokesTo then
					swapPokemon(pokemonId, pokemonId_)
					return true
				end
			end
			
		end
	end
	if not isTeamRangeSortedByLevelAscending(1, pokemonsUsable) then --Sort the team without not usable pokemons
		return sortTeamRangeByLevelAscending(1, pokemonsUsable)
	end
	if not isTeamRangeSortedByLevelAscending(pokemonsUsable + 1, getTeamSize()) then --Sort the team without not usable pokemons
		return sortTeamRangeByLevelAscending(pokemonsUsable + 1, getTeamSize())
	end
	return false
end

function updateFishing(list)
	-- Moves to a position and uses rod	
	if getPlayerX() == list[1] and getPlayerY() == list[2] then
		return useItem(rod)
	else
		return moveToCell(list[1], list[2])
	end
end

function updateTargetRect(list)
	-- Every minutesToMoveArea minutes, picks a random integer between 1 and #list / 4 to get a number corresponding to each rectangle in list	
	if os.difftime(os.time(), rectTimer) > minutesToMoveArea * 60 or rand == 0 or rand > #list / 4 or rand == tmpRand then
		rectTimer = os.time()
		tmpRand = rand
		rand = math.random(#list / 4)
	end
	
	local n = (rand - 1) * 4
	
	if list[n + 1] == list[n + 3] or list[n + 2] == list[n + 4] then
		return moveToLine({list[n + 1], list[n + 2], list[n + 3], list[n + 4]})
	else
		return moveToRectangle(list[n + 1], list[n + 2], list[n + 3], list[n + 4])
	end
end

--[[function updateLocation(list)
local map = getMapName()
	if os.difftime(os.time(), locTimer) > minutesToMoveLocation * 60 then
		locTimer = os.time()
	end
	
	return pf.moveTo(map, list[math.random(#list)])
end]]

function moveToLine(list)	
	-- Alternates between 2 positions	
	if lineSwitch then
		if getPlayerX() == list[1] and getPlayerY() == list[2] then
			lineSwitch = not lineSwitch
		else
			return moveToCell(list[1], list[2])
		end
	else
		if getPlayerX() == list[3] and getPlayerY() == list[4] then
			lineSwitch = not lineSwitch
		else
			return moveToCell(list[3], list[4])
		end
	end
end

function getLevelFromId(ID)    
    for i = 1, getTeamSize() do
        if getPokemonUniqueId(i) == ID then
            return getPokemonLevel(i)
        end
    end    
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

function hasRemainingPP(i)
local powerCount = 0
local ppCount = 0
	for m=1, 4, 1 do
		if getPokemonMovePower(i,m) >= 1 then
			powerCount = powerCount + 1
			p = getPokemonMoveName(i,m)
			if getRemainingPowerPoints(i,p) >= 1 then
				ppCount = ppCount + 1
			end
		end
	end
	
	if ppCount >= 1 then
		return true
	end
	Lib.log1time("######No More PP, Using Pokecenter######")
	return false
end

function getFirstUsablePokemon()
	for i=1, getTeamSize(), 1 do
		if (isPokemonUsable(i) and hasRemainingPP(i)) and (getPokemonLevel(i) == 100 or (getPokemonLevel(i) >= minLevel and getPokemonLevel(i) < levelPokesTo)) then
			return i		
		end
	end
	Lib.log1time("######No More Usable Pokemon, Using Pokecenter######")
	return 0
end

function getTotalUsablePokemonCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if (isPokemonUsable(i) and hasRemainingPP(i)) and (getPokemonLevel(i) == 100 or (getPokemonLevel(i) >= minLevel and getPokemonLevel(i) < levelPokesTo)) then
			count = count + 1
		end
	end
	if count == 0 then
		Lib.log1time("######No More Usable Pokemon, Using Pokecenter######")
	end
	return count
end

function getFirstMaxLevelPokemon()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and hasRemainingPP(i) and getPokemonLevel(i) == 100 then
			return i		
		end
	end
	return 0
end

function getTotalMaxLevelPokemonCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and hasRemainingPP(i) and getPokemonLevel(i) >= 100 then
			count = count + 1
		end
	end
	return count
end

function getFirstPokemonToLevel()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and getPokemonLevel(i) < levelPokesTo then
			return i		
		end
	end
	Lib.log1time("######No More Pokemon To Level Alive, Using Pokecenter######")
	return 0
end

function getTotalPokemonToLevelCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and getPokemonLevel(i) < levelPokesTo then
			count = count + 1
		end
	end
	if count == 0 then
		Lib.log1time("######No More Pokemon To Level Alive, Using Pokecenter######")
	end
	return count
end

function allPokemonReachedTargetLevel()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if getPokemonLevel(i) >= levelPokesTo then
			count = count + 1
		end
	end
	if count == getTeamSize() then
		Lib.log1time("######All Pokemon Reached Target Level, Logging Out######")
		return true
	end
	return false
end

function getTotalAlivePokemonCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if getPokemonHealth(i) >= 1 then
			count = count + 1
		end
	end
	if count == keepAlive then
		Lib.log1time("######keepAlive Number Reached, Using Pokecenter######")
	end
	return count
end

function goToArea()
	if type(area) == "string" then
		area = area:upper()
	else
		if #area == 2 then
			return updateFishing(area)
		elseif #area > 4 then
			return updateTargetRect(area)
		elseif area[1] == area[3] or area[2] == area[4] then
			return moveToLine(area)
		else
			return moveToRectangle(area[1], area[2], area[3], area[4])
		end
	end
	
	if area == "GRASS" then
		return moveToGrass()
	elseif area == "WATER" then
		return moveToWater()
	end
end

function onPathAction()
local map = getMapName()
canNotSwitch = false
failedRun = false

	if buyBalls then
		if getItemQuantity(typeBall) <= buyBallsAt then
			return pf.useNearestPokemart(map, typeBall, ballAmount)
		end
	end

	if isSorted() then 
		return true
	end
	
	if useLeftovers then
		if leftovers() then
			return true
		end
	end
	
	if not allPokemonReachedTargetLevel() then
		if getTotalUsablePokemonCount() >= 1 and getTotalAlivePokemonCount() >= keepAlive and (getTotalPokemonToLevelCount() > 1 or (getTotalPokemonToLevelCount() == 1 and getPokemonHealthPercent(getFirstPokemonToLevel()) >= healthToRunAt)) then
			if map == location then
				goToArea()
			else
				pf.moveTo(map, location)
			end			
		else
			pf.useNearestPokecenter(map)
		end
	else
		logout()
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() or isOnList(catchThesePokemon) or (catchNotCaught and not isAlreadyCaught()) then
		if isPokemonUsable(getActivePokemonNumber()) then
			if getOpponentHealthPercent() > throwHealth then	
				if useSwipe and hasUsablePokemonWithMove("False Swipe") then
					if getActivePokemonNumber() == hasUsablePokemonWithMove("False Swipe") then
						if useMove("False Swipe") then return end
					else
						if sendPokemon(hasUsablePokemonWithMove("False Swipe")) then return end
					end
				else
					if isPokemonUsable(getActivePokemonNumber()) then
						if weakAttack() then return end
					else
						if sendUsablePokemon() or sendAnyPokemon() or run() then return end
					end
				end

			else
				if isPokemonUsable(getActivePokemonNumber()) then
					if useItem(typeBall) then return end
				else
					if sendUsablePokemon() or sendAnyPokemon() or run() then return end
				end
			end	
		else
			return sendUsablePokemon() or sendAnyPokemon()
		end
	end
	if isWildBattle() and not isOnList(evadeThesePokemon) then
		if getTotalUsablePokemonCount() < 1 or (getTotalPokemonToLevelCount() < 1 or (getTotalPokemonToLevelCount() == 1 and getPokemonHealthPercent(getFirstPokemonToLevel()) < healthToRunAt)) or getTotalAlivePokemonCount() == keepAlive then
			if isPokemonUsable(getActivePokemonNumber()) then
				return run()
			else
				if getTotalUsablePokemonCount() >= 1 then
					return sendPokemon(getFirstUsablePokemon()) 
				else 
					return sendAnyPokemon()
				end
			end
		elseif getPokemonLevel(getActivePokemonNumber()) < minLevel then
			if getTotalUsablePokemonCount() >= 1 then
				return sendPokemon(getFirstUsablePokemon()) 
			else 
				return run() or sendAnyPokemon()
			end
		elseif failedRun then
			Lib.log1time("###Failed Run###")
			failedRun = false
			if getTotalUsablePokemonCount() >= 1 then
				return sendPokemon(getFirstUsablePokemon()) or attack()
			else
				return sendAnyPokemon() or attack()
			end
		elseif canNotSwitch then
			Lib.log1time("###Can Not Switch###")
			canNotSwitch = false
			return run() or attack()
		else
			if isPokemonUsable(getActivePokemonNumber()) and hasRemainingPP(getActivePokemonNumber()) then
				return attack() or sendPokemon(getFirstUsablePokemon()) or run()
			else
				if getTotalUsablePokemonCount() >= 1 then
					return sendPokemon(getFirstUsablePokemon())
				else
					return run() or sendAnyPokemon()
				end
			end
		end		
	else
		if isPokemonUsable(getActivePokemonNumber()) and hasRemainingPP(getActivePokemonNumber()) then
			if failedRun then
				Lib.log1time("###Failed Run###")
				failedRun = false
				if getTotalUsablePokemonCount() >= 1 then
					return sendPokemon(getFirstUsablePokemon()) or attack()
				else
					return sendAnyPokemon() or attack()
				end
			elseif canNotSwitch then
				Lib.log1time("###Can Not Switch###")
				canNotSwitch = false
				return run() or attack()
			else
				return run() or sendAnyPokemon()
			end
		else
			return run() or sendAnyPokemon()
		end
	end
end