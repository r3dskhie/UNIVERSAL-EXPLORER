		--CONFIGURATION...
		digger = 2	--Index of a pokemon with dig
		butter = 3	--Index of a pokemon with headbutt
		mount = "Bicycle"	--Set the name of the mount
		
	--WARNING!!! So many bugs at the moment
	--This is just a test
	--Please report your encountered bugs at Proshine Forum Thread
	
name = "Cool Script"
author = "--redskhie--	credits: imMigno, S1lver "
description = [[This is just a test]]

function onStart()
	digcount = 0
	hbuttcount = 0
end
function onPause()
	log("Debugging... Checking logs")
	log("Headbutt count: "..hbuttcount)
	log("Dig count: "..digcount)
	log("Map name: "..getMapName())
end
function onStop()
	log("ERROR! Checking logs")
	log("--- "..getMapName().. ", Dig count: "..digcount)
	log("Headbutt count: "..hbuttcount)
end
function onDialogMesssage(message)
	if stringContains(message, "has Dig") then
		digcount = digcount + 1
	elseif stringContains(message, "has Headbutt") then
		hbuttcount = hbuttcount + 1
	end
end
function onPathAction()
	if not isMounted() and hasItem(mount) and not isSurfing() and isOutside() then
		log("---------------------------")
		log("~~~ Riding on my pet!!! ~~~")
		log("---------------------------")
		return useItem(mount)

	elseif isPokemonUsable(1) then
		if getMapName() == "Pallet Town" then
  			if isNpcOnCell(28, 22) then
  				pushDialogAnswer(butter)
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(28, 22)	--Tree 1
			elseif isNpcOnCell(27, 16) then
				pushDialogAnswer(butter)
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(27, 16)	--Tree 2
			elseif isNpcOnCell(20, 7) then
				pushDialogAnswer(butter)
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(20, 7)	--Tree 3
			elseif isNpcOnCell(8, 5) then
				pushDialogAnswer(butter)
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(8, 5)	--Tree 4
			elseif isNpcOnCell(4, 7) then
				pushDialogAnswer(butter)
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(4, 7)	--Tree 5
			elseif isNpcOnCell(13, 17) then
				pushDialogAnswer(butter)
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(13, 17)	--Tree 6
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 1")
			end
		elseif getMapName() == "Route 1" then
			if isNpcOnCell(6,7) then
				pushDialogAnswer(butter)
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(6,7)	--Tree 1
			elseif isNpcOnCell(19,5) then
				pushDialogAnswer(butter)
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(19,5)	--Tree 2
			elseif isNpcOnCell(13,23) then
				pushDialogAnswer(butter)
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(13,23)	--Tree 3
			elseif isNpcOnCell(17,23) then
				pushDialogAnswer(butter)
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(17,23)	--Tree 4
			elseif isNpcOnCell(14,28) then
				pushDialogAnswer(butter)
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(14,28)	--Tree 5
			elseif isNpcOnCell(17,35) then
				pushDialogAnswer(butter)
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(17,35)	--Tree 6
			elseif isNpcOnCell(9,37) then
				pushDialogAnswer(butter)
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(9,37)	--Tree 7
			elseif isNpcOnCell(28,43) then
				pushDialogAnswer(butter)
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(28,43)	--Tree 8
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 1 Stop House")
			end
		elseif getMapName() == "Route 1 Stop House" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			if isNpcOnCell(25,58) then
				pushDialogAnswer(butter)
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(25,58)	--Tree 1
			elseif isNpcOnCell(27,57) then
				pushDialogAnswer(butter)
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(27,57)	--Tree 2
			elseif isNpcOnCell(43,56) then
				pushDialogAnswer(butter)
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(43,56)	--Tree 3
			elseif isNpcOnCell(24,46) then
				pushDialogAnswer(butter)
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(24,46)	--Tree 4
			elseif isNpcOnCell(65,47) then
				pushDialogAnswer(butter)
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(65,47)	--Tree 5
			elseif isNpcOnCell(45,33) then
				pushDialogAnswer(butter)
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(45,33)	--Tree 6
			elseif isNpcOnCell(43,34) then
				pushDialogAnswer(butter)
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(43,34)	--Tree 7
			elseif isNpcOnCell(34,34) then
				pushDialogAnswer(butter)
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(34,34)	--Tree 8
			elseif isNpcOnCell(33,13) then
				pushDialogAnswer(butter)
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(33,13)	--Tree 9
			elseif isNpcOnCell(45,25) then
				pushDialogAnswer(butter)
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(45,25)	--Tree 10
			elseif isNpcOnCell(56,27) then
				pushDialogAnswer(butter)
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(56,27)	--Tree 11
			elseif isNpcOnCell(43,15) then
				pushDialogAnswer(butter)
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(43,15)	--Tree 12
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 2")
			end
		elseif getMapName() == "Route 2" then
			if isNpcOnCell(36,125) then
				pushDialogAnswer(butter)
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(36,125)	--Tree 1
			elseif isNpcOnCell(12,16) then
				pushDialogAnswer(butter)
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(12,16)	--Tree 2
			elseif isNpcOnCell(10,9) then
				pushDialogAnswer(butter)
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(10,9)	--Tree 3
			elseif isNpcOnCell(14,9) then
				pushDialogAnswer(butter)
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(14,9)	--Tree 4
			elseif isNpcOnCell(16,9) then
				pushDialogAnswer(butter)
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(16,9)	--Tree 5
			elseif isNpcOnCell(19,9) then
				pushDialogAnswer(butter)
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(19,9)	--Tree 6
			elseif isNpcOnCell(21,9) then
				pushDialogAnswer(butter)
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(21,9)	--Tree 7
			elseif isNpcOnCell(39,54) then
				pushDialogAnswer(butter)
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(39,54)	--Tree 8
			elseif isNpcOnCell(39,54) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(39,54)	--Berry 1
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				return moveToMap("Route 2 Stop") or moveToMap("Pewter City")
			end
		elseif getMapName() == "Route 2 Stop" then
			moveToMap("Viridian Forest")
		elseif getMapName() == "Viridian Forest" then
			if isNpcOnCell(10,63) then
				pushDialogAnswer(butter)
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
				pushDialogAnswer(butter)
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(14,61)	--Tree 2
			elseif isNpcOnCell(15,61) then
				pushDialogAnswer(butter)
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(15,61)	--Tree 3
			elseif isNpcOnCell(30,62) then
				pushDialogAnswer(butter)
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(30,62)	--Tree 4
			elseif isNpcOnCell(35,62) then
				pushDialogAnswer(butter)
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(35,62)	--Tree 5
			elseif isNpcOnCell(12,43) then
				pushDialogAnswer(butter)
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(12,43)	--Tree 6
			elseif isNpcOnCell(24,42) then
				pushDialogAnswer(butter)
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(24,42)	--Tree 7
			elseif isNpcOnCell(27,42) then
				pushDialogAnswer(butter)
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(27,42)	--Tree 8
			elseif isNpcOnCell(35,41) then
				pushDialogAnswer(butter)
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(35,41)	--Tree 9
			elseif isNpcOnCell(39,40) then
				pushDialogAnswer(butter)
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(39,40)	--Tree 10
			elseif isNpcOnCell(58,59) then
				pushDialogAnswer(butter)
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(58,59)	--Tree 11
			elseif isNpcOnCell(50,35) then
				pushDialogAnswer(butter)
			log("---Headbutting 12th tree---")
				return talkToNpcOnCell(50,35)	--Tree 12
			elseif isNpcOnCell(51,18) then
				pushDialogAnswer(butter)
			log("---Headbutting 13rd tree---")
				return talkToNpcOnCell(51,18)	--Tree 13
			elseif isNpcOnCell(46,18) then
				pushDialogAnswer(butter)
			log("---Headbutting 14th tree---")
				return talkToNpcOnCell(46,18)	--Tree 14
			elseif isNpcOnCell(39,8) then
				pushDialogAnswer(butter)
			log("---Headbutting 15th tree---")
				return talkToNpcOnCell(39,8)	--Tree 15
			elseif isNpcOnCell(46,7) then
				pushDialogAnswer(butter)
			log("---Headbutting 16th tree---")
				return talkToNpcOnCell(46,7)	--Tree 16
			elseif isNpcOnCell(49,7) then
				pushDialogAnswer(butter)
			log("---Headbutting 17th tree---")
				return talkToNpcOnCell(49,7)	--Tree 17
			elseif isNpcOnCell(52,8) then
				pushDialogAnswer(butter)
			log("----Headbutting 18th tree---")
				return talkToNpcOnCell(52,8)	--Tree 18
			elseif isNpcOnCell(22,8) then
				pushDialogAnswer(butter)
			log("---Headbutting 19th tree---")
				return talkToNpcOnCell(22,8)	--Tree 19
			elseif isNpcOnCell(20,8) then
				pushDialogAnswer(butter)
			log("---Headbutting 20th tree---")
				return talkToNpcOnCell(20,8)	--Tree 20
			elseif isNpcOnCell(17,8) then
				pushDialogAnswer(butter)
			log("---Headbutting 21th tree---")
				return talkToNpcOnCell(17,8)	--Tree 21
			elseif isNpcOnCell(27,28) then
				pushDialogAnswer(butter)
			log("---Headbutting 22th tree---")
				return talkToNpcOnCell(27,28)	--Tree 22
			elseif isNpcOnCell(32,32) then
				pushDialogAnswer(butter)
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(32,32)	--Tree 23
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 2 Stop2")
			end
		elseif getMapName() == "Route 2 Stop2" then
			moveToMap("Route 2")
		elseif getMapName() == "Pewter City" then
			if isNpcOnCell(5,7) then
				pushDialogAnswer(butter)
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(5,7)	--Tree 1
			elseif isNpcOnCell(8,7) then
				pushDialogAnswer(butter)
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(8,7)	--Tree 2
			elseif isNpcOnCell(11,7) then
				pushDialogAnswer(butter)
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(11,7)	--Tree 3
			elseif isNpcOnCell(16,17) then
				pushDialogAnswer(butter)
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(16,17)	--Tree 4
			elseif isNpcOnCell(19,17) then
				pushDialogAnswer(butter)
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(19,17)	--Tree 5
			elseif isNpcOnCell(21,6) then
				pushDialogAnswer(butter)
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(21,6)	--Tree 6
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 3")
			end
		elseif getMapName() == "Route 3" then
			if isNpcOnCell(19,21) then
				pushDialogAnswer(butter)
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(19,21)	--Tree 1
			elseif isNpcOnCell(7,28) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(7,28)	--Dig 1
			elseif isNpcOnCell(8,36) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(8,36)	--Dig 2
			elseif isNpcOnCell(16,36) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(16,36)	--Dig 3
			elseif isNpcOnCell(16,30) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(16,30)	--Dig 4
			elseif isNpcOnCell(67,38) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(6,38)	--Dig 5
			elseif isNpcOnCell(71,38) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(71,38)	--Dig 6
			elseif isNpcOnCell(74,38) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(74,38)	--Dig 7
			elseif isNpcOnCell(74,37) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(74,37)	--Dig 8
			elseif isNpcOnCell(29,22) then
				pushDialogAnswer(butter)
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(29,22)	--Tree 2
			elseif isNpcOnCell(46,21) then
				pushDialogAnswer(butter)
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(46,21)	--Tree 3
			elseif isNpcOnCell(49,18) then
				pushDialogAnswer(butter)
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(49,18)	--Tree 4
			elseif isNpcOnCell(83,37) then
				pushDialogAnswer(butter)
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
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Mt. Moon 1F")
			end
		elseif getMapName() == "Mt. Moon 1F" then
			if digcount < 12 then
				if isNpcOnCell(25,60) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(25,60)	--Dig 1
				elseif isNpcOnCell(20,60) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(20,60)	--Dig 2
				elseif isNpcOnCell(22,61) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(22,61)	--Dig 3
				elseif isNpcOnCell(22,58) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(22,58)	--Dig 4
				else
					log("--- Avoiding Ladder! ---")
					return moveToCell(56,29)	--CELL TO AVOID LADDER
				end
			elseif digcount < 16 then
				if isNpcOnCell(63,18) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(63,18)	--Dig 5
				elseif isNpcOnCell(65,20) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(65,20)	--Dig 6
				elseif isNpcOnCell(67,19) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(67,19)	--Dig 7
				elseif isNpcOnCell(66,21) then
					pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(66,21)	--Dig 8
				else
					log("--- Digging on "..getMapName().." finished! Moving to next Spot ---")
					return moveToCell(58,33)	--MOVING to 1st area of DIG SPOT in B2F
				end
			
			elseif digcount == 16 then
				log("--- Digging on "..getMapName().." finished! Moving to next Spot ---")
				return moveToCell(58,33)	--MOVING to 1st area of DIG SPOT in B2F
			end
		elseif digcount < 21 and getMapName() == "Mt. Moon B1F" then
			moveToCell(43,34)
		elseif digcount <= 21 and getMapName() == "Mt. Moon B2F" then
			if isNpcOnCell(33,50) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(33,50)	--Dig 9
			elseif isNpcOnCell(38,49) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(38,49)	--Dig 10
			elseif isNpcOnCell(39,52) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(39,52)	--Dig 11
			elseif isNpcOnCell(39,55) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(39,55)	--Dig 12
			elseif isNpcOnCell(44,49) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(44,49)	--Dig 13
			else
				log("--- "..getMapName().." first area cleared, moving to 1F ---")
				return moveToCell(30,54)	--GOING BACK to 1F to start for 2nd area of DIG SPOT in B2F
			end
		elseif digcount < 26 and getMapName() == "Mt. Moon B1F" then
			moveToCell(18,15)	
		elseif digcount < 26 and getMapName() == "Mt. Moon 1F" then
			moveToCell(37,29)
		elseif digcount < 26 and getMapName() == "Mt. Moon B1F" then
			moveToCell(57,21)
		elseif digcount <= 26 and getMapName() == "Mt. Moon B2F" then
			if isNpcOnCell(50,25) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(50,25)	--Dig 14
			elseif isNpcOnCell(57,23) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(57,23)	--Dig 15
			elseif isNpcOnCell(62,21) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(62,21)	--Dig 16
			elseif isNpcOnCell(61,26) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(61,26)	--Dig 17
			elseif isNpcOnCell(56,29) then
				pushDialogAnswer(digger)
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(56,29)	--Dig 18
			else
				log("--- Mt. Moon cleared! Moving to next map ---")
				return moveToCell(44,30)	--GOING BACK to 1F to Exit
			end
		elseif digcount == 26 and getMapName() == "Mt. Moon B1F" then
			moveToCell(65,20)
		elseif digcount == 26 and getMapName() == "Mt. Moon 1F" then
			moveToCell(21,20)		--CELL EXITS
		elseif digcount == 26 and getMapName() == "Mt. Moon B1F" then
			moveToCell(56,34)
		elseif digcount == 26 and getMapName() == "Mt. Moon B2F" then
			moveToCell(17,27)
		elseif digcount == 26 and getMapName() == "Mt. Moon B1F" then
			moveToCell(41,20)
		elseif digcount == 26 and getMapName() == "Mt. Moon 1F" then
			moveToMap("Mt. Moon Exit")
		elseif getMapName() == "Mt. Moon Exit" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			fatal("Done test! Please report at PROSHINE FORUM THREAD! Thank you!")
		end
	end
end
function onBattleAction()

	if getOpponentName() == "Fletchling" then

		return useItem("Pokeball") or sendAnyPokemon() or run()
	else
		return run() or sendAnyPokemon()
	end
	
end
