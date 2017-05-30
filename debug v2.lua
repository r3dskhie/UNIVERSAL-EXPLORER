				
				-- Copyright © 2016 redskhie 
				-- Official github link:
				-- Official PROShine thread: https://proshine-bot.com/thread-1246.html
				-- Contact me at discord nickname: Redd
			
			
local PathFinder = require "Pathfinder/MoveToApp"
local map = nil				

name = "Super Saiyan Rose"
author = "redskhie"
description = [[This script will ... as fuck as hell!!!]]

dofile "Config.lua"

function onStart()
	
	startime = os.time()
	shinycount = 0
	pcCount = 0
	wildcount = 0
    ex = backupCount
    	digcount = 1
	hbuttcount = 0
	pc = 0
	jto = 0
	caughtPoke = 0
	y = 0
	a = 1
	b = 0
	c = 0
	x = 3
	z = 0
	r = 0
	s = 0
    smash = 0
    	log("-----------------------------------------------------------")
	log("--------- We are now Commencing the Routine ---------")
	log("-----------------------------------------------------------")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Some PC are not supported, prepare yourself ---")
	log("--- Note: Always Remember your BACK-UP COUNT in Excavation Site in case the bot DISCONNECTED---")
	log("--- Enter your BACK-UP COUNT if your disconnected in the middle of Hunting Sites ---")
	log("-Remember that smash count are not very accurate-")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--PLEASE MAKE SURE THAT MT. Moon is set to FALSE if dig spots there are on cooldown--")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end

function onPause()
	log("-----------------------------------------------------------")
	log("---------------------- Routine Paused ---------------------")
	log("-----------------------------------------------------------")
	log("Info | Shinies encountered: " .. shinycount)
	log("Info | Pokemon encountered: " .. wildcount)
	log("Info | Times in Pokecenter: " .. pcCount)
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("---You caught "..caughtPoke.." unknown Pokemon---")
	log("Headbutt count: "..hbuttcount)
	log("Dig count: "..digcount)
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Back-up count: "..ex)
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- You smashed "..smash.." fools in all sites!!! ---")
	log("-Remember that smash count are not very accurate-")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--PLEASE MAKE SURE THAT MT. Moon is set to FALSE if dig spots there are on cooldown--")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end
function onStop()
	log("-----------------------------------------------------------")
	log("---------------------- Routine Stopped ---------------------")
	log("-----------------------------------------------------------")
	log("--- Back-up count: "..ex)
	log(" ")
	endtime = os.time()
	log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/3600 ).. " hours")
	log("or")
	log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/60 ).. " minutes")
	log(" ")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--PLEASE MAKE SURE THAT MT. Moon is set to FALSE if dig spots there are on cooldown--")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end
function onBattleMessage(wild)
    if stringContains(wild, "A Wild SHINY ") then
        shinycount = shinycount + 1
		wildcount = wildcount + 1
		log("Info | Shinies encountered: " .. shinycount)
	elseif stringContains(wild, "Success! ") then
		caughtPoke = caughtPoke + 1
		
	elseif stringContains(wild, "A Wild ") then
        wildcount = wildcount + 1
		log("Info | Pokemon encountered: " .. wildcount)
		
	end
end
function onDialogMessage(message)
	if message == "Reselect a different Pokemon?" then
		pushDialogAnswer(2)
	end
	if message == "Select a Pokemon that has Headbutt." then
		hbuttcount = hbuttcount + 1
		pushDialogAnswer(butter)
	elseif message == "Select a Pokemon that has Dig." then
		digcount = digcount + 1
		pushDialogAnswer(digger)
	elseif message == "Please select a Pokemon that knows the Dig technique." then
		pushDialogAnswer(digger)
	end
	if stringContains(message, "Would you like me to heal your Pokemon?") then
        pcCount = pcCount + 1
		log("Info | Times in Pokecenter: " .. pcCount)
    	end
	

end
function onSystemMessage(message)
	if message == "Your Pokemon still has health and can not be revived." then
		log("--- False swiper still has health... Using Elixir instead ---")
		useItemOnPokemon("Elixir", falseswiper)
	end
end
function IsPokemonOnCaptureList()
    result = false
    if catchList[1] ~= "" then
    for i = 1, TableLength(catchList), 1 do
        if getOpponentName() == catchList[i] then
            result = true
            break
        end
    end
    end
    return result
end
function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function onBattleAction()
	if isWildBattle() and ((catchShiny and isOpponentShiny()) or (catchUncaught and not isAlreadyCaught()) or IsPokemonOnCaptureList()) then
		if fswipeOn then
           	log("-------- Commencing False Swipe --------")
            		fswipe()
        	elseif sleepOn then
            	log("-------- Commencing Sleep Move --------")
            		sleep()
        	elseif advanceCatchOn then
            	log("-------- Commencing False Swipe with Sleep Move --------")
            		advanceCatch()
        	elseif normalCatchOn then
            	log("-------- Starting to throw Pokeballs --------")
            		normal()  
		end 
	else
		return run() or sendPokemon(3) or sendAnyPokemon() or attack()
	end
