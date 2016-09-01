

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pallet Town" then
  			if isNpcOnCell(28, 22) then
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(28, 22)	--Tree 1
			elseif isNpcOnCell(27, 16) then
			log("----Headbutting 2nd tree---")
				return talkToNpcOnCell(27, 16)	--Tree 2
			elseif isNpcOnCell(20, 7) then
			log("----Headbutting 3rd tree---")
				return talkToNpcOnCell(20, 7)	--Tree 3
			elseif isNpcOnCell(8, 5) then
			log("----Headbutting 4th tree---")
				return talkToNpcOnCell(8, 5)	--Tree 4
			elseif isNpcOnCell(4, 7) then
			log("----Headbutting 5th tree---")
				return talkToNpcOnCell(4, 7)	--Tree 5
			elseif isNpcOnCell(13, 17) then
			log("----Headbutting Last tree---")
				return talkToNpcOnCell(13, 17)	--Tree 6
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 1")
			end
    elseif getMapName() == "Route 1" then
      moveToMap("Viridian City")
    elseif getMapName() == "Viridian City" then
      moveToMap("Route 2")
    elseif getMapName() == "2" then
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
