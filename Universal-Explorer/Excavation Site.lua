				-- Copyright © 2016 redskhie 
				-- Official github link:
				-- Official PROShine thread: https://proshine-bot.com/thread-1246.html
				-- Contact me at discord nickname: Redd

name = "Super Saiyan God"
author = "--redskhie--"
description = [[---This script will smash on all Excavation Sites---]]

dofile "Config.lua"

function onStart()
    ex = backupCount
    smash = 1
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT in Excavation Site in case the bot DISCONNECTED---")
	log("--- Enter your BACK-UP COUNT if your disconnected in the middle of Hunting Sites ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end
function onPause()
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Debug count: "..ex)
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- You smashed "..smash.." fools in all sites!!! ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end
function onStop()

end
function IsPokemonOnCaptureList()
    result = false
    if catchList[1] ~= "" then
    for i = 1, TableLength(catchList), 1 do
        if getOpponentName() == catchList[i] then
            result = true
            break
        end
    end
    end
    return result
end
function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function onBattleAction()
	if isWildBattle() and ((catchShiny and isOpponentShiny()) or (catchUncaught and not isAlreadyCaught()) or IsPokemonOnCaptureList()) then
		if fswipeOn then
           	log("-------- Commencing False Swipe --------")
            		fswipe()
        	elseif sleepOn then
            	log("-------- Commencing Sleep Move --------")
            		sleep()
        	elseif advanceCatchOn then
            	log("-------- Commencing False Swipe with Sleep Move --------")
            		advanceCatch()
        	elseif normalCatchOn then
            	log("-------- Starting to throw Pokeballs --------")
            		normal()  
		end 
	else
		return run() or sendPokemon(3) or sendAnyPokemon() or attack()
	end
end
function onPathAction()
  if not isMounted() and hasItem(mount) and not isSurfing() and isOutside() then
		log("---------------------------")
		log("~~~ Riding on my pet!!! ~~~")
		log("---------------------------")
		return useItem(mount)
  elseif isPokemonUsable(1) then
    
    if getMapName() == "Lilycove City" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- We are now in Hoenn Region! ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Route 121")
    elseif getMapName() == "Route 121" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        if ex == 0 then
            moveToMap("Route 120")      --Move to next Site
        elseif ex == 6 then
            moveToMap("Lilycove City")  --End
        end
    elseif getMapName() == "Route 120" then
        if ex == 0 then
            moveToMap("Fortree City")   --Move to next Site
        elseif ex == 6 then
            moveToMap("Route 121")      --End
        end
    elseif getMapName() == "Fortree City" then
        if ex == 0 then
            moveToMap("Route 119A")     --Move to next Site
        elseif ex == 6 then
            moveToMap("Route 120")      --End
        end
    elseif getMapName() == "Route 119A" then
        if ex == 0 then
            log("Info| We are now entering Natural Site!")
            talkToNpcOnCell(16,68)      --Move to Natural Site
        elseif ex == 1 then
            log("-- Update | Backup count = "..ex)
            moveToMap("Route 119B")     --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Fortree City")   --End
        end
    elseif getMapName() == "Natural Site" then
        Natural()
    elseif getMapName() == "Route 119B" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        if ex == 1 then
            moveToMap("Route 118")      --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 119A")     --End
        end
    elseif getMapName() == "Route 118" then
        if ex == 1 then
            moveToMap("Mauville City Stop House 4")     --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 119B")                     --End
        end
    elseif getMapName() == "Mauville City Stop House 4" then
        if ex == 1 then
            moveToMap("Mauville City")                  --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 118")                     --End
        end
    elseif getMapName() == "Mauville City" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        if ex == 1 then
            moveToMap("Mauville City Stop House 1")     --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City Stop House 3")     --Move to 3rd Site
        elseif ex == 6 then
            moveToMap("Mauville City Stop House 4")     --End
        end
    elseif getMapName() == "Mauville City Stop House 1" then
        if ex == 1 then
            moveToMap("Route 110")                      --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City")                  --Move to 3rd Site
        end
    elseif getMapName() == "Route 110" then
        if ex == 1 then
            moveToMap("Route 103")                      --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City Stop House 1")     --Move to 3rd Site
        end
    elseif getMapName() == "Route 103" then
        if ex == 1 then
            log("-- Info| We are now entering Glacial Site! --")
            talkToNpcOnCell(55,4)                       --Glacial Site 2nd
        elseif ex == 2 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Route 110")                      --Move to 3rd Site
        end
    elseif getMapName() == "Glacial Site" then
        Glacial()
    elseif getMapName() == "Mauville City Stop House 3" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Route 111 South")                --Move to 3rd Site
    elseif getMapName() == "Route 111 South" then
        if ex == 2 then
            moveToMap("Route 112")                      --Move to 3rd Site
        elseif ex == 3 then
            moveToCell(20,7)               --Move to 4th Site
        end
    elseif getMapName() == "Route 112" then
        if ex == 2 then
            moveToMap("Fiery Path")                     --Move to 3rd Site
        elseif ex == 3 then
            return moveToMap("Route 111 North") or moveToMap("Route 111 South")                --Move to 4th Site
        end
    elseif getMapName() == "Fiery Path" then
        if ex == 2 then
            log("-- Info| We are now entering Feral Site! --")
            talkToNpcOnCell(14,32)                      --Feral Site 3rd
        elseif ex == 3 then
            log("-- Update| Backup count = "..ex)
            moveToCell(36,48)                      --Move to 4th Site
        end
    elseif getMapName() == "Feral Site" then
        Feral()
    elseif getMapName() == "Route 111 Desert" then
        if ex == 3 then
            log("-- Info| We are now entering Historical Site! --")
            return talkToNpc("Gingery Jones")                     --Historical Site 4th
        elseif ex == 4 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Route 111 North")                --Move to 5th Site
        end
    elseif getMapName() == "Historical Site" then
        Historical()
    elseif getMapName() == "Route 111 North" then
	if ex == 3 then
		moveToMap("Route 111 Desert")
	elseif ex == 4 then
        	moveToMap("Route 113")                      --Move to 5th Site
	end
    elseif getMapName() == "Route 113" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Fallarbor Town")                 --Move to 5th Site
    elseif getMapName() == "Fallarbor Town" then
        moveToMap("Route 114")                      --Move to 5th Site
    elseif getMapName() == "Route 114" then
        moveToMap("Meteor Falls 1F 1R")             --Move to 5th Site
    elseif getMapName() == "Meteor falls 1F 1R" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Route 115")                      --Move to 5th Site
    elseif getMapName() == "Route 115" then
        if ex == 4 then
            log("-- Info| We are now entering Mineral Site! --")
            talkToNpcOnCell(81,78)                      --Mineral Site 5th
        elseif ex == 5 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Rustboro City")                  --Move to last Site
        end
    elseif getMapName() == "Mineral Site" then
        Mineral()
    elseif getMapName() == "Rustboro City" then
        moveToMap("Route 116")                      --Move to last Site
    elseif getMapName() == "Route 116" then
        moveToMap("Rusturf Tunnel")                 --Move to last Site
    elseif getMapName() == "Rusturf Tunnel" then
        if ex == 5 then
            log("-- Info| We are now entering Haunted Site! --")
            talkToNpc("Gingery Jones")                      --Haunted Site Last
        elseif ex == 6 then
            log("-- Update| Backup count = "..ex)
            log("-- Warning!!! No Site to Smash!!! Going back to starting map... --")
            moveToMap("Verdanturf Town")                --End
        end
    elseif getMapName() == "Haunted Site" then
        Haunted()
    elseif getMapName() == "Verdanturf Town" then
        moveToMap("Route 117")                      --End
    elseif getMapName() == "Route 117" then
        moveToMap("Mauville City Stop House 2")     --End
    elseif getMapName() == "Mauville City Stop House 2" then
        moveToMap("Mauville City")                  --End     
    end
  end
end
function Natural()
	if isNpcOnCell(4,8) then	

		 talkToNpcOnCell(4,8)
		smash = smash + 1/2
	elseif isNpcOnCell(7,6) then		
	
		 talkToNpcOnCell(7,6)
		smash = smash + 1/2
	elseif isNpcOnCell(11,4) then		
	
		 talkToNpcOnCell(11,4)
		smash = smash + 1/2
	elseif isNpcOnCell(12,3) then			
	
		 talkToNpcOnCell(12,3)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(17,1) then		
	
		 talkToNpcOnCell(17,1)
		smash = smash + 1/2
	elseif isNpcOnCell(16,2) then	
	
		 talkToNpcOnCell(16,2)
		smash = smash + 1/2
	elseif isNpcOnCell(18,3) then		
	
		 talkToNpcOnCell(18,3)
		smash = smash + 1/2
	elseif isNpcOnCell(16,8) then		
	
		 talkToNpcOnCell(16,8)
		smash = smash + 1/2
	elseif isNpcOnCell(20,5) then			
	
		 talkToNpcOnCell(20,5)
		smash = smash + 1/2
	elseif isNpcOnCell(22,7) then		
	
		 talkToNpcOnCell(22,7)
		smash = smash + 1/2
	elseif isNpcOnCell(22,4) then		
	
		 talkToNpcOnCell(22,4)
		smash = smash + 1/2
	elseif isNpcOnCell(20,10) then	
	
		 talkToNpcOnCell(20,10)
		smash = smash + 1/2
	elseif isNpcOnCell(20,15) then		
	
		 talkToNpcOnCell(20,15)
		smash = smash + 1/2
	elseif isNpcOnCell(15,13) then		
	
		 talkToNpcOnCell(15,13)
		smash = smash + 1/2
	elseif isNpcOnCell(12,17) then			
	
		 talkToNpcOnCell(12,17)
		smash = smash + 1/2
	elseif isNpcOnCell(7,17) then		
	
		 talkToNpcOnCell(7,17)
		smash = smash + 1/2
	elseif isNpcOnCell(6,11) then		
	
		 talkToNpcOnCell(6,11)
		smash = smash + 1/2
	elseif isNpcOnCell(4,11) then		
	
		 talkToNpcOnCell(4,11)
		smash = smash + 1/2
	elseif isNpcOnCell(16,17) then		
	
		 talkToNpcOnCell(16,17)
		smash = smash + 1/2
	elseif isNpcOnCell(17,14) then			
	
		 talkToNpcOnCell(17,14)
		smash = smash + 1/2
	elseif isNpcOnCell(18,16) then		
	
		 talkToNpcOnCell(18,16)
		smash = smash + 1/2
	elseif isNpcOnCell(24,18) then		
	
		 talkToNpcOnCell(24,18)
		smash = smash + 1/2
	
	elseif isNpcOnCell(24,16) then		
	
		 talkToNpcOnCell(24,16)
		smash = smash + 1/2
		
	
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(6,7)             --Done Site
        	ex = ex + 1
        end
end
function Glacial()
	if isNpcOnCell(2,11) then	
	
		 talkToNpcOnCell(2,11)
		smash = smash + 1/2
	elseif isNpcOnCell(3,13) then		
	
		 talkToNpcOnCell(3,13)
		smash = smash + 1/2
	elseif isNpcOnCell(8,3) then		
	
		 talkToNpcOnCell(8,3)
		smash = smash + 1/2
	elseif isNpcOnCell(12,4) then			
	
		 talkToNpcOnCell(12,4)
		smash = smash + 1/2
	elseif isNpcOnCell(14,1) then		
	
		 talkToNpcOnCell(14,1)
		smash = smash + 1/2
	elseif isNpcOnCell(19,1) then		
	
		 talkToNpcOnCell(19,1)
		smash = smash + 1/2
	elseif isNpcOnCell(18,3) then	
	
		 talkToNpcOnCell(18,3)
		smash = smash + 1/2
	elseif isNpcOnCell(21,4) then		
	
		 talkToNpcOnCell(21,4)
		smash = smash + 1/2
	elseif isNpcOnCell(21,8) then		
	
		 talkToNpcOnCell(21,8)
		smash = smash + 1/2
	elseif isNpcOnCell(17,9) then			
	
		 talkToNpcOnCell(17,9)
		smash = smash + 1/2
	elseif isNpcOnCell(23,5) then		
	
		 talkToNpcOnCell(23,5)
		smash = smash + 1/2
	elseif isNpcOnCell(25,4) then		
	
		 talkToNpcOnCell(25,4)
		smash = smash + 1/2
	elseif isNpcOnCell(25,1) then	
	
		 talkToNpcOnCell(25,1)
		smash = smash + 1/2
	elseif isNpcOnCell(19,14) then		
	
		 talkToNpcOnCell(19,14)
		smash = smash + 1/2
	elseif isNpcOnCell(20,16) then		
	
		 talkToNpcOnCell(20,16)
		smash = smash + 1/2
	elseif isNpcOnCell(25,11) then			
	
		 talkToNpcOnCell(25,11)
		smash = smash + 1/2
	elseif isNpcOnCell(19,17) then		
	
		 talkToNpcOnCell(19,17)
		smash = smash + 1/2
	elseif isNpcOnCell(10,18) then		
	
		 talkToNpcOnCell(10,18)
		smash = smash + 1/2
	elseif isNpcOnCell(9,16) then		
	
		 talkToNpcOnCell(9,16)
		smash = smash + 1/2
	elseif isNpcOnCell(4,18) then		
	
		 talkToNpcOnCell(4,18)
		smash = smash + 1/2
	elseif isNpcOnCell(15,14) then			
	
		 talkToNpcOnCell(15,14)
		smash = smash + 1/2
	elseif isNpcOnCell(13,16) then		
	
		 talkToNpcOnCell(13,16)
		smash = smash + 1/2
	elseif isNpcOnCell(13,11) then		
	
		 talkToNpcOnCell(13,11)
		smash = smash + 1/2
	elseif isNpcOnCell(8,14) then		
	
		 talkToNpcOnCell(8,14)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(5,5)                             --Done Site
        	ex = ex + 1
        end
end
function Feral()
	if isNpcOnCell(3,7) then	
	
		 talkToNpcOnCell(3,7)
		smash = smash + 1/2
	elseif isNpcOnCell(4,5) then		
	
		 talkToNpcOnCell(4,5)
		smash = smash + 1/2
	elseif isNpcOnCell(6,12) then		
	
		 talkToNpcOnCell(6,12)
		smash = smash + 1/2
	elseif isNpcOnCell(3,16) then			
	
		 talkToNpcOnCell(3,16)
		smash = smash + 1/2
	elseif isNpcOnCell(11,11) then		
	
		 talkToNpcOnCell(11,11)
		smash = smash + 1/2
	elseif isNpcOnCell(1,16) then		
		
		 return talkToNpcOnCell(1,16) or moveToCell(8,15)
		
	elseif isNpcOnCell(2,18) then	
	
		 talkToNpcOnCell(2,18)
		smash = smash + 1/2
	elseif isNpcOnCell(12,17) then		
	
		 talkToNpcOnCell(12,17)
		smash = smash + 1/2
	elseif isNpcOnCell(15,17) then		
	
		 talkToNpcOnCell(15,17)
		smash = smash + 1/2
	elseif isNpcOnCell(18,15) then			
	
		 talkToNpcOnCell(18,15)
		smash = smash + 1/2
	elseif isNpcOnCell(25,18) then		
	
		 talkToNpcOnCell(25,18)
		smash = smash + 1/2
	elseif isNpcOnCell(15,15) then		
	
		 return talkToNpcOnCell(15,15) or moveToCell(8,17)
		
	elseif isNpcOnCell(21,15) then	
	
		 talkToNpcOnCell(21,15)
		smash = smash + 1/2
	elseif isNpcOnCell(22,16) then		
	
		 talkToNpcOnCell(22,16)
		smash = smash + 1/2
	elseif isNpcOnCell(24,14) then		
	
		 talkToNpcOnCell(24,14)
		smash = smash + 1/2
	elseif isNpcOnCell(22,11) then			
	
		 talkToNpcOnCell(22,11)
		smash = smash + 1/2
	elseif isNpcOnCell(21,8) then		
	
		 talkToNpcOnCell(21,8)
		smash = smash + 1/2
	elseif isNpcOnCell(21,6) then		
	
		 talkToNpcOnCell(21,6)
		smash = smash + 1/2
	elseif isNpcOnCell(19,4) then		
	
		 talkToNpcOnCell(19,4)
		smash = smash + 1/2
	elseif isNpcOnCell(18,4) then		
	
		 talkToNpcOnCell(18,4)
		smash = smash + 1/2
	elseif isNpcOnCell(7,1) then		
	
		 talkToNpcOnCell(7,1)
		smash = smash + 1/2
	elseif isNpcOnCell(12,3) then			
	
		 talkToNpcOnCell(12,3)
		smash = smash + 1/2
	elseif isNpcOnCell(12,2) then		
	
		 talkToNpcOnCell(12,2)
		smash = smash + 1/2
	elseif isNpcOnCell(6,4) then		
	
		 talkToNpcOnCell(6,4)
		smash = smash + 1/2
	elseif isNpcOnCell(9,5) then		
	
		 talkToNpcOnCell(9,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(5,7)                             --Done Site
        	ex = ex + 1
        end
end
function Mineral()
	if isNpcOnCell(7,7) then	
	
		 talkToNpcOnCell(7,7)
		smash = smash + 1/2
	elseif isNpcOnCell(9,8) then		
	
		 talkToNpcOnCell(9,8)
		smash = smash + 1/2
	elseif isNpcOnCell(5,9) then		
	
		 talkToNpcOnCell(5,9)
		smash = smash + 1/2
	elseif isNpcOnCell(7,10) then			
	
		 talkToNpcOnCell(7,10)
		smash = smash + 1/2
	elseif isNpcOnCell(3,11) then		
	
		 talkToNpcOnCell(3,11)
		smash = smash + 1/2
	elseif isNpcOnCell(5,13) then		
	
		 talkToNpcOnCell(5,13)
		smash = smash + 1/2
	elseif isNpcOnCell(3,16) then	
	
		 talkToNpcOnCell(3,16)
		smash = smash + 1/2
	elseif isNpcOnCell(11,11) then		
	
		 talkToNpcOnCell(11,11)
		smash = smash + 1/2
	elseif isNpcOnCell(10,13) then		
	
		 talkToNpcOnCell(10,13)
		smash = smash + 1/2
	elseif isNpcOnCell(15,12) then			
	
		 talkToNpcOnCell(15,12)
		smash = smash + 1/2
	elseif isNpcOnCell(14,15) then		
	
		 talkToNpcOnCell(14,15)
		smash = smash + 1/2
	elseif isNpcOnCell(5,17) then		
	
		 return talkToNpcOnCell(5,17) or moveToCell(11,15)
		
	elseif isNpcOnCell(6,18) then	
	
		 talkToNpcOnCell(6,18)
		smash = smash + 1/2
	elseif isNpcOnCell(8,18) then		
	
		 talkToNpcOnCell(8,18)
		smash = smash + 1/2
	elseif isNpcOnCell(25,16) then		
	
		 talkToNpcOnCell(25,16)
		smash = smash + 1/2
	elseif isNpcOnCell(23,18) then			
	
		 talkToNpcOnCell(23,18)
		smash = smash + 1/2
	elseif isNpcOnCell(20,18) then		
	
		 talkToNpcOnCell(20,18)
		smash = smash + 1/2
	elseif isNpcOnCell(23,11) then		
	
		 return talkToNpcOnCell(23,11) or moveToCell(11,17)
		
	elseif isNpcOnCell(23,7) then		
	
		 talkToNpcOnCell(23,7)
		smash = smash + 1/2
	elseif isNpcOnCell(22,6) then		
	
		 talkToNpcOnCell(22,6)
		smash = smash + 1/2
	elseif isNpcOnCell(7,3) then			
	
		 talkToNpcOnCell(7,3)
		smash = smash + 1/2
	elseif isNpcOnCell(21,2) then		
	
		 talkToNpcOnCell(21,2)
		smash = smash + 1/2
	elseif isNpcOnCell(20,2) then		
	
		 talkToNpcOnCell(20,2)
		smash = smash + 1/2
	elseif isNpcOnCell(11,5) then		
	
		 talkToNpcOnCell(11,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(9,6)                             --Done Site
        	ex = ex + 1
        end
end
function Historical()
	if isNpcOnCell(8,8) then	
	
		 talkToNpcOnCell(8,8)
		smash = smash + 1/2
	elseif isNpcOnCell(9,7) then		
	
		 talkToNpcOnCell(9,7)
		smash = smash + 1/2
	elseif isNpcOnCell(10,6) then		
	
		 talkToNpcOnCell(10,6)
		smash = smash + 1/2
	elseif isNpcOnCell(12,6) then			
	
		 talkToNpcOnCell(12,6)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(16,5) then		
	
		 talkToNpcOnCell(16,5)
		smash = smash + 1/2
	elseif isNpcOnCell(17,5) then	
	
		 talkToNpcOnCell(17,5)
		smash = smash + 1/2
	elseif isNpcOnCell(19,5) then		
	
		 talkToNpcOnCell(19,5)
		smash = smash + 1/2
	elseif isNpcOnCell(21,6) then		
	
		 talkToNpcOnCell(21,6)
		smash = smash + 1/2
	elseif isNpcOnCell(23,1) then			
	
		 talkToNpcOnCell(23,1)
		smash = smash + 1/2
	elseif isNpcOnCell(23,2) then			
	
		 talkToNpcOnCell(23,2)
		smash = smash + 1/2
	elseif isNpcOnCell(21,2) then		
	
		 talkToNpcOnCell(21,2) 
		smash = smash + 1/2
	elseif isNpcOnCell(22,17) then		
	
		 return talkToNpcOnCell(22,17) or moveToCell(21,14)
		
	elseif isNpcOnCell(19,17) then	
	
		 talkToNpcOnCell(19,17)
		smash = smash + 1/2
	elseif isNpcOnCell(17,13) then		
	
		 return talkToNpcOnCell(17,13) or moveToCell(20,15)
	elseif isNpcOnCell(15,13) then		
	
		 talkToNpcOnCell(15,13)
		smash = smash + 1/2
	elseif isNpcOnCell(13,14) then			
	
		 talkToNpcOnCell(13,14)
		smash = smash + 1/2
	elseif isNpcOnCell(11,14) then		
	
		 talkToNpcOnCell(11,14)
		smash = smash + 1/2
	elseif isNpcOnCell(10,15) then		
	
		 talkToNpcOnCell(10,15)
		smash = smash + 1/2
	elseif isNpcOnCell(8,15) then		
	
		 talkToNpcOnCell(8,15)
		smash = smash + 1/2
	elseif isNpcOnCell(5,15) then			
	
		 talkToNpcOnCell(5,15)
		smash = smash + 1/2
	
	elseif isNpcOnCell(3,15) then		
	
		 return talkToNpcOnCell(3,15) or moveToCell(2,12)
		
	elseif isNpcOnCell(1,16) then		
	
		  talkToNpcOnCell(1,16)
		smash = smash + 1/2
	elseif isNpcOnCell(6,12) then		
	
		 return talkToNpcOnCell(6,12) or moveToCell(2,14)
		

	else
		
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(2,8)                              --Done Site
		ex = ex + 1
        	
        end
end
function Haunted()
	if isNpcOnCell(1,8) then	
	
		 talkToNpcOnCell(1,8)
		smash = smash + 1/2
	elseif isNpcOnCell(2,11) then		
	
		 talkToNpcOnCell(2,11)
		smash = smash + 1/2
	elseif isNpcOnCell(4,16) then		
	
		 talkToNpcOnCell(4,16)
		smash = smash + 1/2
	elseif isNpcOnCell(9,14) then			
	
		 talkToNpcOnCell(9,14)
		smash = smash + 1/2
	elseif isNpcOnCell(11,14) then		
	
		 talkToNpcOnCell(11,14)
		smash = smash + 1/2
	elseif isNpcOnCell(15,14) then		
	
		 talkToNpcOnCell(15,14)
		smash = smash + 1/2
	elseif isNpcOnCell(17,14) then	
	
		 talkToNpcOnCell(17,14)
		smash = smash + 1/2
	elseif isNpcOnCell(21,14) then		
	
		 talkToNpcOnCell(21,14)
		smash = smash + 1/2
	elseif isNpcOnCell(20,11) then		
	
		 talkToNpcOnCell(20,11)
		smash = smash + 1/2
	elseif isNpcOnCell(16,11) then			
	
		 talkToNpcOnCell(16,11)
		smash = smash + 1/2
	elseif isNpcOnCell(14,11) then		
	
		 talkToNpcOnCell(14,11)
		smash = smash + 1/2
	elseif isNpcOnCell(12,11) then		
	
		 talkToNpcOnCell(12,11)
		smash = smash + 1/2
	elseif isNpcOnCell(8,11) then	
	
		 talkToNpcOnCell(8,11)
		smash = smash + 1/2
	elseif isNpcOnCell(7,8) then		
	
		 talkToNpcOnCell(7,8)
		smash = smash + 1/2
	elseif isNpcOnCell(9,8) then		
	
		 talkToNpcOnCell(9,8)
		smash = smash + 1/2
	elseif isNpcOnCell(11,8) then			
	
		 talkToNpcOnCell(11,8)
		smash = smash + 1/2
	elseif isNpcOnCell(13,8) then		
	
		 talkToNpcOnCell(13,8)
		smash = smash + 1/2
	elseif isNpcOnCell(15,8) then		
	
		 talkToNpcOnCell(15,8)
		smash = smash + 1/2
	elseif isNpcOnCell(17,8) then		
	
		 talkToNpcOnCell(17,8)
		smash = smash + 1/2
	elseif isNpcOnCell(16,5) then		
	
		 talkToNpcOnCell(16,5)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(12,5) then			
	
		 talkToNpcOnCell(12,5)
		smash = smash + 1/2
	elseif isNpcOnCell(8,5) then		
	
		 talkToNpcOnCell(8,5)
		smash = smash + 1/2
	elseif isNpcOnCell(6,5) then		
	
		 talkToNpcOnCell(6,5)
		smash = smash + 1/2
	elseif isNpcOnCell(4,5) then		
	
		 talkToNpcOnCell(4,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(3,8)                             --Done Site
        	ex = ex + 1
        end
end
function normal()
    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")  or sendAnyPokemon() or attack() or run()
end

function advanceCatch()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) and ( getOpponentHealth() == 1 ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() == 1 ) then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or attack() or run()
        else
                return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or attack() or run()
        end
end

function fswipe()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentHealth() == 1 then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")  or sendAnyPokemon() or attack() or run()
        end
end
function sleep()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or attack() or run()
        end    
end