end
function onPathAction()
  if not isMounted() and hasItem(mount) and not isSurfing() and isOutside() then
		log("---------------------------")
		log("~~~ Riding on my pet!!! ~~~")
		log("---------------------------")
		return useItem(mount)
  elseif isNpcVisible("PokeStop") then
  	r = 1
	log("--- Robbing Mr. Clown! ---")
	return talkToNpc("PokeStop") or moveToCell(28,0)
  elseif (( fswipeOn or advanceCatchOn ) and not isPokemonUsable(falseswiper)) or (( sleepOn or advanceCatchOn ) and not isPokemonUsable(sleeper)) then
	return useItemOnPokemon("Revive", falseswiper)
  elseif (( fswipeOn or advanceCatchOn ) and getPokemonHealthPercent(falseswiper) <= 50) or (( sleepOn or advanceCatchOn ) and getPokemonHealthPercent(sleeper) <= 50) then
	log("--- Your false swiper is in danger... Giving him potions ---")
	return useItemOnPokemon("Hyper Potion", falseswiper) or useItemOnPokemon("Super Potion", falseswiper) or useItemOnPokemon("Potion", falseswiper) or useItemOnPokemon("Sitrus Berry", falseswiper) or useItemOnPokemon("Oran Berry", falseswiper)
  elseif ( fswipeOn or advanceCatchOn ) and getRemainingPowerPoints(falseswiper, "False Swipe") < 1 then
	return useItemOnPokemon("Elixir", falseswiper)
  elseif ( sleepOn or advanceCatchOn ) and getRemainingPowerPoints(sleeper, sleepmove) < 1 then
	return useItemOnPokemon("Elixir", sleeper)
  elseif isPokemonUsable(falseswiper) then
    		if getMapName() == "Pallet Town" then
			  map = getMapName() PathFinder.moveTo(map, "Route 1")
		elseif getMapName() == "Route 1" then
			  map = getMapName() PathFinder.moveTo(map, "Route 1 Stop House")
		elseif getMapName() == "Route 1 Stop House" then
			  map = getMapName() PathFinder.moveTo(map, "Viridian City")
		elseif getMapName() == "Viridian City" then
			if jto == 0 then
				
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				  map = getMapName() PathFinder.moveTo(map, "Pokecenter Viridian")
					pc = pc + 1
			elseif pc == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
				  map = getMapName() PathFinder.moveTo(map, "Route 2")
			end
			elseif jto == 1 then
				log("We are now near JOHTO REGION...Prepare yourself!")
				  map = getMapName() PathFinder.moveTo(map, "Route 22")
			end
		elseif getMapName() == "Pokecenter Viridian" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Viridian City")
		elseif getMapName() == "Pokecenter Pewter" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Pewter City")
		elseif getMapName() == "Pokecenter Route 3" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Route 3")
		elseif getMapName() == "Pokecenter Cerulean" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Cerulean City")
		elseif getMapName() == "Pokecenter Route 10" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Route 10")
		elseif getMapName() == "Pokecenter Lavender" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Lavender Town")
		elseif getMapName() == "Pokecenter Fuchsia" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Fuchsia City")
		elseif getMapName() == "Pokecenter Celadon" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Celadon City")
		elseif getMapName() == "Pokecenter Saffron" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Saffron City")
		elseif getMapName() == "Pokecenter Vermilion" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			  map = getMapName() PathFinder.moveTo(map, "Vermilion City")
		elseif getMapName() == "Route 2" then
			map = getMapName() 
			pc = 0
			if jto == 0 then	
				return PathFinder.moveTo(map, "Route 2 Stop") or PathFinder.moveTo(map, "Pewter City")
			elseif jto == 1 then
				return PathFinder.moveTo(map, "Viridian City") or moveToCell(39,90)
			end
		elseif getMapName() == "Route 2 Stop3" then
			moveToCell(3,12)
		elseif getMapName() == "Route 2 Stop" then
			  map = getMapName() PathFinder.moveTo(map, "Viridian Forest")
		elseif getMapName() == "Viridian Forest" then
			  map = getMapName() PathFinder.moveTo(map, "Route 2 Stop2")
		elseif getMapName() == "Route 2 Stop2" then
			  map = getMapName() PathFinder.moveTo(map, "Route 2")
		elseif getMapName() == "Pewter City" then
			  map = getMapName() PathFinder.moveTo(map, "Route 3")
		elseif getMapName() == "Route 3" then
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
					  map = getMapName() PathFinder.moveTo(map, "Pokecenter Route 3")
					pc = pc + 1
			elseif pc == 1 then
				if MtMoon then
					log("---"..getMapName().." Cleared... Entering Mt. Moon---")
					  map = getMapName() PathFinder.moveTo(map, "Mt. Moon 1F")
				elseif isNpcOnCell(74,16) then
					log("---"..getMapName().." Cleared... Ignoring Mt. Moon---")
					talkToNpcOnCell(74,16)
				end
			end
		elseif getMapName() == "Mt. Moon 1F" then
			if x == 3 then
				return moveToCell(58,33)	--MOVING to 1st area of DIG SPOT in B2F
			elseif x == 2 then
				moveToCell(37,29)
			else
				moveToCell(21,20)		--CELL EXITS
			end
		elseif getMapName() == "Mt. Moon B1F" then
			map = getMapName() 
			if x == 3 then
				moveToCell(43,34)
			elseif x == 2 then
				return moveToCell(18,15) or moveToCell(57,21)
			else
				return moveToCell(65,20) or moveToCell(56,34) or PathFinder.moveTo(map, "Mt. Moon Exit")
			end
		elseif getMapName() == "Mt. Moon B2F" then

			x = 2
				x = x -1
					log("--- Mt. Moon cleared! Moving to next map ---")
					return moveToCell(44,30)  or moveToCell(17,27) or moveToCell(30,54)	--GOING BACK to 1F to Exit
		elseif getMapName() == "Mt. Moon Exit" then
			  map = getMapName() PathFinder.moveTo(map, "Route 4")
		elseif getMapName() == "Route 4" then
			pc = 0
			if z == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToCell(96,21)
			elseif z == 0 then
				moveToCell(96, 14)
			end
		elseif getMapName() == "Cerulean City" then
			map = getMapName() 
			z = 1
			r = 0
			if pc == 0 then
				PathFinder.moveTo(map, "Pokecenter Cerulean") or PathFinder.moveTo(map, "Route 4")
					pc = pc + 1
			elseif pc >= 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
					return PathFinder.moveTo(map, "Route 9") or PathFinder.moveTo(map, "Route 4")
			end
		elseif getMapName() == "Route 9" then
			pc = 0
			x = 1
			if r == 0 then
				moveToCell(93,33)
			elseif r == 1 then
				moveToCell(86,33)
			end
		elseif getMapName() == "Route 10" then
			map = getMapName() 
			r = 1
			if x == 1 then
				return PathFinder.moveTo(map, "Rock Tunnel 1") or moveToCell(28,0)
			elseif x == 0 then
				PathFinder.moveTo(map, "Lavender Town") or moveToCell(28,0)
			end
		elseif getMapName() == "Rock Tunnel 1" then
			x = 0
			map = getMapName() PathFinder.moveTo(map, "Route 10")
		elseif getMapName() == "Lavender Town" then
			map = getMapName() 
			if pc == 0 then
				map = getMapName() PathFinder.moveTo(map, "Pokecenter Lavender")
					pc = pc + 1
			elseif pc == 1 then
				PathFinder.moveTo(map, "Route 12")
			end
		elseif getMapName() == "Route 12" then
			pc = 0
			  map = getMapName() PathFinder.moveTo(map, "Route 13")
		elseif getMapName() == "Route 13" then
			map = getMapName() 
			PathFinder.moveTo(map, "Route 14")
		elseif getMapName() == "Route 14" then
			map = getMapName() 
			PathFinder.moveTo(map, "Route 15")
		elseif getMapName() == "Route 15" then
			map = getMapName() 
			PathFinder.moveTo(map, "Route 15 Stop House")
		elseif getMapName() == "Route 15 Stop House" then
			  map = getMapName() PathFinder.moveTo(map, "Fuchsia City")
		elseif getMapName() == "Fuchsia City" then
			map = getMapName() 
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				PathFinder.moveTo(map, "Pokecenter Fuchsia")
				pc = pc + 1
			elseif pc == 1 then
				PathFinder.moveTo(map, "Route 18")
			end
		elseif getMapName() == "Route 18" then
			map = getMapName() 
			pc = 0
			return PathFinder.moveTo(map, "Route 17") or moveToCell(35,16)
		elseif getMapName() == "Bike Road Stop" then
			moveToCell(0,6)
		elseif getMapName() == "Route 17" then
			map = getMapName() PathFinder.moveTo(map, "Route 16")
		elseif getMapName() == "Route 16" then
			map = getMapName() 
			return PathFinder.moveTo(map, "Celadon City") or moveToCell(64,13)
		elseif getMapName() == "Route 16 Stop House" then
			moveToCell(20,6)
		elseif getMapName() == "Celadon City" then
			map = getMapName() 
			if pc == 0 then
				PathFinder.moveTo(map, "Pokecenter Celadon")
				pc = pc + 1
			elseif pc == 1 then
				PathFinder.moveTo(map, "Route 7")
			end
		elseif getMapName() == "Route 7" then
			map = getMapName() 
			PathFinder.moveTo(map, "Underground House 3")
		elseif getMapName() == "Underground House 3" then
			  map = getMapName() PathFinder.moveTo(map, "Underground1")
		elseif getMapName() == "Underground1" then
			  map = getMapName() PathFinder.moveTo(map, "Underground House 4")
		elseif getMapName() == "Underground House 4" then
			  map = getMapName() PathFinder.moveTo(map, "Route 8")
		elseif getMapName() == "Route 8" then
			map = getMapName() 
			PathFinder.moveTo(map, "Route 8 Stop House")
		elseif getMapName() == "Route 8 Stop House" then
			pc = 0
			map = getMapName() PathFinder.moveTo(map, "Saffron City")
		elseif getMapName() == "Saffron City" then
			map = getMapName() 
			if pc == 0 then
				PathFinder.moveTo(map, "Pokecenter Saffron")
				pc = pc + 1
			elseif pc == 1 then
				PathFinder.moveTo(map, "Route 6 Stop House")
			end
		elseif getMapName() == "Route 6 Stop House" then
			pc = 0
			map = getMapName() PathFinder.moveTo(map, "Route 6")
		elseif getMapName() == "Route 6" then
			map = getMapName() 
			PathFinder.moveTo(map, "Vermilion City")
		elseif getMapName() == "Vermilion City" then
			map = getMapName() 
			if pc == 0 then
				PathFinder.moveTo(map, "Pokecenter Vermilion")
				pc = pc + 1
			elseif pc == 1 then
				PathFinder.moveTo(map, "Route 11")
			end
		elseif getMapName() == "Route 11" then
			map = getMapName() 
			PathFinder.moveTo(map, "Digletts Cave Entrance 2")
		elseif getMapName() == "Digletts Cave Entrance 2" then
			map = getMapName() PathFinder.moveTo(map, "Digletts Cave")
		elseif getMapName() == "Digletts Cave" then
			map = getMapName() 
			PathFinder.moveTo(map, "Digletts Cave Entrance 1")
	elseif getMapName() == "Digletts Cave Entrance 1" then
		map = getMapName() 
		if EnterJohto then
			log(" ")
    			log("--- KANTO REGION is fucked up!!! ---")
    			log("-Fasten your seatbelt! We are now going to JOHTO REGION-")
    			log(" ")     
			jto = 1
			PathFinder.moveTo(map, "Route 2")
		else
			fatal("--- No more trees left, psh... KJ!!! Stopping this shit!")
		end
	elseif getMapName() == "Route 22" then
		Route22()
	elseif getMapName() == "Pokemon League Reception Gate" then
		  map = getMapName() PathFinder.moveTo(map, "Route 26")
	elseif getMapName() == "Route 26" then
		Route26()
	elseif getMapName() == "Route 27" then
		log("--- We are near in JOHTO Region, take care!!! ---")
		Route27()
	elseif getMapName() == "Tohjo Falls" then
		moveToCell(23,32)
	elseif getMapName() == "New Bark Town" then
		log("--- We are now in JOHTO Region, goodluck!!! ---")
		  map = getMapName() PathFinder.moveTo(map, "Route 29")
	elseif getMapName() == "Route 29" then
		Route29()
	elseif getMapName() == "Pokecenter Cherrygrove City" then
		pc = 1
		log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
		  map = getMapName() PathFinder.moveTo(map, "Cherrygrove City")
	elseif getMapName() == "Cherrygrove City" then
		map = getMapName() 
		if s == 0 then
			if pc == 0 then
				Cherry()
			elseif pc == 1 then
				PathFinder.moveTo(map, "Route 30")
			end
		else
			 PathFinder.moveTo(map, "Route 30")
		end
	elseif getMapName() == "Route 30" then
		map = getMapName() 
		if s == 0 then
			pc = 0
			Route30()
		else
			PathFinder.moveTo(map, "Route 31")
		end
	elseif getMapName() == "Route 31" then
		map = getMapName() 
		if s == 0 then
			if c == 0 then
				Route31()
			elseif c == 1 then
				PathFinder.moveTo(map, "Violet City Stop House")
			end
		else
			PathFinder.moveTo(map, "Violet City Stop House")
		end
	elseif getMapName() == "Dark Cave South" then
		map = getMapName()
		c = 1
		if s == 0 then
			DarkSouth()
		elseif s == 1 then
			PathFinder.moveTo(map, "Route 31")
		end
	elseif getMapName() == "Route 46" then
		s = 1
		Route46()
	elseif getMapName() == "Route 29 Stop House" then
		map = getMapName() PathFinder.moveTo(map, "Route 29")
	elseif getMapName() == "Violet City Stop House" then
		map = getMapName() PathFinder.moveTo(map, "Violet City")
	elseif getMapName() == "Violet City" then
		Violet()
	elseif getMapName() == "Route 32" then
		Route32()
	elseif getMapName() == "Route 33" then
		Route33()
	elseif getMapName() == "Azalea Town" then
		map = getMapName() 
		if a == 1 then
			Azalea()
		elseif a == 0 then
			PathFinder.moveTo(map, "Ilex Forest Stop House")
		end
	elseif getMapName() == "Slowpoke Well" then
		map = getMapName() 
		if a == 1 then
			SpokeWell()
		elseif a == 0 then
			 PathFinder.moveTo(map, "Azalea Town")
		end
	elseif getMapName() == "Slowpoke Well L1" then
		a = 0
		SpokeWellL1()
	elseif getMapName() == "Ilex Forest Stop House" then
		  map = getMapName() PathFinder.moveTo(map, "Ilex Forest")
	elseif getMapName() == "Ilex Forest" then
		Ilex()
	elseif getMapName() == "Route 34 Stop House" then
		  map = getMapName() PathFinder.moveTo(map, "Route 34")
	elseif getMapName() == "Route 34" then
		Route34()
	elseif getMapName() == "Goldenrod City" then
		map = getMapName() 
		if pc == 0 then
			PathFinder.moveTo(map, "Pokecenter Goldenrod")
		elseif pc == 1 then
			PathFinder.moveTo(map, "Route 35 Stop House")
		end
	elseif getMapName() == "Pokecenter Goldenrod" then
		pc = 1
		log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
		  map = getMapName() PathFinder.moveTo(map, "Goldenrod City")
	elseif getMapName() == "Route 35 Stop House" then
		pc = 0
		  map = getMapName() PathFinder.moveTo(map, "Route 35")
	elseif getMapName() == "Route 35" then
		Route35()
	elseif getMapName() == "Route 36" then
		Route36()
	elseif getMapName() == "Route 37" then
		map = getMapName() PathFinder.moveTo(map, "Ecruteak City")
	elseif getMapName() == "Ecruteak City" then
		map = getMapName() 
		if b == 0 then
			  PathFinder.moveTo(map, "Ecruteak Stop House 2")
		elseif b == 1 then
			  PathFinder.moveTo(map, "Ecruteak Stop House 1")
		end
	elseif getMapName() == "Ecruteak Stop House 2" then
		map = getMapName() 
		if b == 0 then
			  PathFinder.moveTo(map, "Route 42")
		elseif b == 1 then
			  PathFinder.moveTo(map, "Ecruteak City")
		end
	elseif getMapName() == "Mt. Mortar 1F" then
		Mortar()
	elseif getMapName() == "Mt. Mortar Lower Cave" then
		moveToCell(47,57)
	elseif getMapName() == "Route 42" then
		map = getMapName() 
		if b == 0 then
			return moveToCell(95,16) or moveToCell(17,13)
		elseif b == 1 then
			 PathFinder.moveTo(map, "Ecruteak Stop House 2")
		end
	elseif getMapName() == "Mahogany Town" then
		map = getMapName() 
		if b == 0 then
			moveToCell(40,15)
		elseif b == 1 then
			 PathFinder.moveTo(map, "Route 42")
		end
	elseif getMapName() == "Route 44" then
		b = 1
		Route44()
	elseif getMapName() == "Ecruteak Stop House 1" then
		  map = getMapName() PathFinder.moveTo(map, "Route 38")
	elseif getMapName() == "Route 38" then
		Route38()
	elseif getMapName() == "Route 39" then
		if EnterHoenn then
			log("--- No trees left here in JOHTO Region ---")
			log("-- Useless... --")
			log("- We are now going to HOENN Region! -")
			  map = getMapName() PathFinder.moveTo(map, "Olivine City")
		else
			fatal("--- No more trees left, psh... KJ!!! Stopping this shit!")
		end
	elseif getMapName() == "Olivine City" then
		log("--- PLEASE FASTEN YOUR SEATBELT! ---")
		pushDialogAnswer(2)
		talkToNpc("Sailor Jon")
	elseif getMapName() == "Lilycove City Harbor" then
		log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		log("--- We are now in Hoenn Region! ---")
		log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		  map = getMapName() PathFinder.moveTo(map, "Lilycove City")
    elseif getMapName() == "Lilycove City" then
	map = getMapName()
        if ex == 0 then
			log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
			log("--- We are now in Hoenn Region! ---")
			log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
			log("--- Note: Always Remember your BACK-UP COUNT ---")
			log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
			log("-Remember that smash count are not very accurate-")
			PathFinder.moveTo(map, "Route 121")      --Move to first Site
        elseif ex == 6 then
            fatal("--- UNIVERSAL EXPLORER IS DONE,,, Give feedback to the author ---")  --End
        end
    elseif getMapName() == "Route 121" then
	map = getMapName()
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        if ex == 0 then
              PathFinder.moveTo(map, "Route 120")      --Move to next Site
        elseif ex == 6 then
              PathFinder.moveTo(map, "Lilycove City")  --End
        end
    elseif getMapName() == "Route 120" then
	 map = getMapName() 
        if ex == 0 then
              PathFinder.moveTo(map, "Fortree City")   --Move to next Site
        elseif ex == 6 then
              PathFinder.moveTo(map, "Route 121")      --End
        end
    elseif getMapName() == "Fortree City" then
	 map = getMapName() 
        if ex == 0 then
              PathFinder.moveTo(map, "Route 119A")     --Move to next Site
        elseif ex == 6 then
              PathFinder.moveTo(map, "Route 120")      --End
        end
    elseif getMapName() == "Route 119A" then
	  map = getMapName() 
        if ex == 0 then
            log("Info| We are now entering Natural Site!")
            talkToNpcOnCell(16,68)      --Move to Natural Site
        elseif ex == 1 then
            log("-- Update | Backup count = "..ex)
            PathFinder.moveTo(map, "Route 119B")     --Move to 2nd Site
        elseif ex == 6 then
            PathFinder.moveTo(map, "Fortree City")   --End
        end
    elseif getMapName() == "Natural Site" then
        Natural()
    elseif getMapName() == "Route 119B" then
	map = getMapName() 
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        if ex == 1 then
              PathFinder.moveTo(map, "Route 118")      --Move to 2nd Site
        elseif ex == 6 then
              PathFinder.moveTo(map, "Route 119A")     --End
        end
    elseif getMapName() == "Route 118" then
	map = getMapName() 
        if ex == 1 then
                PathFinder.moveTo(map, "Mauville City Stop House 4")     --Move to 2nd Site
        elseif ex == 6 then
                PathFinder.moveTo(map, "Route 119B")                     --End
        end
    elseif getMapName() == "Mauville City Stop House 4" then
	map = getMapName() 
        if ex == 1 then
                PathFinder.moveTo(map, "Mauville City")                  --Move to 2nd Site
        elseif ex == 6 then
                PathFinder.moveTo(map, "Route 118")                     --End
        end
    elseif getMapName() == "Mauville City" then
	map = getMapName() 
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        if ex == 1 then
                PathFinder.moveTo(map, "Mauville City Stop House 1")     --Move to 2nd Site
        elseif ex == 2 then
                PathFinder.moveTo(map, "Mauville City Stop House 3")     --Move to 3rd Site
        elseif ex == 6 then
                PathFinder.moveTo(map, "Mauville City Stop House 4")     --End
        end
    elseif getMapName() == "Mauville City Stop House 1" then
        map = getMapName() if ex == 1 then
                PathFinder.moveTo(map, "Route 110")                      --Move to 2nd Site
        elseif ex == 2 then
                PathFinder.moveTo(map, "Mauville City")                  --Move to 3rd Site
        end
    elseif getMapName() == "Route 110" then
        map = getMapName() if ex == 1 then
                PathFinder.moveTo(map, "Route 103")                      --Move to 2nd Site
        elseif ex == 2 then
                PathFinder.moveTo(map, "Mauville City Stop House 1")     --Move to 3rd Site
        end
    elseif getMapName() == "Route 103" then
        map = getMapName() if ex == 1 then
            log("-- Info| We are now entering Glacial Site! --")
            talkToNpcOnCell(55,4)                       --Glacial Site 2nd
        elseif ex == 2 then
            log("-- Update| Backup count = "..ex)
                PathFinder.moveTo(map, "Route 110")                      --Move to 3rd Site
        end
    elseif getMapName() == "Glacial Site" then
        Glacial()
    elseif getMapName() == "Mauville City Stop House 3" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
           map = getMapName()  PathFinder.moveTo(map, "Route 111 South")                --Move to 3rd Site
    elseif getMapName() == "Route 111 South" then
        map = getMapName() if ex == 2 then
                PathFinder.moveTo(map, "Route 112")                      --Move to 3rd Site
        elseif ex == 3 then
            moveToCell(20,7)               --Move to 4th Site
        end
    elseif getMapName() == "Route 112" then
        map = getMapName() if ex == 2 then
                PathFinder.moveTo(map, "Fiery Path")                     --Move to 3rd Site
        elseif ex == 3 then
            return     PathFinder.moveTo(map, "Route 111 North") or     PathFinder.moveTo(map, "Route 111 South")                --Move to 4th Site
        end
    elseif getMapName() == "Fiery Path" then
        map = getMapName() if ex == 2 then
            log("-- Info| We are now entering Feral Site! --")
            talkToNpcOnCell(14,32)                      --Feral Site 3rd
        elseif ex == 3 then
            log("-- Update| Backup count = "..ex)
            moveToCell(36,48)                      --Move to 4th Site
        end
    elseif getMapName() == "Feral Site" then
        Feral()
    elseif getMapName() == "Route 111 Desert" then
        map = getMapName() if ex == 3 then
            log("-- Info| We are now entering Historical Site! --")
            return talkToNpc("Gingery Jones")                     --Historical Site 4th
        elseif ex == 4 then
            log("-- Update| Backup count = "..ex)
                PathFinder.moveTo(map, "Route 111 North")                --Move to 5th Site
        end
    elseif getMapName() == "Historical Site" then
        Historical()
    elseif getMapName() == "Route 111 North" then
	map = getMapName() if ex == 3 then
		    PathFinder.moveTo(map, "Route 111 Desert")
	elseif ex == 4 then
        	    PathFinder.moveTo(map, "Route 113")                      --Move to 5th Site
	end
    elseif getMapName() == "Route 113" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
           map = getMapName()  PathFinder.moveTo(map, "Fallarbor Town")                 --Move to 5th Site
    elseif getMapName() == "Fallarbor Town" then
         map = getMapName()    PathFinder.moveTo(map, "Route 114")                      --Move to 5th Site
    elseif getMapName() == "Route 114" then
          map = getMapName()   PathFinder.moveTo(map, "Meteor Falls 1F 1R")             --Move to 5th Site
    elseif getMapName() == "Meteor falls 1F 1R" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
          map = getMapName()   PathFinder.moveTo(map, "Route 115")                      --Move to 5th Site
    elseif getMapName() == "Route 115" then
        map = getMapName() if ex == 4 then
            log("-- Info| We are now entering Mineral Site! --")
            talkToNpcOnCell(81,78)                      --Mineral Site 5th
        elseif ex == 5 then
            log("-- Update| Backup count = "..ex)
                PathFinder.moveTo(map, "Rustboro City")                  --Move to last Site
        end
    elseif getMapName() == "Mineral Site" then
        Mineral()
    elseif getMapName() == "Rustboro City" then
           map = getMapName()  PathFinder.moveTo(map, "Route 116")                      --Move to last Site
    elseif getMapName() == "Route 116" then
           map = getMapName()  PathFinder.moveTo(map, "Rusturf Tunnel")                 --Move to last Site
    elseif getMapName() == "Rusturf Tunnel" then
        map = getMapName() if ex == 5 then
            log("-- Info| We are now entering Haunted Site! --")
            talkToNpc("Gingery Jones")                      --Haunted Site Last
        elseif ex == 6 then
            log("-- Update| Backup count = "..ex)
            log("-- Warning!!! No Site to Smash!!! Going back to starting map... --")
                PathFinder.moveTo(map, "Verdanturf Town")                --End
        end
    elseif getMapName() == "Haunted Site" then
        Haunted()
    elseif getMapName() == "Verdanturf Town" then
    	log(" ")
    	log("--- EXCAVATION SITES are all smashed!!! ---")
    	log("-Fasten your seatbelt! We are now entering hell-")
           map = getMapName()  PathFinder.moveTo(map, "Route 117")                      --End
    elseif getMapName() == "Route 117" then
    	log(" ")
    	log("--- EXCAVATION SITES are all smashed!!! ---")
    	log("-Fasten your seatbelt! We are now entering hell-")    
           map = getMapName()  PathFinder.moveTo(map, "Mauville City Stop House 2")     --End
    elseif getMapName() == "Mauville City Stop House 2" then
    	log(" ")
    	log("--- EXCAVATION SITES are all smashed!!! ---")
    	log("-Fasten your seatbelt! We are now entering hell-") 
           map = getMapName()  PathFinder.moveTo(map, "Mauville City")                  --End     
    end
  
  else
	
	if not isNpcVisible("Nurse Joy") then
		return useItem("Escape Rope")
	else
		usePokecenter()
	end
  end
