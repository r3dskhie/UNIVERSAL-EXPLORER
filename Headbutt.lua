
dofile "Kanto"

funtion onPathAction()

  if isPokemonUsable(1) then
    
    if getMapName() == then
    elseif getMapName() == "Pallet Town" then
      moveToMap("Route 1")
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
