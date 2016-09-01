
dofile "Kanto"
dofile "Johto"

local trees = Kanto

function Kantrees()
for _,trees in pairs(trees) do
  if trees == isNpcOnCell() then
    	talkToNpcOnCell(trees)
    break
  end
end
end

funtion onPathAction()
  if isPokemonUsable(1) then
    if getMapName() == "Cerulean City" then
      return Kantrees() or moveToMap("Route 4")
    end
  end
end