end

function Natural()
ex = 1
	if isNpcOnCell(4,8) then	

		 talkToNpcOnCell(4,8)
		smash = smash + 1/2
	elseif isNpcOnCell(7,6) then		
	
		 talkToNpcOnCell(7,6)
		smash = smash + 1/2
	elseif isNpcOnCell(11,4) then		
	
		 talkToNpcOnCell(11,4)
		smash = smash + 1/2
	elseif isNpcOnCell(12,3) then			
	
		 talkToNpcOnCell(12,3)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(17,1) then		
	
		 talkToNpcOnCell(17,1)
		smash = smash + 1/2
	elseif isNpcOnCell(16,2) then	
	
		 talkToNpcOnCell(16,2)
		smash = smash + 1/2
	elseif isNpcOnCell(18,3) then		
	
		 talkToNpcOnCell(18,3)
		smash = smash + 1/2
	elseif isNpcOnCell(16,8) then		
	
		 talkToNpcOnCell(16,8)
		smash = smash + 1/2
	elseif isNpcOnCell(20,5) then			
	
		 talkToNpcOnCell(20,5)
		smash = smash + 1/2
	elseif isNpcOnCell(22,7) then		
	
		 talkToNpcOnCell(22,7)
		smash = smash + 1/2
	elseif isNpcOnCell(22,4) then		
	
		 talkToNpcOnCell(22,4)
		smash = smash + 1/2
	elseif isNpcOnCell(20,10) then	
	
		 talkToNpcOnCell(20,10)
		smash = smash + 1/2
	elseif isNpcOnCell(20,15) then		
	
		 talkToNpcOnCell(20,15)
		smash = smash + 1/2
	elseif isNpcOnCell(15,13) then		
	
		 talkToNpcOnCell(15,13)
		smash = smash + 1/2
	elseif isNpcOnCell(12,17) then			
	
		 talkToNpcOnCell(12,17)
		smash = smash + 1/2
	elseif isNpcOnCell(7,17) then		
	
		 talkToNpcOnCell(7,17)
		smash = smash + 1/2
	elseif isNpcOnCell(6,11) then		
	
		 talkToNpcOnCell(6,11)
		smash = smash + 1/2
	elseif isNpcOnCell(4,11) then		
	
		 talkToNpcOnCell(4,11)
		smash = smash + 1/2
	elseif isNpcOnCell(16,17) then		
	
		 talkToNpcOnCell(16,17)
		smash = smash + 1/2
	elseif isNpcOnCell(17,14) then			
	
		 talkToNpcOnCell(17,14)
		smash = smash + 1/2
	elseif isNpcOnCell(18,16) then		
	
		 talkToNpcOnCell(18,16)
		smash = smash + 1/2
	elseif isNpcOnCell(24,18) then		
	
		 talkToNpcOnCell(24,18)
		smash = smash + 1/2
	
	elseif isNpcOnCell(24,16) then		
	
		 talkToNpcOnCell(24,16)
		smash = smash + 1/2
	elseif isNpcOnCell(1,7) then		
	
		 talkToNpcOnCell(1,7)
		smash = smash + 1/2	
	
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(6,7)             --Done Site
        	
        end
