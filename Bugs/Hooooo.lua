
function onPathAction()
  if isPokemonUsable(1)
    if getMapName() == "Lilycove City" then
        moveToMap("Route 121")
    elseif getMapName() == "Route 121" then
        moveToMap("Route 120")
    elseif getMapName() == "120" then
        moveToMap("Fortree City")
    elseif getMapName() == "Fortree City" then
        moveToMap("Route 119A")
    elseif getMapName() == "Route 119A" then
        talkToNpcOnCell(16,68)
    elseif getMapName() == "Natural Site" then
        moveToCell(6,7)
    elseif getMapName() == "Route 119A" then
        moveToMap("Route 119B")
    elseif getMapName() == "Route 119B" then
        moveToMap("Route 118")
  end
