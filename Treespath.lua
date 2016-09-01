function ResetPath()
	PathDestStore = ""
end

function MoveTo(Destination)
	if PathDestStore == Destination then
		MoveWithCalcPath()	
	else
		if not moveToDestination(getMapName(), Destination) == false then
			PathSolution = moveToDestination(getMapName(), Destination)
			PathDestStore = Destination
			for i=0,15 do
			EditPathGenerated()
			end
			log("Percorso: " .. table.concat(PathSolution,"->"))
			MoveWithCalcPath()	
		else
			fatal("Path Not Found ERROR")
		end
	end
end

function MoveWithCalcPath()
	if tablelength(PathSolution) > 0 then	
		if PathSolution[1] == getMapName() then
			table.remove(PathSolution, 1)
			if tablelength(PathSolution) > 0 then
				MovingApply(PathSolution[1])
			end
		else
			MovingApply(PathSolution[1])
		end
	else
		return true
	end	
end

function MovingApply(ToMap)
	if CheckException(getMapName() .. "_to_" .. PathSolution[1]) == true then
		return
	else
		log1time("Maps Remains: " .. tablelength(PathSolution) .. "  Moving To: --> " .. PathSolution[1])	
		if moveToMap(ToMap) == true then
			return
		else
			ResetPath()
			log1time("Error in Path - Reset and Recalc")
			swapPokemon(getTeamSize(), getTeamSize()-1)
		end
	end
end

function moveToDestination(currentPosition, finalPosition)
	--local path = getShortestPath(KantoMap, currentPosition, finalPosition, {})
	local path = initDij(currentPosition, finalPosition, KantoMap)
	if tablelength(path) == 0 then
		return false
	else
		return path
	end	
end