end
function Glacial()
ex = 2
	if isNpcOnCell(2,11) then	
	
		 talkToNpcOnCell(2,11)
		smash = smash + 1/2
	elseif isNpcOnCell(3,13) then		
	
		 talkToNpcOnCell(3,13)
		smash = smash + 1/2
	elseif isNpcOnCell(8,3) then		
	
		 talkToNpcOnCell(8,3)
		smash = smash + 1/2
	elseif isNpcOnCell(12,4) then			
	
		 talkToNpcOnCell(12,4)
		smash = smash + 1/2
	elseif isNpcOnCell(14,1) then		
	
		 talkToNpcOnCell(14,1)
		smash = smash + 1/2
	elseif isNpcOnCell(19,1) then		
	
		 talkToNpcOnCell(19,1)
		smash = smash + 1/2
	elseif isNpcOnCell(18,3) then	
	
		 talkToNpcOnCell(18,3)
		smash = smash + 1/2
	elseif isNpcOnCell(21,4) then		
	
		 talkToNpcOnCell(21,4)
		smash = smash + 1/2
	elseif isNpcOnCell(21,8) then		
	
		 talkToNpcOnCell(21,8)
		smash = smash + 1/2
	elseif isNpcOnCell(17,9) then			
	
		 talkToNpcOnCell(17,9)
		smash = smash + 1/2
	elseif isNpcOnCell(23,5) then		
	
		 talkToNpcOnCell(23,5)
		smash = smash + 1/2
	elseif isNpcOnCell(25,4) then		
	
		 talkToNpcOnCell(25,4)
		smash = smash + 1/2
	elseif isNpcOnCell(25,1) then	
	
		 talkToNpcOnCell(25,1)
		smash = smash + 1/2
	elseif isNpcOnCell(19,14) then		
	
		 talkToNpcOnCell(19,14)
		smash = smash + 1/2
	elseif isNpcOnCell(20,16) then		
	
		 talkToNpcOnCell(20,16)
		smash = smash + 1/2
	elseif isNpcOnCell(25,11) then			
	
		 talkToNpcOnCell(25,11)
		smash = smash + 1/2
	elseif isNpcOnCell(19,17) then		
	
		 talkToNpcOnCell(19,17)
		smash = smash + 1/2
	elseif isNpcOnCell(10,18) then		
	
		 talkToNpcOnCell(10,18)
		smash = smash + 1/2
	elseif isNpcOnCell(9,16) then		
	
		 talkToNpcOnCell(9,16)
		smash = smash + 1/2
	elseif isNpcOnCell(4,18) then		
	
		 talkToNpcOnCell(4,18)
		smash = smash + 1/2
	elseif isNpcOnCell(15,14) then			
	
		 talkToNpcOnCell(15,14)
		smash = smash + 1/2
	elseif isNpcOnCell(13,16) then		
	
		 talkToNpcOnCell(13,16)
		smash = smash + 1/2
	elseif isNpcOnCell(13,11) then		
	
		 talkToNpcOnCell(13,11)
		smash = smash + 1/2
	elseif isNpcOnCell(8,14) then		
	
		 talkToNpcOnCell(8,14)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(5,5)                             --Done Site
        	
        end
