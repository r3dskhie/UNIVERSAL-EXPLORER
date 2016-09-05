
digger = 4
function onStart()
	digcount = 0
	x = 3
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

		if getMapName() == "Mt. Moon 1F" then
			if x == 3 then
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
				elseif isNpcOnCell(63,18) then
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
			
			elseif x == 2 then
				moveToCell(37,29)
			else
				moveToCell(21,20)		--CELL EXITS
			end
		elseif digcount < 21 and getMapName() == "Mt. Moon B1F" then
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
				elseif isNpcOnCell(50,25) then
				pushDialogAnswer(digger)
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(50,25) or moveToCell(30,54) 	--Dig 14
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
					x = x -1
					log("--- Mt. Moon cleared! Moving to next map ---")
					return moveToCell(44,30)  or moveToCell(17,27)	--GOING BACK to 1F to Exit
					
				end
		elseif getMapName() == "Mt. Moon Exit" then
			moveToMap("Route 4")
	end
end
function onBattleAction()
	run()

end
