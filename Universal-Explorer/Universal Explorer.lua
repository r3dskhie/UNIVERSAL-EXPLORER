				
				-- Copyright © 2016 redskhie 
				-- Official github link:
				-- Official PROShine thread: https://proshine-bot.com/thread-1246.html
				-- Contact me at discord nickname: Redd
			
			
				

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
  elseif isPokemonUsable(1) and isPokemonUsable(2) then
    	if getMapName() == "Pallet Town" then
  			if isNpcOnCell(28, 22) then
  				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(28, 22)	--Tree 1
			elseif isNpcOnCell(27, 16) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(27, 16)	--Tree 2
			elseif isNpcOnCell(20, 7) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(20, 7)	--Tree 3
			elseif isNpcOnCell(8, 5) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(8, 5)	--Tree 4
			elseif isNpcOnCell(4, 7) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(4, 7)	--Tree 5
			elseif isNpcOnCell(13, 17) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(13, 17)	--Tree 6
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 1")
			end
		elseif getMapName() == "Route 1" then
			if isNpcOnCell(6,7) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(6,7)	--Tree 1
			elseif isNpcOnCell(19,5) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(19,5)	--Tree 2
			elseif isNpcOnCell(13,23) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(13,23)	--Tree 3
			elseif isNpcOnCell(17,23) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(17,23)	--Tree 4
			elseif isNpcOnCell(14,28) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(14,28)	--Tree 5
			elseif isNpcOnCell(17,35) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(17,35)	--Tree 6
			elseif isNpcOnCell(9,37) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(9,37)	--Tree 7
			elseif isNpcOnCell(28,43) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(28,43)	--Tree 8
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 1 Stop House")
			end
		elseif getMapName() == "Route 1 Stop House" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			if jto == 0 then
				
			if pc == 0 then
				if isNpcOnCell(25,58) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(25,58)	--Tree 1
				elseif isNpcOnCell(27,57) then
	
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(27,57)	--Tree 2
				elseif isNpcOnCell(43,56) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(43,56)	--Tree 3
				elseif isNpcOnCell(24,46) then
					
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(24,46)	--Tree 4
				elseif isNpcOnCell(65,47) then
				
				log("---Headbutting 5th tree---")
					return talkToNpcOnCell(65,47)	--Tree 5
				elseif isNpcOnCell(45,33) then
				
				log("---Headbutting 6th tree---")
					return talkToNpcOnCell(45,33)	--Tree 6
				elseif isNpcOnCell(43,34) then
				
				log("---Headbutting 7th tree---")
					return talkToNpcOnCell(43,34)	--Tree 7
				elseif isNpcOnCell(34,34) then
				
				log("----Headbutting 8th tree---")
					return talkToNpcOnCell(34,34)	--Tree 8
				elseif isNpcOnCell(33,13) then
				
				log("---Headbutting 9th tree---")
					return talkToNpcOnCell(33,13)	--Tree 9
				elseif isNpcOnCell(45,25) then
				
				log("---Headbutting 10th tree---")
					return talkToNpcOnCell(45,25)	--Tree 10
				elseif isNpcOnCell(56,27) then
				
				log("---Headbutting 11th tree---")
					return talkToNpcOnCell(56,27)	--Tree 11
				elseif isNpcOnCell(43,15) then
				
				log("---Headbutting Last tree---")
					return talkToNpcOnCell(43,15)	--Tree 12
				else
					log("--- Pokecenter found! Registering on PC ---")
					moveToMap("Pokecenter Viridian")
					pc = pc + 1
				end
			elseif pc == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 2")
			end
			elseif jto == 1 then
				log("We are now near JOHTO REGION...Prepare yourself!")
				moveToMap("Route 22")
			end
		elseif getMapName() == "Pokecenter Viridian" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Viridian City")
		elseif getMapName() == "Pokecenter Pewter" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Pewter City")
		elseif getMapName() == "Pokecenter Route 3" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Route 3")
		elseif getMapName() == "Pokecenter Cerulean" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Cerulean City")
		elseif getMapName() == "Pokecenter Route 10" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Route 10")
		elseif getMapName() == "Pokecenter Lavender" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Lavender Town")
		elseif getMapName() == "Pokecenter Fuchsia" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Fuchsia City")
		elseif getMapName() == "Pokecenter Celadon" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Celadon City")
		elseif getMapName() == "Pokecenter Saffron" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Saffron City")
		elseif getMapName() == "Pokecenter Vermilion" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Vermilion City")
		elseif getMapName() == "Route 2" then
			pc = 0
			if jto == 0 then
				
			if isNpcOnCell(36,125) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(36,125)	--Tree 1
			elseif isNpcOnCell(12,16) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(12,16) or moveToMap("Route 2 Stop")	--Tree 2
			elseif isNpcOnCell(10,9) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(10,9)	--Tree 3
			elseif isNpcOnCell(14,9) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(14,9)	--Tree 4
			elseif isNpcOnCell(16,9) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(16,9)	--Tree 5
			elseif isNpcOnCell(19,9) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(19,9)	--Tree 6
			elseif isNpcOnCell(21,9) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(21,9)	--Tree 7
			elseif isNpcOnCell(39,54) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(39,54)	--Tree 8
			elseif isNpcOnCell(42,66) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(42,66)	--Berry 1
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				return moveToMap("Route 2 Stop") or moveToMap("Pewter City")
			end
			elseif jto == 1 then
				return moveToMap("Viridian City") or moveToCell(39,90)
			end
		elseif getMapName() == "Route 2 Stop3" then
			moveToCell(3,12)
		elseif getMapName() == "Route 2 Stop" then
			moveToMap("Viridian Forest")
		elseif getMapName() == "Viridian Forest" then
			if isNpcOnCell(10,63) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(10,63)	--Tree 1
			elseif isNpcOnCell(19,46) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(19,46)	--Berry 1
			elseif isNpcOnCell(61,62) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(61,62)	--Berry 2
			elseif isNpcOnCell(62,62) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(62,62)	--Berry 3
			elseif isNpcOnCell(24,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(24,8)	--Berry 4
			elseif isNpcOnCell(14,61) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(14,61)	--Tree 2
			elseif isNpcOnCell(15,61) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(15,61)	--Tree 3
			elseif isNpcOnCell(30,62) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(30,62)	--Tree 4
			elseif isNpcOnCell(35,62) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(35,62)	--Tree 5
			elseif isNpcOnCell(12,43) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(12,43)	--Tree 6
			elseif isNpcOnCell(24,42) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(24,42)	--Tree 7
			elseif isNpcOnCell(27,42) then
			
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(27,42)	--Tree 8
			elseif isNpcOnCell(35,41) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(35,41)	--Tree 9
			elseif isNpcOnCell(39,40) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(39,40)	--Tree 10
			elseif isNpcOnCell(58,59) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(58,59)	--Tree 11
			elseif isNpcOnCell(50,35) then
				
			log("---Headbutting 12th tree---")
				return talkToNpcOnCell(50,35)	--Tree 12
			elseif isNpcOnCell(51,18) then
				
			log("---Headbutting 13rd tree---")
				return talkToNpcOnCell(51,18)	--Tree 13
			elseif isNpcOnCell(46,18) then
				
			log("---Headbutting 14th tree---")
				return talkToNpcOnCell(46,18)	--Tree 14
			elseif isNpcOnCell(39,8) then
				
			log("---Headbutting 15th tree---")
				return talkToNpcOnCell(39,8)	--Tree 15
			elseif isNpcOnCell(46,7) then
				
			log("---Headbutting 16th tree---")
				return talkToNpcOnCell(46,7)	--Tree 16
			elseif isNpcOnCell(49,7) then
				
			log("---Headbutting 17th tree---")
				return talkToNpcOnCell(49,7)	--Tree 17
			elseif isNpcOnCell(52,8) then
				
			log("----Headbutting 18th tree---")
				return talkToNpcOnCell(52,8)	--Tree 18
			elseif isNpcOnCell(22,8) then
				
			log("---Headbutting 19th tree---")
				return talkToNpcOnCell(22,8)	--Tree 19
			elseif isNpcOnCell(20,8) then
				
			log("---Headbutting 20th tree---")
				return talkToNpcOnCell(20,8)	--Tree 20
			elseif isNpcOnCell(17,8) then
				
			log("---Headbutting 21th tree---")
				return talkToNpcOnCell(17,8)	--Tree 21
			elseif isNpcOnCell(27,28) then
				
			log("---Headbutting 22th tree---")
				return talkToNpcOnCell(27,28)	--Tree 22
			elseif isNpcOnCell(32,32) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(32,32)	--Tree 23
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 2 Stop2")
			end
		elseif getMapName() == "Route 2 Stop2" then
			moveToMap("Route 2")
		elseif getMapName() == "Pewter City" then
				if isNpcOnCell(16,41) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(16,41)	--Tree 1
				elseif isNpcOnCell(28,42) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(28,42)	--Tree 2
				elseif isNpcOnCell(21,29) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(21,29)	--Tree 3
				elseif isNpcOnCell(29,29) then
				
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(29,29)	--Tree 4
				elseif isNpcOnCell(42,27) then
				
				log("---Headbutting 5th tree---")
					return talkToNpcOnCell(42,27)	--Tree 5
				elseif isNpcOnCell(49,6) then
				
				log("---Headbutting 6th tree---")
					return talkToNpcOnCell(49,6)	--Tree 6
				elseif isNpcOnCell(39,8) then
				
				log("---Headbutting 7th tree---")
					return talkToNpcOnCell(39,8)	--Tree 7
				elseif isNpcOnCell(42,7) then
				
				log("---Headbutting 8th tree---")
					return talkToNpcOnCell(42,7)	--Tree 8
				elseif isNpcOnCell(46,8) then
				
				log("---Headbutting 9th tree---")
					return talkToNpcOnCell(46,8)	--Tree 9
				elseif isNpcOnCell(5,7) then
				
				log("---Headbutting 10th tree---")
					return talkToNpcOnCell(5,7)	--Tree 10
				elseif isNpcOnCell(8,7) then
				
				log("---Headbutting 11th tree---")
					return talkToNpcOnCell(8,7)	--Tree 11
				elseif isNpcOnCell(11,7) then
				
				log("---Headbutting 12th tree---")
					return talkToNpcOnCell(11,7)	--Tree 12
				elseif isNpcOnCell(16,7) then
				
				log("---Headbutting 13th tree---")
					return talkToNpcOnCell(16,7)	--Tree 13
				elseif isNpcOnCell(19,7) then
				
				log("---Headbutting 14th tree---")
					return talkToNpcOnCell(19,7)	--Tree 14
				elseif isNpcOnCell(21,6) then
				
				log("---Headbutting Last tree---")
					return talkToNpcOnCell(21,6)	--Tree 15
				else

					log("---"..getMapName().." Cleared... Moving to next Map---")
					log("-- Ignoring PC here! Next route is mostly suggested --")
					moveToMap("Route 3")
				end
		elseif getMapName() == "Route 3" then
			
			if pc == 0 then
				
				if isNpcOnCell(19,21) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(19,21)	--Tree 1
				elseif isNpcOnCell(7,28) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(7,28)	--Dig 1
				elseif isNpcOnCell(8,36) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(8,36)	--Dig 2
				elseif isNpcOnCell(16,36) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(16,36)	--Dig 3
				elseif isNpcOnCell(16,30) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(16,30)	--Dig 4
				elseif isNpcOnCell(67,38) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(67,38)	--Dig 5
				elseif isNpcOnCell(71,38) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(71,38)	--Dig 6
				elseif isNpcOnCell(74,38) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(74,38)	--Dig 7
				elseif isNpcOnCell(74,37) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(74,37)	--Dig 8
				elseif isNpcOnCell(29,22) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(29,22)	--Tree 2
				elseif isNpcOnCell(46,21) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(46,21)	--Tree 3
				elseif isNpcOnCell(49,18) then
				
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(49,18)	--Tree 4
				elseif isNpcOnCell(83,37) then
				
				log("---Headbutting Last tree---")
					return talkToNpcOnCell(83,37)	--Tree 5
					elseif isNpcOnCell(75,33) then
				log("---Ooops! We have some berries that are ready to harvest---")
				log("---Harvesting some berries---")
					return talkToNpcOnCell(75,33)	--Berry 1
				elseif isNpcOnCell(76,33) then
				log("---Ooops! We have some berries that are ready to harvest---")
				log("---Harvesting some berries---")
					return talkToNpcOnCell(76,33)	--Berry 2
				elseif isNpcOnCell(77,33) then
				log("---Ooops! We have some berries that are ready to harvest---")
				log("---Harvesting some berries---")
					return talkToNpcOnCell(77,33)	--Berry 3

				else

				log("--- Pokecenter found! Registering on PC ---")
					moveToMap("Pokecenter Route 3")
					pc = pc + 1
				end
			elseif pc == 1 then
				if MtMoon then
					log("---"..getMapName().." Cleared... Entering Mt. Moon---")
					moveToMap("Mt. Moon 1F")
				elseif isNpcOnCell(74,16) then
					log("---"..getMapName().." Cleared... Ignoring Mt. Moon---")
					talkToNpcOnCell(74,16)
				end
			end
		elseif getMapName() == "Mt. Moon 1F" then
			if x == 3 then
				if isNpcOnCell(25,60) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(25,60)	--Dig 1
				elseif isNpcOnCell(20,60) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(20,60)	--Dig 2
				elseif isNpcOnCell(22,61) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(22,61)	--Dig 3
				elseif isNpcOnCell(22,58) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(22,58)	--Dig 4
				elseif isNpcOnCell(63,18) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(63,18)	--Dig 5
				elseif isNpcOnCell(65,20) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(65,20)	--Dig 6
				elseif isNpcOnCell(67,19) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(67,19)	--Dig 7
				elseif isNpcOnCell(66,21) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(66,21)	--Dig 8
				else
					log("--- Digging on "..getMapName().." finished! Moving to next Spot ---")
					return moveToCell(58,33)	--MOVING to 1st area of DIG SPOT in B2F
				end
			
			elseif x == 2 then
				moveToCell(37,29)
			else
				moveToCell(21,20)		--CELL EXITS
			end
		elseif getMapName() == "Mt. Moon B1F" then
			if x == 3 then
				moveToCell(43,34)
			elseif x == 2 then
				return moveToCell(18,15) or moveToCell(57,21)
			else
				return moveToCell(65,20) or moveToCell(56,34) or moveToMap("Mt. Moon Exit")
			end
		elseif getMapName() == "Mt. Moon B2F" then

			x = 2
				if isNpcOnCell(33,50) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(33,50)	--Dig 9
				elseif isNpcOnCell(38,49) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(38,49)	--Dig 10
				elseif isNpcOnCell(39,52) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(39,52)	--Dig 11
				elseif isNpcOnCell(39,55) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(39,55)	--Dig 12
				elseif isNpcOnCell(44,49) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(44,49)	--Dig 13
				elseif isNpcOnCell(50,25) then
				 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(50,25) or moveToCell(30,54) 	--Dig 14
				elseif isNpcOnCell(57,23) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(57,23)	--Dig 15
				elseif isNpcOnCell(62,21) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(62,21)	--Dig 16
				elseif isNpcOnCell(61,26) then
				 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(61,26)	--Dig 17
				elseif isNpcOnCell(56,29) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(56,29)	--Dig 18
				else
					x = x -1
					log("--- Mt. Moon cleared! Moving to next map ---")
					return moveToCell(44,30)  or moveToCell(17,27) or moveToCell(30,54)	--GOING BACK to 1F to Exit
					
				end
		elseif getMapName() == "Mt. Moon Exit" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			pc = 0
			if isNpcOnCell(74,15) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(74,15)	--Tree 1
			elseif isNpcOnCell(79,16) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(79,16)	--Tree 2
			elseif isNpcOnCell(78,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(78,8)	--Berry 1
			elseif isNpcOnCell(79,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(79,8)	--Berry 2
			elseif isNpcOnCell(80,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(80,8)	--Berry 3
			elseif isNpcOnCell(81,15) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(81,15)	--Tree 3
			elseif isNpcOnCell(90,11) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(90,11)	--Tree 4
			elseif isNpcOnCell(83,25) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(83,25)	--Tree 5
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToCell(96,21)
			end
		elseif getMapName() == "Cerulean City" then
			if pc == 0 then
				if isNpcOnCell(44,8) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(44,8)	--Tree 1
				elseif isNpcOnCell(43,14) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(43,14)	--Tree 2
				elseif isNpcOnCell(34,38) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(34,38)	--Tree 3
				elseif isNpcOnCell(36,39) then
				
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(36,39)	--Tree 4
				elseif isNpcOnCell(38,38) then
				
				log("---Headbutting 5th tree---")
					return talkToNpcOnCell(38,38)	--Tree 5
				elseif isNpcOnCell(23,36) then
				
					log("---Headbutting Last tree---")
					return talkToNpcOnCell(23,36)	--Tree 6
				else
	
					log("--- Pokecenter found! Registering on PC ---")
						moveToMap("Pokecenter Cerulean")
						pc = pc + 1
					end
			elseif pc == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
					moveToMap("Route 9")
			end
		elseif getMapName() == "Route 9" then
			pc = 0
			x = 1
			moveToMap("Route 10")
		elseif getMapName() == "Route 10" then
			if x == 1 then
				moveToMap("Rock Tunnel 1")
			elseif x == 0 then
				if isNpcOnCell(9,9) then
					return talkToNpcOnCell(9,9) or moveToMap("Lavender Town")
				end
			end
		elseif getMapName() == "Rock Tunnel 1" then
			x = 0
			if isNpcOnCell(41,6) then
					 
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(41,6)	--Dig 1
			elseif isNpcOnCell(44,7) then
				 
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(44,7)	--Dig 2
			elseif isNpcOnCell(34,5) then
					 
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(34,5)	--Dig 3
			elseif isNpcOnCell(37,14) then
					 
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(37,14)	--Dig 4
			elseif isNpcOnCell(28,18) then
				 
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(28,18)	--Dig 5
			elseif isNpcOnCell(37,18) then
					 
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(37,18)	--Dig 6
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 10")
			end
		elseif getMapName() == "Lavender Town" then
			
			if pc == 0 then
				if isNpcOnCell(5,9) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(5,9)	--Tree 1
				elseif isNpcOnCell(17,19) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(17,19)	--Tree 2
				elseif isNpcOnCell(15,14) then
					
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(15,14)	--Tree 3
				else
					log("--- Pokecenter found! Registering on PC ---")
					moveToMap("Pokecenter Lavender")
					pc = pc + 1	
				end
			elseif pc == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
					moveToMap("Route 12")
			end
		elseif getMapName() == "Route 12" then
			pc = 0
			moveToMap("Route 13")
		elseif getMapName() == "Route 13" then
			if isNpcOnCell(91,15) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(91,15)	--Tree 1
			elseif isNpcOnCell(91,21) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(91,21)	--Tree 2
			elseif isNpcOnCell(87,21) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(87,21)	--Tree 3
			elseif isNpcOnCell(76,22) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(76,22)	--Tree 4
			elseif isNpcOnCell(71,15) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(71,15)	--Tree 5
			elseif isNpcOnCell(61,15) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(61,15)	--Tree 6
			elseif isNpcOnCell(57,15) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(57,15)	--Tree 7
			elseif isNpcOnCell(52,15) then
				
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(52,15)	--Tree 8
			elseif isNpcOnCell(8,15) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(8,15)	--Tree 9
			elseif isNpcOnCell(81,21) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(81,21)	--Tree 10
			elseif isNpcOnCell(12,15) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(12,15)	--Tree 11
			elseif isNpcOnCell(15,15) then
				
			log("---Headbutting 12th tree---")
				return talkToNpcOnCell(15,15)	--Tree 12
			elseif isNpcOnCell(21,15) then
				
			log("---Headbutting 13rd tree---")
				return talkToNpcOnCell(21,15)	--Tree 13
			elseif isNpcOnCell(24,15) then
				
			log("---Headbutting 14th tree---")
				return talkToNpcOnCell(24,15)	--Tree 14
			elseif isNpcOnCell(30,15) then
				
			log("---Headbutting 15th tree---")
				return talkToNpcOnCell(30,15)	--Tree 15
			elseif isNpcOnCell(32,14) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(32,14)	--Tree 16
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 14")
			end
		elseif getMapName() == "Route 14" then	
			if isNpcOnCell(21,4) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(21,4)	--Tree 1
			elseif isNpcOnCell(21,14) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(21,14)	--Tree 2
			elseif isNpcOnCell(15,17) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(15,17)	--Tree 3
			elseif isNpcOnCell(21,23) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(21,23)	--Tree 4
			elseif isNpcOnCell(14,24) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(14,24)	--Tree 5
			elseif isNpcOnCell(15,28) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(15,28)	--Tree 6
			elseif isNpcOnCell(22,30) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(22,30)	--Tree 7
			elseif isNpcOnCell(22,38) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(22,38)	--Berry 1
			elseif isNpcOnCell(21,38) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(21,38)	--Berry 2
			elseif isNpcOnCell(10,46) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(10,46)	--Dig 1
			elseif isNpcOnCell(10,48) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(10,48)	--Dig 2
			elseif isNpcOnCell(15,48) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(15,48)	--Dig 3
			elseif isNpcOnCell(13,47) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(13,47)	--Dig 4
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 15")
			end
		elseif getMapName() == "Route 15" then
			if isNpcOnCell(66,12) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(66,12)	--Tree 1
			elseif isNpcOnCell(61,13) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(61,13)	--Tree 2
			elseif isNpcOnCell(57,26) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(57,26)	--Dig 1
			elseif isNpcOnCell(57,25) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(57,25)	--Dig 2
			elseif isNpcOnCell(51,18) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(51,18)	--Dig 3
			elseif isNpcOnCell(47,21) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(47,21)	--Dig 4
			elseif isNpcOnCell(47,25) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(47,25)	--Dig 5
			elseif isNpcOnCell(50,11) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(50,11)	--Tree 3
			elseif isNpcOnCell(48,10) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(48,10)	--Tree 4
			elseif isNpcOnCell(40,12) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(40,12)	--Tree 5
			elseif isNpcOnCell(35,14) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(35,14)	--Tree 6
			elseif isNpcOnCell(11,23) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(11,23)	--Tree 7
			elseif isNpcOnCell(19,24) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(19,24)	--Tree 8
			elseif isNpcOnCell(33,14) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(33,14)	--Berry 1
			elseif isNpcOnCell(32,14) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(32,14)	--Berry 2
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 15 Stop House")
			end
		elseif getMapName() == "Route 15 Stop House" then
			moveToMap("Fuchsia City")
		elseif getMapName() == "Fuchsia City" then
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Fuchsia")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 18")
			end
		elseif getMapName() == "Route 18" then
			pc = 0
			return moveToMap("Route 17") or moveToCell(35,16)
		elseif getMapName() == "Bike Road Stop" then
			moveToCell(0,6)
		elseif getMapName() == "Route 17" then
			moveToMap("Route 16")
		elseif getMapName() == "Route 16" then
			return moveToMap("Celadon City") or moveToCell(64,13)
		elseif getMapName() == "Route 16 Stop House" then
			moveToCell(20,6)
		elseif getMapName() == "Celadon City" then
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Route 10")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 7")
			end
		elseif getMapName() == "Route 7" then
			if isNpcOnCell(2,20) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(2,20)	--Tree 1
			elseif isNpcOnCell(5,17) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(5,17)	--Tree 2
			elseif isNpcOnCell(7,17) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(7,17)	--Tree 3
			elseif isNpcOnCell(9,17) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(9,17)	--Tree 4
			elseif isNpcOnCell(13,15) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(13,15)	--Tree 5
			elseif isNpcOnCell(15,15) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(15,15)	--Tree 6
			elseif isNpcOnCell(20,13) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(20,13)	--Tree 7
			elseif isNpcOnCell(14,7) then
				
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(14,7)	--Tree 8
			elseif isNpcOnCell(16,7) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(16,7)	--Tree 9
			elseif isNpcOnCell(18,7) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(18,7)	--Tree 10
			elseif isNpcOnCell(20,7) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(20,7)	--Tree 11
			elseif isNpcOnCell(20,19) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(20,19)	--Tree 12
			elseif isNpcOnCell(32,14) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(32,14)	--Berry 1
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Underground House 3")
			end
		elseif getMapName() == "Underground House 3" then
			moveToMap("Underground1")
		elseif getMapName() == "Underground1" then
			moveToMap("Underground House 4")
		elseif getMapName() == "Underground House 4" then
			moveToMap("Route 8")
		elseif getMapName() == "Route 8" then
			if isNpcOnCell(17,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(17,3)	--Berry 1
			elseif isNpcOnCell(18,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(18,3)	--Berry 2
			elseif isNpcOnCell(19,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(19,3)	--Berry 3
			elseif isNpcOnCell(37,4) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(37,4)	--Tree 1
			elseif isNpcOnCell(52,15) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(52,15)	--Tree 2
			elseif isNpcOnCell(54,14) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(54,14)	--Tree 3
			elseif isNpcOnCell(62,6) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(62,6)	--Tree 4
			elseif isNpcOnCell(57,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(57,3)	--Berry 4
			elseif isNpcOnCell(56,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(56,3)	--Berry 5
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 8 Stop House")
			end
		elseif getMapName() == "Route 8 Stop House" then
			pc = 0
			moveToMap("Saffron City")
		elseif getMapName() == "Saffron City" then
			
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Saffron")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 6 Stop House")
			end
		elseif getMapName() == "Route 6 Stop House" then
			pc = 0
			moveToMap("Route 6")
		elseif getMapName() == "Route 6" then
			if isNpcOnCell(31,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(31,5)	--Berry 1
			elseif isNpcOnCell(32,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(32,5)	--Berry 2
			elseif isNpcOnCell(37,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(37,5)	--Berry 3
			elseif isNpcOnCell(38,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(38,5)	--Berry 4
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Vermilion City")
			end
		elseif getMapName() == "Vermilion City" then
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Vermilion")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 11")
			end
		elseif getMapName() == "Route 11" then
			if isNpcOnCell(81, 7) then
  				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(81, 7)	--Tree 1
			elseif isNpcOnCell(78, 6) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(78, 6)	--Tree 2
			elseif isNpcOnCell(76, 5) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(76, 5)	--Tree 3
			elseif isNpcOnCell(19, 13) then
  				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(19, 13)	--Tree 4
			elseif isNpcOnCell(19, 7) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(19, 7)	--Tree 5
			elseif isNpcOnCell(23, 6) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(23, 6)	--Tree 6
			elseif isNpcOnCell(72,5) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(72,5)	--Tree 7
			elseif isNpcOnCell(70,5) then
				
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(70,5)	--Tree 8
			elseif isNpcOnCell(67,5) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(67,5)	--Tree 9
			elseif isNpcOnCell(64,5) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(64,5)	--Tree 10
			elseif isNpcOnCell(61,5) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(61,5)	--Tree 11
			elseif isNpcOnCell(57,5) then
				
			log("---Headbutting 12th tree---")
				return talkToNpcOnCell(57,5)	--Tree 12
			elseif isNpcOnCell(54,5) then
				
			log("---Headbutting 13rd tree---")
				return talkToNpcOnCell(54,5)	--Tree 13
			elseif isNpcOnCell(48,5) then
				
			log("---Headbutting 14th tree---")
				return talkToNpcOnCell(48,5)	--Tree 14
			elseif isNpcOnCell(45,5) then
				
			log("---Headbutting 15th tree---")
				return talkToNpcOnCell(45,5)	--Tree 15
			elseif isNpcOnCell(43,5) then
				
			log("---Headbutting 16th tree---")
				return talkToNpcOnCell(43,5)	--Tree 16
			elseif isNpcOnCell(40,5) then
				
			log("---Headbutting 17th tree---")
				return talkToNpcOnCell(40,5)	--Tree 17
			elseif isNpcOnCell(37,5) then
				
			log("----Headbutting 18th tree---")
				return talkToNpcOnCell(37,5)	--Tree 18
			elseif isNpcOnCell(33,5) then
				
			log("---Headbutting 19th tree---")
				return talkToNpcOnCell(33,5)	--Tree 19
			elseif isNpcOnCell(31,5) then
				
			log("---Headbutting 20th tree---")
				return talkToNpcOnCell(31,5)	--Tree 20
			elseif isNpcOnCell(29,4) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(29,4)	--Tree 21
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Digletts Cave Entrance 2")
			end
		elseif getMapName() == "Digletts Cave Entrance 2" then
			moveToMap("Digletts Cave")
		elseif getMapName() == "Digletts Cave" then
			if isNpcOnCell(52,42) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(52,42)	--Dig 1
			elseif isNpcOnCell(51,42) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(51,42)	--Dig 2
			elseif isNpcOnCell(47,43) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(47,43)	--Dig 3
			elseif isNpcOnCell(49,44) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(49,44)	--Dig 4
			elseif isNpcOnCell(35,35) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(35,35)	--Dig 5
			elseif isNpcOnCell(36,37) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(36,37)	--Dig 6
			elseif isNpcOnCell(32,35) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(32,35)	--Dig 7
			elseif isNpcOnCell(33,37) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(33,37)	--Dig 8
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Digletts Cave Entrance 1")
			end
	elseif getMapName() == "Digletts Cave Entrance 1" then
		if EnterJohto then
			log(" ")
    			log("--- KANTO REGION is fucked up!!! ---")
    			log("-Fasten your seatbelt! We are now going to JOHTO REGION-")
    			log(" ")     
			jto = 1
			moveToMap("Route 2")
		else
			fatal("--- No more trees left, psh... KJ!!! Stopping this shit!")
		end
	elseif getMapName() == "Route 22" then
		Route22()
	elseif getMapName() == "Pokemon League Reception Gate" then
		moveToMap("Route 26")
	elseif getMapName() == "Route 26" then
		Route26()
	elseif getMapName() == "Route 27" then
		log("--- We are near in JOHTO Region, take care!!! ---")
		Route27()
	elseif getMapName() == "Tohjo Falls" then
		moveToCell(23,32)
	elseif getMapName() == "New Bark Town" then
		log("--- We are now in JOHTO Region, goodluck!!! ---")
		moveToMap("Route 29")
	elseif getMapName() == "Route 29" then
		Route29()
	elseif getMapName() == "Pokecenter Cherrygrove City" then
		pc = 1
		log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
		moveToMap("Cherrygrove City")
	elseif getMapName() == "Cherrygrove City" then
		if pc == 0 then
			Cherry()
		elseif pc == 1 then
		log("---"..getMapName().." Cleared... Moving to next Map---")
			moveToMap("Route 30")
		end
	elseif getMapName() == "Route 30" then
		pc = 0
		Route30()
	elseif getMapName() == "Route 31" then
		if c == 0 then
			Route31()
		elseif c == 1 then
			moveToMap("Violet City Stop House")
		end
	elseif getMapName() == "Dark Cave South" then
		c = 1
		DarkSouth()
	elseif getMapName() == "Violet City Stop House" then
		moveToMap("Violet City")
	elseif getMapName() == "Violet City" then
		Violet()
	elseif getMapName() == "Route 32" then
		Route32()
	elseif getMapName() == "Route 33" then
		Route33()
	elseif getMapName() == "Azalea Town" then
		if a == 1 then
			Azalea()
		elseif a == 0 then
			moveToMap("Ilex Forest Stop House")
		end
	elseif getMapName() == "Slowpoke Well" then
		if a == 1 then
			SpokeWell()
		elseif a == 0 then
			moveToMap("Azalea Town")
		end
	elseif getMapName() == "Slowpoke Well L1" then
		a = 0
		SpokeWellL1()
	elseif getMapName() == "Ilex Forest Stop House" then
		moveToMap("Ilex Forest")
	elseif getMapName() == "Ilex Forest" then
		Ilex()
	elseif getMapName() == "Route 34 Stop House" then
		moveToMap("Route 34")
	elseif getMapName() == "Route 34" then
		Route34()
	elseif getMapName() == "Goldenrod City" then
		if pc == 0 then
			log("--- Pokecenter found! Registering on PC ---")
			moveToMap("Pokecenter Goldenrod")
		elseif pc == 1 then
			moveToMap("Route 35 Stop House")
		end
	elseif getMapName() == "Pokecenter Goldenrod" then
		pc = 1
		log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
		moveToMap("Goldenrod City")
	elseif getMapName() == "Route 35 Stop House" then
		pc = 0
		moveToMap("Route 35")
	elseif getMapName() == "Route 35" then
		Route35()
	elseif getMapName() == "Route 36" then
		Route36()
	elseif getMapName() == "Route 37" then
		if isNpcOnCell(30,29) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
			return talkToNpcOnCell(30,29)	--Berry 1
		elseif isNpcOnCell(30,23) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
			return talkToNpcOnCell(30,23)	--Berry 2
		elseif isNpcOnCell(33,26) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
			return talkToNpcOnCell(33,26)	--Berry 3
		else
			moveToMap("Ecruteak City")
		end
	elseif getMapName() == "Ecruteak City" then
		if b == 0 then
			moveToMap("Ecruteak Stop House 2")
		elseif b == 1 then
			moveToMap("Ecruteak Stop House 1")
		end
	elseif getMapName() == "Ecruteak Stop House 2" then
		if b == 0 then
			moveToMap("Route 42")
		elseif b == 1 then
			moveToMap("Ecruteak City")
		end
	elseif getMapName() == "Mt. Mortar 1F" then
		Mortar()
	elseif getMapName() == "Mt. Mortar Lower Cave" then
		moveToCell(47,57)
	elseif getMapName() == "Route 42" then
		if b == 0 then
			return moveToCell(95,16) or moveToCell(17,13)
		elseif b == 1 then
			moveToMap("Ecruteak Stop House 2")
		end
	elseif getMapName() == "Mahogany Town" then
		if b == 0 then
			moveToCell(40,15)
		elseif b == 1 then
			moveToMap("Route 42")
		end
	elseif getMapName() == "Route 44" then
		b = 1
		Route44()
	elseif getMapName() == "Ecruteak Stop House 1" then
		moveToMap("Route 38")
	elseif getMapName() == "Route 38" then
		Route38()
	elseif getMapName() == "Route 39" then
		if EnterHoenn then
			log("--- No trees left here in JOHTO Region ---")
			log("-- Useless... --")
			log("- We are now going to HOENN Region! -")
			moveToMap("Olivine City")
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
		moveToMap("Lilycove City")
    elseif getMapName() == "Lilycove City" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- We are now in Hoenn Region! ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        moveToMap("Route 121")
    elseif getMapName() == "Route 121" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        if ex == 0 then
            moveToMap("Route 120")      --Move to next Site
        elseif ex == 6 then
            moveToMap("Lilycove City")  --End
        end
    elseif getMapName() == "Route 120" then
        if ex == 0 then
            moveToMap("Fortree City")   --Move to next Site
        elseif ex == 6 then
            moveToMap("Route 121")      --End
        end
    elseif getMapName() == "Fortree City" then
        if ex == 0 then
            moveToMap("Route 119A")     --Move to next Site
        elseif ex == 6 then
            moveToMap("Route 120")      --End
        end
    elseif getMapName() == "Route 119A" then
        if ex == 0 then
            log("Info| We are now entering Natural Site!")
            talkToNpcOnCell(16,68)      --Move to Natural Site
        elseif ex == 1 then
            log("-- Update | Backup count = "..ex)
            moveToMap("Route 119B")     --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Fortree City")   --End
        end
    elseif getMapName() == "Natural Site" then
        Natural()
    elseif getMapName() == "Route 119B" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        if ex == 1 then
            moveToMap("Route 118")      --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 119A")     --End
        end
    elseif getMapName() == "Route 118" then
        if ex == 1 then
            moveToMap("Mauville City Stop House 4")     --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 119B")                     --End
        end
    elseif getMapName() == "Mauville City Stop House 4" then
        if ex == 1 then
            moveToMap("Mauville City")                  --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 118")                     --End
        end
    elseif getMapName() == "Mauville City" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        if ex == 1 then
            moveToMap("Mauville City Stop House 1")     --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City Stop House 3")     --Move to 3rd Site
        elseif ex == 6 then
            moveToMap("Mauville City Stop House 4")     --End
        end
    elseif getMapName() == "Mauville City Stop House 1" then
        if ex == 1 then
            moveToMap("Route 110")                      --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City")                  --Move to 3rd Site
        end
    elseif getMapName() == "Route 110" then
        if ex == 1 then
            moveToMap("Route 103")                      --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City Stop House 1")     --Move to 3rd Site
        end
    elseif getMapName() == "Route 103" then
        if ex == 1 then
            log("-- Info| We are now entering Glacial Site! --")
            talkToNpcOnCell(55,4)                       --Glacial Site 2nd
        elseif ex == 2 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Route 110")                      --Move to 3rd Site
        end
    elseif getMapName() == "Glacial Site" then
        Glacial()
    elseif getMapName() == "Mauville City Stop House 3" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        moveToMap("Route 111 South")                --Move to 3rd Site
    elseif getMapName() == "Route 111 South" then
        if ex == 2 then
            moveToMap("Route 112")                      --Move to 3rd Site
        elseif ex == 3 then
            moveToCell(20,7)               --Move to 4th Site
        end
    elseif getMapName() == "Route 112" then
        if ex == 2 then
            moveToMap("Fiery Path")                     --Move to 3rd Site
        elseif ex == 3 then
            return moveToMap("Route 111 North") or moveToMap("Route 111 South")                --Move to 4th Site
        end
    elseif getMapName() == "Fiery Path" then
        if ex == 2 then
            log("-- Info| We are now entering Feral Site! --")
            talkToNpcOnCell(14,32)                      --Feral Site 3rd
        elseif ex == 3 then
            log("-- Update| Backup count = "..ex)
            moveToCell(36,48)                      --Move to 4th Site
        end
    elseif getMapName() == "Feral Site" then
        Feral()
    elseif getMapName() == "Route 111 Desert" then
        if ex == 3 then
            log("-- Info| We are now entering Historical Site! --")
            return talkToNpc("Gingery Jones")                     --Historical Site 4th
        elseif ex == 4 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Route 111 North")                --Move to 5th Site
        end
    elseif getMapName() == "Historical Site" then
        Historical()
    elseif getMapName() == "Route 111 North" then
	if ex == 3 then
		moveToMap("Route 111 Desert")
	elseif ex == 4 then
        	moveToMap("Route 113")                      --Move to 5th Site
	end
    elseif getMapName() == "Route 113" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        moveToMap("Fallarbor Town")                 --Move to 5th Site
    elseif getMapName() == "Fallarbor Town" then
        moveToMap("Route 114")                      --Move to 5th Site
    elseif getMapName() == "Route 114" then
        moveToMap("Meteor Falls 1F 1R")             --Move to 5th Site
    elseif getMapName() == "Meteor falls 1F 1R" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("-Remember that smash count are not very accurate-")
        moveToMap("Route 115")                      --Move to 5th Site
    elseif getMapName() == "Route 115" then
        if ex == 4 then
            log("-- Info| We are now entering Mineral Site! --")
            talkToNpcOnCell(81,78)                      --Mineral Site 5th
        elseif ex == 5 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Rustboro City")                  --Move to last Site
        end
    elseif getMapName() == "Mineral Site" then
        Mineral()
    elseif getMapName() == "Rustboro City" then
        moveToMap("Route 116")                      --Move to last Site
    elseif getMapName() == "Route 116" then
        moveToMap("Rusturf Tunnel")                 --Move to last Site
    elseif getMapName() == "Rusturf Tunnel" then
        if ex == 5 then
            log("-- Info| We are now entering Haunted Site! --")
            talkToNpc("Gingery Jones")                      --Haunted Site Last
        elseif ex == 6 then
            log("-- Update| Backup count = "..ex)
            log("-- Warning!!! No Site to Smash!!! Going back to starting map... --")
            moveToMap("Verdanturf Town")                --End
        end
    elseif getMapName() == "Haunted Site" then
        Haunted()
    elseif getMapName() == "Verdanturf Town" then
    	log(" ")
    	log("--- EXCAVATION SITES are all smashed!!! ---")
    	log("-Fasten your seatbelt! We are now entering hell-")
        moveToMap("Route 117")                      --End
    elseif getMapName() == "Route 117" then
    	log(" ")
    	log("--- EXCAVATION SITES are all smashed!!! ---")
    	log("-Fasten your seatbelt! We are now entering hell-")    
        moveToMap("Mauville City Stop House 2")     --End
    elseif getMapName() == "Mauville City Stop House 2" then
    	log(" ")
    	log("--- EXCAVATION SITES are all smashed!!! ---")
    	log("-Fasten your seatbelt! We are now entering hell-") 
        moveToMap("Mauville City")                  --End     
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
	if isNpcOnCell(54,15) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,15)	--Tree 1
	elseif isNpcOnCell(54,21) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,21)	--Tree 2
	elseif isNpcOnCell(46,18) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,18)	--Tree 3
	elseif isNpcOnCell(46,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,10)	--Tree 4
	elseif isNpcOnCell(41,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(41,10)	--Tree 5
	elseif isNpcOnCell(36,10) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(36,10)	--Tree 6
	elseif isNpcOnCell(41,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(41,21)	--Tree 7
	elseif isNpcOnCell(44,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(44,20)	--Tree 8
	elseif isNpcOnCell(19,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,13)	--Tree 9
	elseif isNpcOnCell(19,7) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,7)	--Tree 10
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Pokemon League Reception Gate")
	end
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
	if isNpcOnCell(207,16) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(207,16)	--Tree 21
	elseif isNpcOnCell(203,17) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(203,17)	--Tree 22
	elseif isNpcOnCell(172,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(172,21)	--Tree 23
	elseif isNpcOnCell(108,14) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(108,14)	--Tree 24
	elseif isNpcOnCell(105,14) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(105,14)	--Tree 25
	elseif isNpcOnCell(103,14) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(103,14)	--Tree 26
	elseif isNpcOnCell(96,16) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(96,16)	--Tree 27
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		return moveToCell(74,14) or moveToMap("New Bark Town")
	end
end
function Route29()
	if isNpcOnCell(95,13) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(95,13)
	elseif isNpcOnCell(84,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(84,13)
	elseif isNpcOnCell(67,26) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(67,26)
	elseif isNpcOnCell(38,25) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(38,25)
	elseif isNpcOnCell(43,24) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(43,24)
	elseif isNpcOnCell(46,24) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,24)
	elseif isNpcOnCell(50,25) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(50,25)
	elseif isNpcOnCell(55,19) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(55,19)
	elseif isNpcOnCell(67,18) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(67,18)
	elseif isNpcOnCell(58,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(58,13)
	elseif isNpcOnCell(39,17) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(39,17)
	elseif isNpcOnCell(38,22) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(38,22)
	elseif isNpcOnCell(27,9) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,9)
	elseif isNpcOnCell(18,12) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(18,12)
	elseif isNpcOnCell(15,18) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(15,18)
	elseif isNpcOnCell(10,15) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(10,15)
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Cherrygrove City")
	end
end
function Cherry()
	if isNpcOnCell(46,7) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,7)
	elseif isNpcOnCell(44,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(44,20)
	elseif isNpcOnCell(34,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(34,21)
	elseif isNpcOnCell(27,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,13)
	elseif isNpcOnCell(32,8) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,8)
	else
		log("--- Pokecenter found! Registering on PC ---")
		moveToMap("Pokecenter Cherrygrove City")
	end
end
function Route30()
	if isNpcOnCell(15,94) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(15,94)
	elseif isNpcOnCell(17,93) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(17,93)
	elseif isNpcOnCell(19,91) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,91)
	elseif isNpcOnCell(30,86) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,86)
	elseif isNpcOnCell(25,83) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(25,83)
	elseif isNpcOnCell(23,78) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(23,78)
	elseif isNpcOnCell(24,70) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(24,70)
	elseif isNpcOnCell(30,71) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,71)
	elseif isNpcOnCell(32,73) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,73)
	elseif isNpcOnCell(7,68) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(7,68)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Route 31")
	end
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
	if isNpcOnCell(49,30) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(49,30)	--Dig 1
	elseif isNpcOnCell(49,35) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(49,35)	--Dig 2
	elseif isNpcOnCell(64,39) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(64,39)	--Dig 3
	elseif isNpcOnCell(55,38) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(55,38)	--Dig 4
	else
		log("--- No dig spots available! "..getMapName().." Cleared... Moving to next Map---")
		moveToCell(15,35)
	end
end
function Violet()
	if isNpcOnCell(32,63) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,63)
	elseif isNpcOnCell(33,42) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(33,42)
	elseif isNpcOnCell(20,49) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,49)
	elseif isNpcOnCell(22,40) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,40)
	elseif isNpcOnCell(18,37) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(18,37)
	elseif isNpcOnCell(21,61) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(21,61)
	elseif isNpcOnCell(24,63) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(24,63)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Route 32")
	end
end
function Route32()
	if isNpcOnCell(19,10) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,10)
	elseif isNpcOnCell(25,8) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(25,8)	--Berry 1
	elseif isNpcOnCell(26,8) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(26,8)	--Berry 2
	elseif isNpcOnCell(7,59) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(7,59)
	elseif isNpcOnCell(5,97) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(5,97)
	elseif isNpcOnCell(7,97) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(7,97)
	elseif isNpcOnCell(10,99) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(10,99)
	elseif isNpcOnCell(15,124) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(15,124)
	elseif isNpcOnCell(20,119) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(20,119)	--Berry 3
	elseif isNpcOnCell(21,119) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(21,119)	--Berry 4
	elseif isNpcOnCell(22,119) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(22,119)	--Berry 5
	elseif isNpcOnCell(23,140) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(23,140)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		talkToNpcOnCell(10,143)
	end
end
function Route33()
	if isNpcOnCell(12,17) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(12,17)
	elseif isNpcOnCell(10,17) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(10,17)
	elseif isNpcOnCell(7,18) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(7,18)
	elseif isNpcOnCell(28,22) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(28,22)
	elseif isNpcOnCell(26,22) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(26,22)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Azalea Town")
	end
end
function Azalea()
	if isNpcOnCell(51,25) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(51,25)
	elseif isNpcOnCell(31,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(31,13)
	elseif isNpcOnCell(31,25) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(31,25)
	elseif isNpcOnCell(31,31) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(31,31)
	elseif isNpcOnCell(12,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(12,20)
	elseif isNpcOnCell(8,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(8,10)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Slowpoke Well")
	end
end
function SpokeWell()
	if isNpcOnCell(41,27) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(41,27)	--Dig 1
	elseif isNpcOnCell(40,29) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(40,29)	--Dig 2
	elseif isNpcOnCell(43,29) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(43,29)	--Dig 3
	elseif isNpcOnCell(44,19) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(44,19)	--Dig 4
	elseif isNpcOnCell(41,11) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(41,11)	--Dig 5
	elseif isNpcOnCell(37,12) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(37,12)	--Dig 6
	elseif isNpcOnCell(32,17) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(32,17)	--Dig 7
	elseif isNpcOnCell(27,13) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(27,13)	--Dig 8
	elseif isNpcOnCell(33,12) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(33,12)	--Dig 9
	elseif isNpcOnCell(13,23) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(13,23)	--Dig 10
	elseif isNpcOnCell(10,27) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(10,27)	--Dig 11
	elseif isNpcOnCell(15,25) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(15,25)	--Dig 12
	else
		log("--- No dig spots available! "..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Slowpoke Well L1")
	end
end
function SpokeWellL1()
	if isNpcOnCell(18,21) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(18,21)	--Dig 1
	elseif isNpcOnCell(14,17) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(14,17)	--Dig 2
	elseif isNpcOnCell(10,9) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(10,9)	--Dig 3
	elseif isNpcOnCell(26,13) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(26,13)	--Dig 4
	elseif isNpcOnCell(27,14) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(27,14)	--Dig 5
	elseif isNpcOnCell(21,13) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(21,13)	--Dig 6
	elseif isNpcOnCell(23,15) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(23,15)	--Dig 7
	else
		log("--- No dig spots available! "..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Slowpoke Well")
	end
end
function Ilex()
	if isNpcOnCell(5,36) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(5,36)
	elseif isNpcOnCell(23,23) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(23,23)
	elseif isNpcOnCell(25,19) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(25,19)
	elseif isNpcOnCell(30,18) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,18)
	elseif isNpcOnCell(34,19) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(34,19)
	elseif isNpcOnCell(37,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(37,20)
	elseif isNpcOnCell(40,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(40,21)
	elseif isNpcOnCell(42,28) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(42,28)
	elseif isNpcOnCell(37,30) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(37,30)
	elseif isNpcOnCell(34,32) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(34,32)
	elseif isNpcOnCell(33,27) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(33,27)
	elseif isNpcOnCell(29,31) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(29,31)
	elseif isNpcOnCell(32,8) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,8)
	elseif isNpcOnCell(29,7) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(29,7)
	elseif isNpcOnCell(26,8) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(26,8)
	elseif isNpcOnCell(22,10) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,10)
	elseif isNpcOnCell(17,14) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(17,14)
	elseif isNpcOnCell(14,15) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(14,15)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Route 34 Stop House")
	end
end
function Route34()
	if isNpcOnCell(15,62) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(15,62)
	elseif isNpcOnCell(17,62) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(17,62)
	elseif isNpcOnCell(32,48) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,48)
	elseif isNpcOnCell(32,43) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,43)
	elseif isNpcOnCell(32,38) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,38)
	elseif isNpcOnCell(29,29) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(29,29)
	elseif isNpcOnCell(26,29) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(26,29)
	elseif isNpcOnCell(24,23) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(24,23)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Goldenrod City")
	end
end
function Route35()
	if isNpcOnCell(6,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(6,13)
	elseif isNpcOnCell(5,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(5,10)
	elseif isNpcOnCell(15,7) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(15,7)
	elseif isNpcOnCell(20,7) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,7)
	elseif isNpcOnCell(22,7) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,7)
	elseif isNpcOnCell(11,56) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(11,56)
	elseif isNpcOnCell(29,57) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(29,57)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Route 36")
	end
end
function Route36()
	if isNpcOnCell(3,16) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(3,16)
	elseif isNpcOnCell(7,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(7,13)
	elseif isNpcOnCell(10,11) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(10,11)
	elseif isNpcOnCell(12,11) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(12,11)
	elseif isNpcOnCell(12,23) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(12,23)
	elseif isNpcOnCell(35,25) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(35,25)
	elseif isNpcOnCell(38,24) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(38,24)
	elseif isNpcOnCell(40,24) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(40,24)	--Berry 1
	elseif isNpcOnCell(43,24) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(43,24)	--Berry 2
	elseif isNpcOnCell(45,24) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(45,24)
	elseif isNpcOnCell(52,24) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(52,24)
	elseif isNpcOnCell(74,20) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(74,20)
	elseif isNpcOnCell(45,18) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(45,18)
	elseif isNpcOnCell(43,18) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(43,18)
	elseif isNpcOnCell(32,13) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,13)
	elseif isNpcOnCell(30,11) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,11)
	elseif isNpcOnCell(28,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(28,10)
	elseif isNpcOnCell(26,10) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(26,10)
	elseif isNpcOnCell(20,8) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,8)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Route 37")
	end
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
end
function Route44()
	if isNpcOnCell(3,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(3,13)
	elseif isNpcOnCell(12,7) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(12,7)
	elseif isNpcOnCell(14,8) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(14,8)
	elseif isNpcOnCell(20,6) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,6)
	elseif isNpcOnCell(55,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(55,5)
	elseif isNpcOnCell(61,16) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(61,16)
	elseif isNpcOnCell(54,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,20)
	elseif isNpcOnCell(48,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(48,20)
	elseif isNpcOnCell(46,22) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,22)
	elseif isNpcOnCell(42,22) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(42,22)
	elseif isNpcOnCell(20,17) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,17)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Mahogany Town")
	end
end
function Route38()
	if isNpcOnCell(59,5) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(59,5)
	elseif isNpcOnCell(57,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(57,5)
	elseif isNpcOnCell(55,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(55,5)
	elseif isNpcOnCell(53,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(53,5)
	elseif isNpcOnCell(51,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(51,5)
	elseif isNpcOnCell(49,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(49,5)
	elseif isNpcOnCell(52,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(52,5)
	elseif isNpcOnCell(50,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(50,5)
	elseif isNpcOnCell(31,9) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(31,9)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Route 39")
	end
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
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif getOpponentHealth() == 1 then
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