end
function Feral()
ex = 3
	if isNpcOnCell(3,7) then	
	
		 talkToNpcOnCell(3,7)
		smash = smash + 1/2
	elseif isNpcOnCell(4,5) then		
	
		 talkToNpcOnCell(4,5)
		smash = smash + 1/2
	elseif isNpcOnCell(6,12) then		
	
		 talkToNpcOnCell(6,12)
		smash = smash + 1/2
	elseif isNpcOnCell(3,16) then			
	
		 talkToNpcOnCell(3,16)
		smash = smash + 1/2
	elseif isNpcOnCell(11,11) then		
	
		 talkToNpcOnCell(11,11)
		smash = smash + 1/2
	elseif isNpcOnCell(1,16) then		
		
		 return talkToNpcOnCell(1,16) or moveToCell(8,15)
		
	elseif isNpcOnCell(2,18) then	
	
		 talkToNpcOnCell(2,18)
		smash = smash + 1/2
	elseif isNpcOnCell(12,17) then		
	
		 talkToNpcOnCell(12,17)
		smash = smash + 1/2
	elseif isNpcOnCell(15,17) then		
	
		 talkToNpcOnCell(15,17)
		smash = smash + 1/2
	elseif isNpcOnCell(18,15) then			
	
		 talkToNpcOnCell(18,15)
		smash = smash + 1/2
	elseif isNpcOnCell(25,18) then		
	
		 talkToNpcOnCell(25,18)
		smash = smash + 1/2
	elseif isNpcOnCell(15,15) then		
	
		 return talkToNpcOnCell(15,15) or moveToCell(8,17)
		
	elseif isNpcOnCell(21,15) then	
	
		 talkToNpcOnCell(21,15)
		smash = smash + 1/2
	elseif isNpcOnCell(22,16) then		
	
		 talkToNpcOnCell(22,16)
		smash = smash + 1/2
	elseif isNpcOnCell(24,14) then		
	
		 talkToNpcOnCell(24,14)
		smash = smash + 1/2
	elseif isNpcOnCell(22,11) then			
	
		 talkToNpcOnCell(22,11)
		smash = smash + 1/2
	elseif isNpcOnCell(21,8) then		
	
		 talkToNpcOnCell(21,8)
		smash = smash + 1/2
	elseif isNpcOnCell(21,6) then		
	
		 talkToNpcOnCell(21,6)
		smash = smash + 1/2
	elseif isNpcOnCell(19,4) then		
	
		 talkToNpcOnCell(19,4)
		smash = smash + 1/2
	elseif isNpcOnCell(18,4) then		
	
		 talkToNpcOnCell(18,4)
		smash = smash + 1/2
	elseif isNpcOnCell(7,1) then		
	
		 talkToNpcOnCell(7,1)
		smash = smash + 1/2
	elseif isNpcOnCell(12,3) then			
	
		 talkToNpcOnCell(12,3)
		smash = smash + 1/2
	elseif isNpcOnCell(12,2) then		
	
		 talkToNpcOnCell(12,2)
		smash = smash + 1/2
	elseif isNpcOnCell(6,4) then		
	
		 talkToNpcOnCell(6,4)
		smash = smash + 1/2
	elseif isNpcOnCell(9,5) then		
	
		 talkToNpcOnCell(9,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(5,7)                             --Done Site
        	
        end
end
function Mineral()
ex = 5
	if isNpcOnCell(7,7) then	
	
		 talkToNpcOnCell(7,7)
		smash = smash + 1/2
	elseif isNpcOnCell(9,8) then		
	
		 talkToNpcOnCell(9,8)
		smash = smash + 1/2
	elseif isNpcOnCell(5,9) then		
	
		 talkToNpcOnCell(5,9)
		smash = smash + 1/2
	elseif isNpcOnCell(7,10) then			
	
		 talkToNpcOnCell(7,10)
		smash = smash + 1/2
	elseif isNpcOnCell(3,11) then		
	
		 talkToNpcOnCell(3,11)
		smash = smash + 1/2
	elseif isNpcOnCell(5,13) then		
	
		 talkToNpcOnCell(5,13)
		smash = smash + 1/2
	elseif isNpcOnCell(3,16) then	
	
		 talkToNpcOnCell(3,16)
		smash = smash + 1/2
	elseif isNpcOnCell(11,11) then		
	
		 talkToNpcOnCell(11,11)
		smash = smash + 1/2
	elseif isNpcOnCell(10,13) then		
	
		 talkToNpcOnCell(10,13)
		smash = smash + 1/2
	elseif isNpcOnCell(15,12) then			
	
		 talkToNpcOnCell(15,12)
		smash = smash + 1/2
	elseif isNpcOnCell(14,15) then		
	
		 talkToNpcOnCell(14,15)
		smash = smash + 1/2
	elseif isNpcOnCell(5,17) then		
	
		 return talkToNpcOnCell(5,17) or moveToCell(11,15)
		
	elseif isNpcOnCell(6,18) then	
	
		 talkToNpcOnCell(6,18)
		smash = smash + 1/2
	elseif isNpcOnCell(8,18) then		
	
		 talkToNpcOnCell(8,18)
		smash = smash + 1/2
	elseif isNpcOnCell(25,16) then		
	
		 talkToNpcOnCell(25,16)
		smash = smash + 1/2
	elseif isNpcOnCell(23,18) then			
	
		 talkToNpcOnCell(23,18)
		smash = smash + 1/2
	elseif isNpcOnCell(20,18) then		
	
		 talkToNpcOnCell(20,18)
		smash = smash + 1/2
	elseif isNpcOnCell(23,11) then		
	
		 return talkToNpcOnCell(23,11) or moveToCell(11,17)
		
	elseif isNpcOnCell(23,7) then		
	
		 talkToNpcOnCell(23,7)
		smash = smash + 1/2
	elseif isNpcOnCell(22,6) then		
	
		 talkToNpcOnCell(22,6)
		smash = smash + 1/2
	elseif isNpcOnCell(7,3) then			
	
		 talkToNpcOnCell(7,3)
		smash = smash + 1/2
	elseif isNpcOnCell(21,2) then		
	
		 talkToNpcOnCell(21,2)
		smash = smash + 1/2
	elseif isNpcOnCell(20,2) then		
	
		 talkToNpcOnCell(20,2)
		smash = smash + 1/2
	elseif isNpcOnCell(11,5) then		
	
		 talkToNpcOnCell(11,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(9,6)                             --Done Site
        	
        end
end
function Historical()
ex = 4
	if isNpcOnCell(8,8) then	
	
		 talkToNpcOnCell(8,8)
		smash = smash + 1/2
	elseif isNpcOnCell(9,7) then		
	
		 talkToNpcOnCell(9,7)
		smash = smash + 1/2
	elseif isNpcOnCell(10,6) then		
	
		 talkToNpcOnCell(10,6)
		smash = smash + 1/2
	elseif isNpcOnCell(12,6) then			
	
		 talkToNpcOnCell(12,6)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(16,5) then		
	
		 talkToNpcOnCell(16,5)
		smash = smash + 1/2
	elseif isNpcOnCell(17,5) then	
	
		 talkToNpcOnCell(17,5)
		smash = smash + 1/2
	elseif isNpcOnCell(19,5) then		
	
		 talkToNpcOnCell(19,5)
		smash = smash + 1/2
	elseif isNpcOnCell(21,6) then		
	
		 talkToNpcOnCell(21,6)
		smash = smash + 1/2
	elseif isNpcOnCell(23,1) then			
	
		 talkToNpcOnCell(23,1)
		smash = smash + 1/2
	elseif isNpcOnCell(23,2) then			
	
		 talkToNpcOnCell(23,2)
		smash = smash + 1/2
	elseif isNpcOnCell(21,2) then		
	
		 talkToNpcOnCell(21,2) 
		smash = smash + 1/2
	elseif isNpcOnCell(22,17) then		
	
		 return talkToNpcOnCell(22,17) or moveToCell(21,14)
		
	elseif isNpcOnCell(19,17) then	
	
		 talkToNpcOnCell(19,17)
		smash = smash + 1/2
	elseif isNpcOnCell(17,13) then		
	
		 return talkToNpcOnCell(17,13) or moveToCell(20,15)
	elseif isNpcOnCell(15,13) then		
	
		 talkToNpcOnCell(15,13)
		smash = smash + 1/2
	elseif isNpcOnCell(13,14) then			
	
		 talkToNpcOnCell(13,14)
		smash = smash + 1/2
	elseif isNpcOnCell(11,14) then		
	
		 talkToNpcOnCell(11,14)
		smash = smash + 1/2
	elseif isNpcOnCell(10,15) then		
	
		 talkToNpcOnCell(10,15)
		smash = smash + 1/2
	elseif isNpcOnCell(8,15) then		
	
		 talkToNpcOnCell(8,15)
		smash = smash + 1/2
	elseif isNpcOnCell(5,15) then			
	
		 talkToNpcOnCell(5,15)
		smash = smash + 1/2
	
	elseif isNpcOnCell(3,15) then		
	
		 return talkToNpcOnCell(3,15) or moveToCell(2,12)
		
	elseif isNpcOnCell(1,16) then		
	
		  talkToNpcOnCell(1,16)
		smash = smash + 1/2
	elseif isNpcOnCell(6,12) then		
	
		 return talkToNpcOnCell(6,12) or moveToCell(2,14)
		

	else
		
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(2,8)                              --Done Site
        	
        end
end
function Haunted()
ex = 6
	if isNpcOnCell(1,8) then	
	
		 talkToNpcOnCell(1,8)
		smash = smash + 1/2
	elseif isNpcOnCell(2,11) then		
	
		 talkToNpcOnCell(2,11)
		smash = smash + 1/2
	elseif isNpcOnCell(4,16) then		
	
		 talkToNpcOnCell(4,16)
		smash = smash + 1/2
	elseif isNpcOnCell(9,14) then			
	
		 talkToNpcOnCell(9,14)
		smash = smash + 1/2
	elseif isNpcOnCell(11,14) then		
	
		 talkToNpcOnCell(11,14)
		smash = smash + 1/2
	elseif isNpcOnCell(15,14) then		
	
		 talkToNpcOnCell(15,14)
		smash = smash + 1/2
	elseif isNpcOnCell(17,14) then	
	
		 talkToNpcOnCell(17,14)
		smash = smash + 1/2
	elseif isNpcOnCell(21,14) then		
	
		 talkToNpcOnCell(21,14)
		smash = smash + 1/2
	elseif isNpcOnCell(20,11) then		
	
		 talkToNpcOnCell(20,11)
		smash = smash + 1/2
	elseif isNpcOnCell(16,11) then			
	
		 talkToNpcOnCell(16,11)
		smash = smash + 1/2
	elseif isNpcOnCell(14,11) then		
	
		 talkToNpcOnCell(14,11)
		smash = smash + 1/2
	elseif isNpcOnCell(12,11) then		
	
		 talkToNpcOnCell(12,11)
		smash = smash + 1/2
	elseif isNpcOnCell(8,11) then	
	
		 talkToNpcOnCell(8,11)
		smash = smash + 1/2
	elseif isNpcOnCell(7,8) then		
	
		 talkToNpcOnCell(7,8)
		smash = smash + 1/2
	elseif isNpcOnCell(9,8) then		
	
		 talkToNpcOnCell(9,8)
		smash = smash + 1/2
	elseif isNpcOnCell(11,8) then			
	
		 talkToNpcOnCell(11,8)
		smash = smash + 1/2
	elseif isNpcOnCell(13,8) then		
	
		 talkToNpcOnCell(13,8)
		smash = smash + 1/2
	elseif isNpcOnCell(15,8) then		
	
		 talkToNpcOnCell(15,8)
		smash = smash + 1/2
	elseif isNpcOnCell(17,8) then		
	
		 talkToNpcOnCell(17,8)
		smash = smash + 1/2
	elseif isNpcOnCell(16,5) then		
	
		 talkToNpcOnCell(16,5)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(12,5) then			
	
		 talkToNpcOnCell(12,5)
		smash = smash + 1/2
	elseif isNpcOnCell(8,5) then		
	
		 talkToNpcOnCell(8,5)
		smash = smash + 1/2
	elseif isNpcOnCell(6,5) then		
	
		 talkToNpcOnCell(6,5)
		smash = smash + 1/2
	elseif isNpcOnCell(4,5) then		
	
		 talkToNpcOnCell(4,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(3,8)                             --Done Site
        	
        end
end

function Route22()
		  map = getMapName() PathFinder.moveTo(map, "Pokemon League Reception Gate")
end
function Route26()
	if isNpcOnCell(22,13) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,13)	--Tree 11
	elseif isNpcOnCell(11,16) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(11,16)	--Tree 12
	elseif isNpcOnCell(28,49) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(28,49)	--Tree 13
	elseif isNpcOnCell(25,49) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(25,49)	--Tree 14
	elseif isNpcOnCell(22,49) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,49)	--Tree 15
	elseif isNpcOnCell(20,49) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,49)	--Tree 16
	elseif isNpcOnCell(30,80) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,80)	--Tree 17
	elseif isNpcOnCell(23,84) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(23,84)	--Tree 18
	elseif isNpcOnCell(20,84) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,84)	--Tree 19
	elseif isNpcOnCell(17,85) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(17,85)	--Tree 20
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToCell(0,106)
	end
