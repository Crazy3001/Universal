name = "Universal Leveler"
author = "Crazy3001"

				--#################################################--
				-------------------CONFIGURATION-------------------
				--#################################################--
--Favorites:
--Seafoam B4F (56,14,61,14)
--Dragons Den
--Victory Road Kanto 3F

--Auto Evolve on or off.--
local autoEvolve = "off" 	

--Case Sensitive--
--Put the name of the map you want to train at between "". {Example: location = "Route 121"}
local location = "Mt. Silver Exterior"		

--Will catch any Pokemon that is not registered as owned in your Pokedex.
local catchNotCaught = false

--the below is case-sensitive, add more moves by adding commas. ex : onlyCatchThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
local catchThesePokemon = {""}

--When leveling, if there are any Pokemon you do not want to fight, put them in here.--
local evadeThesePokemon = {""}
	
--Will level your pokemon to this level then stop. Put 101 if EV Training or don't want a cap--
local levelPokesTo = 100

--What level you want your pokemon to start fight instead of switching out.
local minLevel = 43
	
--Choose how many pokemon you want to level.--
--The pokemon in the first X slots will be sorted in order by lowest level to highest and levelled--
local numberPokemonUsed = 5

--True = Sorts your Pokemon that are being used by level, low to high.
local sortTeam = true

--If set true, if you have Leftovers, it will automatically put it on your lead Pokemon.--
local useLeftovers = true

--the below is case-sensitive, add more moves by adding commas. ex : movesNotToForget = {"Move 1", "Move 2", "Move 3"}--
--Leave an empty "" here if you aren't using it--
local movesNotToForget = {"Dig", "Cut", "Surf", "Flash", "Rock Smash", "Dive"}

--The percentage of your last alive poke's health that we'll stop fighting at and go to pokecenter--
local healthToRunAt = 30 

--Hunting in Grass or Water (Both False if using rectangle coordinates)--
local lookForGrass = true
local lookForWater = false

--If in a cave or other location where pokemon encounter anywhere, set up your rect coordinates.--
local caveGround = false
local caveRectangle = {56,14,61,14}

--If you want to fish, set fishing to true, put in the type of rod you want to use, and put in your X and Y Coordinates.--
local fishing = false
local fishCell = {1,2}
local typeRod = "Super Rod"
		

				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--

				
description = "Training at " .. location .. "." .. " Leveling " .. numberPokemonUsed .. " pokemon to level " .. levelPokesTo .. ". Press Start"

local pf = require "PathFinder/MoveToApp"

function onStart()
   healCounter = 0
   shinyCounter = 0
   catchCounter = 0
   wildCounter = 0
   log("Start botting.")
   
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

function onPause()
   log("***********************************PAUSED - SESSION STATS***********************************")
   log("Shinies Caught: " .. shinyCounter)
   log("Pokemon Caught: " .. catchCounter)
   log("Pokemons encountered: " .. wildCounter)
   log("You have visited the PokeCenter ".. healCounter .." times.")
   log("*********************************************************************************************")
end

function onResume()
   log("SESSION RESUMED")
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
	elseif wild == "You can not awitch this Pokemon!" then
		canNotSwitch = true
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

function isOnCell(X, Y)
	if getPlayerX() == X and getPlayerY() == Y then
		return true
	end
	return false
end

function onLearningMove(moveName, pokemonIndex)
   forgetAnyMoveExcept(movesNotToForget)
end

function ReturnHighestIndexUnderLevel()
  result = 0
  for i=1, getTeamSize(), 1 do
      if getPokemonLevel(i) < levelPokesTo then
          result = i
      end
  end
  return result
end

function getFirstUsablePokemon()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) then
			return i
		end
	end
	return 0
end

function getTotalUsablePokemonCount()
	local count = 0
	for i=1, numberPokemonUsed, 1 do
		if getPokemonHealth(i) > 1 and getPokemonLevel(i) < levelPokesTo then
			count = count + 1
		end
	end
	return count
end

function isUsable(Index)
	if getPokemonHealth(Index) > 1 and getPokemonLevel(Index) < levelPokesTo then
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
				return false-- don't have leftovers in bag and is not on pokemons
			end
		end
	else
		return false
	end
end

function isSorted()
	local usablePokemon = getTotalUsablePokemonCount()
	for i=1, usablePokemon, 1 do
		if not isUsable(i) then 
			for i_=usablePokemon + 1, numberPokemonUsed, 1 do
				if isPokemonUsable(i_) then
					swapPokemon(i, i_)
					return true
				end
			end
			
		end
	end
	if not isTeamRangeSortedByLevelAscending(1, usablePokemon) then
		return sortTeamRangeByLevelAscending(1, usablePokemon)
	end
	return false
end

function onPathAction()
canNotSwitch = false

	if isSorted() then 
		return true
	end
	
	if useLeftovers then
		if leftovers() then
			return true
		end
	end
	
	if getTotalUsablePokemonCount() >= 1 and getPokemonHealthPercent(getTotalUsablePokemonCount()) >= healthToRunAt then	
		if getMapName() == location then
			if lookForGrass then
				if moveToGrass() then return end
			elseif lookForWater then
				if moveToWater() then return end
			elseif caveGround then
				if moveToRectangle(caveRectangle[1],caveRectangle[2],caveRectangle[3],caveRectangle[4]) then return end
			elseif fishing then
				if isOnCell(fishCell[1],fishCell[2]) then
					if useItem(typeRod) then return end
				else
					moveToCell(fishCell[1],fishCell[2])
				end
			end
		else pf.MoveTo(location)
		end
	else 
		return pf.UseNearestPokecenter()
	end
end

function onBattleAction()
    if getActivePokemonNumber() <= getTeamSize() then
        if isWildBattle() and isOpponentShiny() or isOnList(catchThesePokemon) or (catchNotCaught and not isAlreadyCaught()) then
			if isPokemonUsable(getActivePokemonNumber()) then
				if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
					return
				end
			else
				return sendUsablePokemon() or sendAnyPokemon()
			end
        end
		if isWildBattle() and not isOnList(evadeThesePokemon) then
			if isPokemonUsable(getActivePokemonNumber()) then
				if getPokemonHealthPercent(getTotalUsablePokemonCount()) < healthToRunAt then
					return run()
				elseif getPokemonLevel(getActivePokemonNumber()) < minLevel then
					return sendUsablePokemon() or run()
				elseif failedRun then
					failedRun = false
					return sendUsablePokemon() or attack()
				else
					return attack() or sendUsablePokemon() or run()
				end
			else
				return sendUsablePokemon() or run()
			end
		else
			run()
		end
    end    
end