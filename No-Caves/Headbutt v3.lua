		--CONFIGURATION...
		digger = 4	--Index of a pokemon with dig
		butter = 5	--Index of a pokemon with headbutt
		mount = "Bicycle"	--Set the name of the mount
		MtMoon = true		--Set this to true if you want to digs in mt. moon --4 days cooldown per dig
		
	--WARNING!!! So many bugs at the moment
	--This is just a test
	--Please report your encountered bugs at Proshine Forum Thread
	
local dialogs = {
	headbutt = {
		"Select a Pokemon that has Headbutt."
	},
	dig = {
		"Select a Pokemon that has Dig."
	}
	
}
name = "Cool Script"
author = "--redskhie--"
description = [[---This script will hunt for trees, dig spots and many more!---]]

function onStart()
	digcount = 0
	hbuttcount = 0
	x = 0
	y = 0
	z = 0
end
function onPause()
	log("Debugging... Checking logs")
	log("Headbutt count: "..hbuttcount)
	log("Dig count: "..digcount)
	log("Map name: "..getMapName())
	log("X 1F count: "..x)
	log("Y B1F count: "..y)
	log("Z B2F count: "..z)
end
function onStop()
	log("ERROR! Checking logs")
	log("--- "..getMapName().. ", Dig count: "..digcount)
	log("Headbutt count: "..hbuttcount)
	log("X 1F count: "..x)
	log("Y B1F count: "..y)
	log("Z B2F count: "..z)
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
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 2")
			end
		elseif getMapName() == "Route 2" then
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
			if isNpcOnCell(5,7) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(5,7)	--Tree 1
			elseif isNpcOnCell(8,7) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(8,7)	--Tree 2
			elseif isNpcOnCell(11,7) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(11,7)	--Tree 3
			elseif isNpcOnCell(16,17) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(16,17)	--Tree 4
			elseif isNpcOnCell(19,17) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(19,17)	--Tree 5
			elseif isNpcOnCell(21,6) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(21,6)	--Tree 6
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 3")
			end
		elseif getMapName() == "Route 3" then
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
			elseif MtMoon then
				
			log("---"..getMapName().." Cleared... Entering Mt. Moon---")
				moveToMap("Mt. Moon 1F")
			else
				log("---"..getMapName().." Cleared... Ignoring Mt. Moon---")
				talkToNpcOnCell(74,16)
			end
		elseif getMapName() == "Mt. Moon 1F" then
			if x == 0 then
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
				else
					log("--- Avoiding Ladder! ---")
					moveToCell(56,29)	--CELL TO AVOID LADDER
					x = x + 1
				end
			elseif x == 1 then
				if isNpcOnCell(63,18) then
					
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
					moveToCell(58,33)	--MOVING to 1st area of DIG SPOT in B2F
					x = x + 1
				end
			elseif x == 2 then
				moveToCell(37,29)
				x = x + 1
			elseif x == 3 then
				moveToCell(21,20)		--CELL EXITS
				x = x + 1
			elseif x == 4 then
				moveToMap("Mt. Moon Exit")


			end
		elseif getMapName() == "Mt. Moon B1F" then
			if y == 0 then
				moveToCell(43,34)
				y = y + 1
			elseif y == 1 then
				moveToCell(18,15)
				y= y + 1
			elseif y == 2 then
				moveToCell(57,21)
				y = y + 1
			elseif y == 3 then
				moveToCell(65,20)
				y = y + 1
			elseif y == 4 then
				moveToCell(56,34)
				y = y + 1
			elseif y == 5 then
				moveToCell(41,20)
				y = y + 1

			end
		elseif getMapName() == "Mt. Moon B2F" then

			if z == 0 then

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
			else
				log("--- "..getMapName().." first area cleared, moving to 1F ---")
				moveToCell(30,54)	--GOING BACK to 1F to start for 2nd area of DIG SPOT in B2F
				z = z + 1
			end

			elseif z == 1 then

			if isNpcOnCell(50,25) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(50,25)	--Dig 14
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
				log("--- Mt. Moon cleared! Moving to next map ---")
				moveToCell(44,30)	--GOING BACK to 1F to Exit
				z = z + 1
			end

			elseif z == 2 then
				moveToCell(17,27)
				z = z + 1

			end
		elseif getMapName() == "Mt. Moon Exit" then
			x = 0
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
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
				moveToMap("Cerulean City")
			end
		elseif getMapName() == "Cerulean City" then
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
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 9")
			end
		elseif getMapName() == "Route 9" then
			moveToMap("Route 10")
		elseif getMapName() == "Route 10" then
			if isNpcOnCell(9,9) then
				
				return talkToNpcOnCell(9,9) or moveToMap("Lavender Town")
			
				
			end
		elseif getMapName() == "Lavender Town" then
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
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 12")
			end
		elseif getMapName() == "Route 12" then
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
			moveToMap("Route 18")
		elseif getMapName() == "Route 18" then
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
			moveToMap("Route 7")
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
			moveToMap("Saffron City")
		elseif getMapName() == "Saffron City" then
			moveToMap("Route 6 Stop House")
		elseif getMapName() == "Route 6 Stop House" then
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
			moveToMap("Route 11")
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
			log("--- ROUTINE DONE ... Wait for the next UPDATE!!! ---")
		elseif getMapName() == "Pokecenter Viridian" then
			moveToMap("Viridian City")
		end
	end
end
function onBattleAction()

	if getOpponentName() == "Fletchling" or getOpponentName() == "Starly" or getOpponentName() == "Ferroseed" or getOpponentName() == "Scyther" or getOpponentName() == "Murkrow"  or getOpponentName() == "Venipede"  then
		if getActivePokemonNumber() == 1 then
			return sendPokemon(2) or useItem("Great Ball") or sendAnyPokemon() or run()
		
		elseif ( getActivePokemonNumber() == 2 ) and ( getOpponentHealth() > 1 ) then
			return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
		elseif getOpponentHealth() == 1 then

			return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")  or sendAnyPokemon() or attack() or run()
        
		end
	elseif getMapName() == "Mt. Moon 1F" then
		run()
	x = x -1
	elseif getMapName() == "Mt. Moon B1F" then
		run()
	y = y - 1
	elseif getMapName() == "Mt. Moon B2F" then
		run()
	z = z - 1
	else
		return run() or sendAnyPokemon()
	end
	
end