end
function Route27()
		  map = getMapName() 
		return moveToCell(74,14) or PathFinder.moveTo(map, "New Bark Town")
end
function Route29()
		  map = getMapName() PathFinder.moveTo(map, "Cherrygrove City")
end
function Cherry()
		  map = getMapName() PathFinder.moveTo(map, "Pokecenter Cherrygrove City")
end
function Route30()
		  map = getMapName() PathFinder.moveTo(map, "Route 31")
end
function Route31()
	if isNpcOnCell(46,26) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,26)
	elseif isNpcOnCell(42,23) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(42,23)
	elseif isNpcOnCell(45,19) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(45,19)
	elseif isNpcOnCell(54,14) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,14)
	elseif isNpcOnCell(35,15) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(35,15)
	elseif isNpcOnCell(22,11) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,11)
	elseif isNpcOnCell(27,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,5)
	elseif isNpcOnCell(32,5) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,5)
	elseif isNpcOnCell(27,11) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,11)
	elseif isNpcOnCell(18,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(18,20)
	elseif isNpcOnCell(24,15) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(24,15)	--Berry 1
	elseif isNpcOnCell(25,15) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(25,15)	--Berry 2
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToCell(50,10)
	end
end
function DarkSouth()
		  map = getMapName() PathFinder.moveTo(map, "Route 46")
end
function Violet()
		  map = getMapName() PathFinder.moveTo(map, "Route 32")
end
function Route32()
		talkToNpcOnCell(10,143)
end
function Route33()
		  map = getMapName() PathFinder.moveTo(map, "Azalea Town")
end
function Azalea()
		  map = getMapName() PathFinder.moveTo(map, "Slowpoke Well")
end
function SpokeWell()
		  map = getMapName() PathFinder.moveTo(map, "Slowpoke Well L1")
end
function SpokeWellL1()
		  map = getMapName() PathFinder.moveTo(map, "Slowpoke Well")
end
function Ilex()
		  map = getMapName() PathFinder.moveTo(map, "Route 34 Stop House")
end
function Route46()
		  map = getMapName() PathFinder.moveTo(map, "Route 29 Stop House")
end
function Route34()
		  map = getMapName() PathFinder.moveTo(map, "Goldenrod City")
end
function Route35()
		  map = getMapName() PathFinder.moveTo(map, "Route 36")
end
function Route36()
		  map = getMapName() PathFinder.moveTo(map, "Route 37")
end
function Mortar()
	if isNpcOnCell(23,42) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(23,42)	--Dig 1
	elseif isNpcOnCell(25,45) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(25,45)	--Dig 2
	elseif isNpcOnCell(27,40) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(27,40)	--Dig 3
	elseif isNpcOnCell(57,36) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(57,36) or moveToCell(34,35)	--Dig 4
	elseif isNpcOnCell(56,43) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(56,43)	--Dig 5
	elseif isNpcOnCell(58,39) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(58,39)	--Dig 6
	elseif isNpcOnCell(63,40) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(63,40)	--Dig 7
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		return moveToCell(34,35) or moveToCell(65,46)
end
function Route44()
		  map = getMapName() PathFinder.moveTo(map, "Mahogany Town")
end
function Route38()
	map = getMapName() PathFinder.moveTo(map, "Route 39")
end
function normal()
    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
end

function advanceCatch()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) and ( getOpponentHealth() == 1 ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() == 1 ) then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        else
                return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        end
end

function fswipe()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealthPercent() > 10 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif getOpponentHealthPercent() <= 10 then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3)  or sendAnyPokemon() or attack() or run()
		else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        end
end
function sleep()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        end    
end


