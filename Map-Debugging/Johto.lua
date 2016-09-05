

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
	elseif getMapName() == "Route 27" then
		Route27()
	elseif getMapName() == "Tohjo Falls" then
		moveToCell(23,32)
	elseif getMapName() == "New Bark Town" then
		moveToMap("Route 29")
	elseif getMapName() == "Route 29" then
		Route29()
	elseif getMapName() == "Pokecenter Cherrygrove" then
		log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
		moveToMap("Cherrygrove City")
	elseif getMapName() == "Cherrygrove City" then
		if pc == 0 then
			Cherry()
		elseif pc == 1 then
		log("---"..getMapName().." Cleared... Moving to next Map---")
			moveToMap("Route 30")
		end
	elseif getMapName() == "Route 30" then
		pc = 0
		Route30()
	elseif getMapName() == "Route 31" then
		if c == 0 then
			Route31()
		elseif c == 1 then
			moveToMap("Violet City Stop House")
		end
	elseif getMapName() == "Dark Cave South" then
		c = 1
		DarkSouth()
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
function Route26()
	if isNpcOnCell(22,13) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,13)	--Tree 11
	elseif isNpcOnCell(11,16) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(11,16)	--Tree 12
	elseif isNpcOnCell(28,49) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(28,49)	--Tree 13
	elseif isNpcOnCell(25,49) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(25,49)	--Tree 14
	elseif isNpcOnCell(22,49) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,49)	--Tree 15
	elseif isNpcOnCell(20,49) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,49)	--Tree 16
	elseif isNpcOnCell(30,80) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,80)	--Tree 17
	elseif isNpcOnCell(23,84) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(23,84)	--Tree 18
	elseif isNpcOnCell(20,84) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(20,84)	--Tree 19
	elseif isNpcOnCell(17,85) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(17,85)	--Tree 20
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToCell(0,106)
	end
end
function Route27()
	if isNpcOnCell(207,16) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(207,16)	--Tree 21
	elseif isNpcOnCell(203,17) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(203,17)	--Tree 22
	elseif isNpcOnCell(172,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(172,21)	--Tree 23
	elseif isNpcOnCell(108,14) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(108,14)	--Tree 24
	elseif isNpcOnCell(105,14) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(105,14)	--Tree 25
	elseif isNpcOnCell(103,14) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(103,14)	--Tree 26
	elseif isNpcOnCell(96,16) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(96,16)	--Tree 27
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		return moveToCell(74,14) or moveToMap("New Bark Town")
	end
end
function Route29()
	if isNpcOnCell(95,13) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(95,13)
	elseif isNpcOnCell(84,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(84,13)
	elseif isNpcOnCell(67,26) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(67,26)
	elseif isNpcOnCell(38,25) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(38,25)
	elseif isNpcOnCell(43,24) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(43,24)
	elseif isNpcOnCell(46,24) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,24)
	elseif isNpcOnCell(50,25) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(50,25)
	elseif isNpcOnCell(55,19) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(55,19)
	elseif isNpcOnCell(67,18) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(67,18)
	elseif isNpcOnCell(58,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(58,13)
	elseif isNpcOnCell(39,17) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(39,17)
	elseif isNpcOnCell(38,22) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(38,22
	elseif isNpcOnCell(27,9) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,9)
	elseif isNpcOnCell(18,12) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(18,12)
	elseif isNpcOnCell(15,18) then
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(15,18)
	elseif isNpcOnCell(10,15) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(10,15)
	else
	log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Cherrygrove City")
end
function Cherry()
	if isNpcOnCell(46,7) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,7)
	elseif isNpcOnCell(44,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(44,20)
	elseif isNpcOnCell(34,21) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(34,21)
	elseif isNpcOnCell(27,13) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,13)
	elseif isNpcOnCell(32,8) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,8)
	else
		log("--- Pokecenter found! Registering on PC ---")
		moveToMap("Pokecenter Cherrygrove")
		pc = pc + 1
	end
end
function Route30()
	if isNpcOnCell(15,94) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(15,94)
	elseif isNpcOnCell(17,93) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(17,93)
	elseif isNpcOnCell(19,91) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(19,91)
	elseif isNpcOnCell(30,86) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,86)
	elseif isNpcOnCell(25,83) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(25,83)
	elseif isNpcOnCell(23,78) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(23,78)
	elseif isNpcOnCell(24,70) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(24,70)
	elseif isNpcOnCell(30,71) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(30,71)
	elseif isNpcOnCell(32,73) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,73)
	elseif isNpcOnCell(7,68) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(7,68)
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToMap("Route 31")
	end
end
function Route31()
	if isNpcOnCell(46,26) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(46,26)
	elseif isNpcOnCell(42,23) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(42,23)
	elseif isNpcOnCell(45,19) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(45,19)
	elseif isNpcOnCell(54,14) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(54,14)
	elseif isNpcOnCell(35,15) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(35,15)
	elseif isNpcOnCell(22,11) then			
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(22,11)
	elseif isNpcOnCell(27,5) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,5)
	elseif isNpcOnCell(32,5) then	
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(32,5)
	elseif isNpcOnCell(27,11) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(27,11)
	elseif isNpcOnCell(18,20) then		
	log("---Headbutting tree no."..hbuttcount.." ---")
		return talkToNpcOnCell(18,20)
	elseif isNpcOnCell(24,15) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(24,15)	--Berry 1
	elseif isNpcOnCell(25,15) then
		log("---Ooops! We have some berries that are ready to harvest---")
		log("---Harvesting some berries---")
		return talkToNpcOnCell(25,15)	--Berry 2
	else
		log("---"..getMapName().." Cleared... Moving to next Map---")
		moveToCell(50,10)
	end
end
function DarkSouth()
	if isNpcOnCell(49,30) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(49,30)	--Dig 1
	elseif isNpcOnCell(49,35) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(49,35)	--Dig 2
	elseif isNpcOnCell(64,39) then
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(64,39)	--Dig 3
	elseif isNpcOnCell(55,38) then	
		log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
		return talkToNpcOnCell(55,38)	--Dig 4
	else
		log("--- No dig spots available! "..getMapName().." Cleared... Moving to next Map---")
		moveToCell(15,35)
	end
end
