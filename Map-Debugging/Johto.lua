

mount = "Arcanine Mount"
digger = 4
butter = 5


function onStart() 
	digcount = 0
	hbuttcount = 0
	y = 0
	a = 1
	b = 0
	c = 0
	pc = 0
end

function onPause()
	log("b"..b)

end
function onBattleAction()
	run()
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
	elseif getMapName() == "Route 22" then
		Route22()
	elseif getMapName() == "Pokemon League Reception Gate" then
		moveToMap("Route 26")
	elseif getMapName() == "Route 26" then
	    Route26()
		moveToCell(0,106)
	elseif getMapName() == "Route 27" then
		return moveToCell(74,14) or moveToMap("New Bark Town")
	elseif getMapName() == "Tohjo Falls" then
		moveToCell(23,32)
	elseif getMapName() == "New Bark Town" then
		moveToMap("Route 29")
	elseif getMapName() == "Route 29" then
		moveToMap("Cherrygrove City")
	elseif getMapName() == "Pokecenter Cherrygrove" then
		log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
		moveToMap("Cherrygrove City")
	elseif getMapName() == "Cherrygrove City" then
		moveToMap("Route 30")
	elseif getMapName() == "Route 30" then
		moveToMap("Route 31")
	elseif getMapName() == "Route 31" then
		if c == 0 then
			moveToCell(50,10)
		elseif c == 1 then
			moveToMap("Violet City Stop House")
		end
	elseif getMapName() == "Dark Cave South" then
		c = 1
		moveToCell(15,35)
	elseif getMapName() == "Violet City Stop House" then
		moveToMap("Violet City")
	elseif getMapName() == "Violet City" then
		moveToMap("Route 32")
	elseif getMapName() == "Route 32" then
		talkToNpcOnCell(10,143)
	elseif getMapName() == "Route 33" then
		moveToMap("Azalea Town")
	elseif getMapName() == "Azalea Town" then
		if a == 1 then
			moveToMap("Slowpoke Well")
		elseif a == 0 then
			moveToMap("Ilex Forest Stop House")
		end
	elseif getMapName() == "Slowpoke Well" then
		if a == 1 then
			moveToMap("Slowpoke Well L1")
		elseif a == 0 then
			moveToMap("Azalea Town")
		end
	elseif getMapName() == "Slowpoke Well L1" then
		a = 0
		moveToMap("Slowpoke Well")
	elseif getMapName() == "Ilex Forest Stop House" then
		moveToMap("Ilex Forest")
	elseif getMapName() == "Ilex Forest" then
		moveToMap("Route 34 Stop House")
	elseif getMapName() == "Route 34 Stop House" then
		moveToMap("Route 34")
	elseif getMapName() == "Route 34" then
		moveToMap("Goldenrod City")
	elseif getMapName() == "Goldenrod City" then
		moveToMap("Route 35 Stop House")
	elseif getMapName() == "Route 35 Stop House" then
		moveToMap("Route 35")
	elseif getMapName() == "Route 35" then
		moveToMap("Route 36")
	elseif getMapName() == "Route 36" then
		moveToMap("Route 37")
	elseif getMapName() == "Route 37" then
		moveToMap("Ecruteak City")
	elseif getMapName() == "Ecruteak City" then
		if b == 0 then
			moveToMap("Ecruteak Stop House 2")
		elseif b == 1 then
			moveToMap("Ecruteak Stop House 1")
		end
	elseif getMapName() == "Ecruteak Stop House 2" then
		if b == 0 then
			moveToMap("Route 42")
		elseif b == 1 then
			moveToMap("Ecruteak City")
		end
	elseif getMapName() == "Mt. Mortar 1F" then
		return moveToCell(34,35) or moveToCell(65,46)
	elseif getMapName() == "Mt. Mortar Lower Cave" then
		moveToCell(47,57)
	elseif getMapName() == "Route 42" then
		if b == 0 then
			return moveToMap("Mahogany Town") or moveToCell(17,13)
		elseif b == 1 then
			moveToMap("Ecruteak Stop House 2")
		end
	elseif getMapName() == "Mahogany Town" then
		if b == 0 then
			moveToMap("Route 44")
		elseif b == 1 then
			moveToMap("Route 42")
		end
	elseif getMapName() == "Route 44" then
		b = 1
		moveToMap("Mahogany Town")
	elseif getMapName() == "Ecruteak Stop House 1" then
		moveToMap("Route 38")
	elseif getMapName() == "Route 38" then
		moveToMap("Route 39")
	elseif getMapName() == "Route 39" then
		moveToMap("Olivine City")
	
	end

end

function Route22()
	if isNpcOnCell(54,15) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,15)	--Tree 1
	elseif isNpcOnCell(54,21) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,21)	--Tree 2
	elseif isNpcOnCell(46,18) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,18)	--Tree 3
	elseif isNpcOnCell(46,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,10)	--Tree 4
	elseif isNpcOnCell(41,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(41,10)	--Tree 5
	elseif isNpcOnCell(36,10) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(36,10)	--Tree 6
	elseif isNpcOnCell(41,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(41,21)	--Tree 7
	elseif isNpcOnCell(44,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(44,20)	--Tree 8
	elseif isNpcOnCell(19,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,13)	--Tree 9
	elseif isNpcOnCell(19,7) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,7)	--Tree 10
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Pokemon League Reception Gate")
	end
end
function Route22()
	if isNpcOnCell(54,15) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,15)	--Tree 1
	elseif isNpcOnCell(54,21) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,21)	--Tree 2
	elseif isNpcOnCell(46,18) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,18)	--Tree 3
	elseif isNpcOnCell(46,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,10)	--Tree 4
	elseif isNpcOnCell(41,10) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(41,10)	--Tree 5
	elseif isNpcOnCell(36,10) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(36,10)	--Tree 6
	elseif isNpcOnCell(41,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(41,21)	--Tree 7
	elseif isNpcOnCell(44,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(44,20)	--Tree 8
	elseif isNpcOnCell(19,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,13)	--Tree 9
	elseif isNpcOnCell(19,7) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,7)	--Tree 10
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Pokemon League Reception Gate")
	end
end
