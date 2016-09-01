function moveToDestination(currentPosition, finalPosition)
	--local path = getShortestPath(KantoMap, currentPosition, finalPosition, {})
	local path = initDij(currentPosition, finalPosition, KantoMap)
	if tablelength(path) == 0 then
		return false
	else
		return path
	end	
end
