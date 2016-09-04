
        backupCount = 0




function onStart()
    x = backupCount
end
function onBattleAction()
    run()
end
function onPathAction()
  if isPokemonUsable(1)
    if getMapName() == "Lilycove City" then
        moveToMap("Route 121")
    elseif getMapName() == "Route 121" then
        if x == 0 then
            moveToMap("Route 120")      --Move to next Site
        elseif x == 6 then
            moveToMap("Lilycove City")  --End
        end
    elseif getMapName() == "120" then
        if x == 0 then
            moveToMap("Fortree City")   --Move to next Site
        elseif x == 6 then
            moveToMap("Route 121")      --End
        end
    elseif getMapName() == "Fortree City" then
        if x == 0 then
            moveToMap("Route 119A")     --Move to next Site
        elseif x == 6 then
            moveToMap("Route 120")      --End
        end
    elseif getMapName() == "Route 119A" then
        if x == 0 then
            log("Info| We are now entering Natural Site!")
            talkToNpcOnCell(16,68)      --Move to Natural Site
        elseif x == 1 then
            log("-- Update | Backup count = "..x)
            moveToMap("Route 119B")     --Move to 2nd Site
        elseif x == 6 then
            moveToMap("Fortree City")   --End
        end
    elseif getMapName() == "Natural Site" then
        moveToCell(6,7)             --Done Site
        x = x + 1
    elseif getMapName() == "Route 119B" then
        if x == 1 then
            moveToMap("Route 118")      --Move to 2nd Site
        elseif x == 6 then
            moveToMap("Route 119A")     --End
        end
    elseif getMapName() == "Route 118" then
        if x == 1 then
            moveToMap("Mauville City Stop House 4")     --Move to 2nd Site
        elseif x == 6 then
            moveToMap("Route 119B")                     --End
        end
    elseif getMapName() == "Mauville City Stop House 4" then
        if x == 1 then
            moveToMap("Mauville City")                  --Move to 2nd Site
        elseif x == 6 then
            moveToMap("Route 118")                     --End
        end
    elseif getMapName() == "Mauville City" then
        if x == 1 then
            moveToMap("Mauville City Stop House 1")     --Move to 2nd Site
        elseif x == 2 then
            moveToMap("Mauville City Stop House 3")     --Move to 3rd Site
        elseif x == 6 then
            moveToMap("Mauville City Stop House 4")     --End
        end
    elseif getMapName() == "Mauville City Stop House 1" then
        if x == 1 then
            moveToMap("Route 110")                      --Move to 2nd Site
        elseif x == 2 then
            moveToMap("Mauville City")                  --Move to 3rd Site
        end
    elseif getMapName() == "Route 110" then
        if x == 1 then
            moveToMap("Route 103")                      --Move to 2nd Site
        elseif x == 2 then
            moveToMap("Mauville City Stop House 1")     --Move to 3rd Site
        end
    elseif getMapName() == "Route 103" then
        if x == 1 then
            log("-- Info| We are now entering Glacial Site! --")
            talkToNpcOnCell(55,4)                       --Glacial Site 2nd
        elseif x == 2 then
            log("-- Update| Backup count = "..x)
            moveToMap("Route 110")                      --Move to 3rd Site
        end
    elseif getMapName() == "Glacial Site" then
        moveToCell(5,5)                             --Done Site
        x = x + 1
    elseif getMapName() == "Mauville City Stop House 3" then
        moveToMap("Route 111 South")                --Move to 3rd Site
    elseif getMapName() == "Route 111 South" then
        if x == 2 then
            moveToMap("Route 112")                      --Move to 3rd Site
        elseif x == 3 then
            moveToMap("Route 111 Desert")               --Move to 4th Site
        end
    elseif getMapName() == "Route 112" then
        if x == 2 then
            moveToMap("Fiery Path")                     --Move to 3rd Site
        elseif x == 3 then
            moveToMap("Route 111 South")                --Move to 4th Site
        end
    elseif getMapName() == "Fiery Path" then
        if x == 2 then
            log("-- Info| We are now entering Feral Site! --")
            talkToNpcOnCell(14,32)                      --Feral Site 3rd
        elseif x == 3 then
            log("-- Update| Backup count = "..x)
            moveToMap("Route 112")                      --Move to 4th Site
        end
    elseif getMapName() == "Feral Site" then
        moveToCell(5,7)                             --Done Site
        x = x + 1
    elseif getMapName() == "Route 111 Desert" then
        if x == 3 then
            log("-- Info| We are now entering Historical Site! --")
            talkToNpcOnCell(34,31)                      --Historical Site 4th
        elseif x == 4 then
            log("-- Update| Backup count = "..x)
            moveToMap("Route 111 North")                --Move to 5th Site
        end
    elseif getMapName() == "Historical Site" then
        moveToCell(2,8)                             --Done Site
        x = x + 1
    elseif getMapName() == "Route 111 North" then
        moveToMap("Route 113")                      --Move to 5th Site
    elseif getMapName() == "Route 113" then
        moveToMap("Fallarbor Town")                 --Move to 5th Site
    elseif getMapName() == "Fallarbor Town" then
        moveToMap("Route 114")                      --Move to 5th Site
    elseif getMapName() == "Route 114" then
        moveToMap("Meteor Falls 1F 1R")             --Move to 5th Site
    elseif getMapName() == "Meteor Falls 1F 1R" then
        moveToMap("Route 115")                      --Move to 5th Site
    elseif getMapName() == "Route 115" then
        if x == 4 then
            log("-- Info| We are now entering Mineral Site! --")
            talkToNpcOnCell(81,78)                      --Mineral Site 5th
        elseif x == 5 then
            log("-- Update| Backup count = "..x)
            moveToMap("Rustboro City")                  --Move to last Site
        end
    elseif getMapName() == "Mineral Site" then
        moveToCell(9,6)                             --Done Site
        x = x + 1
    elseif getMapName() == "Rustboro City" then
        moveToMap("Route 116")                      --Move to last Site
    elseif getMapName() == "Route 116" then
        moveToMap("Rusturf Tunnel")                 --Move to last Site
    elseif getMapName() == "Rusturf Tunnel" then
        if x == 5 then
            log("-- Info| We are now entering Haunted Site! --")
            talkToNpcOncell(26,15)                      --Haunted Site Last
        elseif x == 6 then
            log("-- Update| Backup count = "..x)
            log("-- Warning!!! No Site to Smash!!! Going back to starting map... --")
            moveToMap("Verdanturf Town")                --End
        end
    elseif getMapName() == "Haunted Site" then
        moveToCell(3,8)                             --Done Site
        x = x + 1
    elseif getMapName() == "Verdanturf Town" then
        moveToMap("Route 117")                      --End
    elseif getMapName() == "Route 117" then
        moveToMap("Mauville City Stop House 2")     --End
    elseif getMapName() == "Mauville City Stop House 2" then
        moveToMap("Mauville City")                  --End     
    end
  end
end
