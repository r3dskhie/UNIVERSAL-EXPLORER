

function onPathAction()
	if isPokemonUsable(1) then
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
				return moveToMap("Route 2 Stop1") or moveToMap("Pewter City")
			end
      moveToMap("Route 2 Stop2")
    elseif getMapName() == "Route 2 Stop2" then
      moveToMap("Viridian Forest")
    elseif getMapName() == "Viridian Forest" then
      moveToMap("Route 2 Stop")
    elseif getMapName() == "Route 2 Stop" then
      moveToMap("Route 2")
    elseif getMapName() == "Route 2" then
      moveToMap("Pewter City")
    elseif getMapName() == "Pewter City" then
      moveToMap("Route 3")
    elseif getMapName() == "Route 3" then
      moveToMap("Mt. Moon 1F")
    elseif getMapName() == "Mt. Moon 1F" then
      moveToMap("Mt. Moon B1F")
    elseif getMapName() == "Mt. Moon B1F" then
      moveToMap("Mt. Moon B2F")
    elseif getMapName() == "Mt. Moon B2F" then
      moveToMap("Mt. Moon Exit")
    elseif getMapName() == "Mt. Moon Exit" then
      moveToMap("Route 4")
    elseif getMapName() == "Route 4" then
      moveToMap("Cerulean City")
    end
    
  end
end
