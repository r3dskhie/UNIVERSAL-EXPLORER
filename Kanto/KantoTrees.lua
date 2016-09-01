	
	if getMapName() == "Pallet Town" then
  		if isNpcOnCell(28, 22) then
			pushDialogAnswer(5)
			log("---Headbutting first tree---")
  			return talkToNpcOnCell(28, 22)	--Tree 1
  		elseif isNpcOnCell(27, 16) then
			pushDialogAnswer(5)
			log("----Headbutting second tree---")
			return talkToNpcOnCell(27, 16)	--Tree 2
		elseif isNpcOnCell(20, 7) then
			pushDialogAnswer(5)
			log("----Headbutting third tree---")
			return talkToNpcOnCell(20, 7)	--Tree 3
		elseif isNpcOnCell(8, 5) then
			pushDialogAnswer(5)
			log("----Headbutting fourth tree---")
			return talkToNpcOnCell(8, 5)	--Tree 4
		elseif isNpcOnCell(4, 7) then
			pushDialogAnswer(5)
			log("----Headbutting fifth tree---")
			return talkToNpcOnCell(4, 7)	--Tree 5
	  	elseif isNpcOnCell(13, 17) then
			pushDialogAnswer(5)
			log("----Headbutting sixth tree---")
			return talkToNpcOnCell(13, 17)	--Tree 6
		else
			log("---"..getMapName().." Cleared... Moving to next Map---")
			Destination()
  		end
	elseif getMapName() == "Viridian Forest" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 6
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 7
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 8
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 9
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 10
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 11
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 12
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 13
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 14
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 15
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 16
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 17
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 18
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 19
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 20
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 21
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 22
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 23
  		end
 	elseif getMapName() == "Viridian City" then
 		if isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 6
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 7
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 8
  		end
	elseif getMapName() == "Pewter City" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(x, y)	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(x, y)	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(x, y)	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 6
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 7
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 8
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 9
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 10
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 11
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 12
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 13
  		end
	elseif getMapName() == "Lavender Town" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		end
	elseif getMapName() == "Cerulean City" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 6
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 7
		end
	elseif getMapName() == "Route 1" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 7
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 6
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 8
  		end
	elseif getMapName() == "Route 2" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 7
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 6
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 8
  		end
	elseif getMapName() == "Route 3" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
  		end
	elseif getMapName() == "Route 4" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
  		end
	elseif getMapName() == "Route 7" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 6
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 7
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 8
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 9
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 10
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 11
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 12
		end
	elseif getMapName() == "Route 8" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 6
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 7
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 8
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 9
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 10
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 11
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 12
		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 13
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 14
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 15
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 16
		end
	elseif getMapName() == "Route 11" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 6
  		end
	elseif getMapName() == "Route 13" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 6
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 7
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 8
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 9
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 10
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 11
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 12
		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 13
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 14
	  	elseif isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 15
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 16
		end
	elseif getMapName() == "Route 14" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	end
	elseif getMapName() == "Route 15" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	end
	elseif getMapName() == "Route 22" then
		if isNpcOnCell() then
  			return talkToNpcOnCell(, )	--Tree 1
  		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 2
		elseif isNpcOnCell(, ) then
			return talkToNpcOnCell(, )	--Tree 3
  		elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 4
	  	elseif isNpcOnCell(, ) then
	  		return talkToNpcOnCell(, )	--Tree 5
	  	end
	 end
