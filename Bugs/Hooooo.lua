
function onStart()
    x = 0
    y= 0
    z= 0
end

function onPathAction()
  if isPokemonUsable(1)
    if getMapName() == "Lilycove City" then
            moveToMap("Route 121")
    elseif getMapName() == "Route 121" then
        if x == 0 then
            moveToMap("Route 120")      --Move to next Site
        elseif
            moveToMap("Lilycove City")  --End
        end
    elseif getMapName() == "120" then
        if x == 0 then
        moveToMap("Fortree City")   --Move to next Site
        moveToMap("Route 121")      --End
    elseif getMapName() == "Fortree City" then
        if x == 0 then
        moveToMap("Route 119A")     --Move to next Site
        moveToMap("Route 120")      --End
    elseif getMapName() == "Route 119A" then
        talkToNpcOnCell(16,68)      --Move to Natural Site
        moveToMap("Route 119B")     --Move to 2nd Site
        moveToMap("Fortree City")   --End
    elseif getMapName() == "Natural Site" then
        moveToCell(6,7)             --Done Site
    elseif getMapName() == "Route 119B" then
        moveToMap("Route 118")      --Move to 2nd Site
        moveToMap("Route 119A")     --End
    elseif getMapName() == "Route 118" then
        moveToMap("Mauville City Stop House 4")     --Move to 2nd Site
        moveToMap("Route 119B")                     --End
    elseif getMapName() == "Mauville City Stop House 4" then
        moveToMap("Mauville City")                  --Move to 2nd Site
         moveToMap("Route 118")                     --End
    elseif getMapName() == "Mauville City" then
        moveToMap("Mauville City Stop House 1")     --Move to 2nd Site
        moveToMap("Mauville City Stop House 3")     --Move to 3rd Site
        moveToMap("Mauville City Stop House 4")     --End
    elseif getMapName() == "Mauville City Stop House 1" then
        moveToMap("Route 110")                      --Move to 2nd Site
        moveToMap("Mauville City")                  --Move to 3rd Site
    elseif getMapName() == "Route 110" then
        moveToMap("Route 103")                      --Move to 2nd Site
        moveToMap("Mauville City Stop House 1")     --Move to 3rd Site
    elseif getMapName() == "Route 103" then
        talkToNpcOnCell(55,4)                       --Glacial Site 2nd
        moveToMap("Route 110")                      --Move to 3rd Site
    elseif getMapName() == "Glacial Site" then
        moveToCell(5,5)                             --Done Site
    elseif getMapName() == "Mauville City Stop House 3" then
        moveToMap("Route 111 South")                --Move to 3rd Site
    elseif getMapName() == "Route 111 South" then
        moveToMap("Route 112")                      --Move to 3rd Site
        moveToMap("Route 111 Desert")               --Move to 4th Site
    elseif getMapName() == "Route 112" then
        moveToMap("Fiery Path")                     --Move to 3rd Site
        moveToMap("Route 111 South")                --Move to 4th Site
    elseif getMapName() == "Fiery Path" then
        talkToNpcOnCell(14,32)                      --Feral Site 3rd
        moveToMap("Route 112")                      --Move to 4th Site
    elseif getMapName() == "Feral Site" then
        moveToCell(5,7)                             --Done Site
    elseif getMapName() == "Route 111 Desert" then
        talkToNpcOnCell(34,31)                      --Historical Site 4th
        moveToMap("Route 111 North")                --Move to 5th Site
    elseif getMapName() == "Historical Site" then
        moveToCell(2,8)                             --Done Site
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
        talkToNpcOnCell(81,78)                      --Mineral Site 5th
        moveToMap("Rustboro City")                  --Move to last Site
    elseif getMapName() == "Mineral Site" then
        moveToCell(9,6)                             --Done Site
    elseif getMapName() == "Rustboro City" then
        moveToMap("Route 116")                      --Move to last Site
    elseif getMapName() == "Route 116" then
        moveToMap("Rusturf Tunnel")                 --Move to last Site
    elseif getMapName() == "Rusturf Tunnel" then
        talkToNpcOncell(26,15)                      --Haunted Site Last
        moveToMap("Verdanturf Town")                --End
    elseif getMapName() == "Haunted Site" then
        moveToCell(3,8)                             --Done Site --
    elseif getMapName() == "Verdanturf Town" then
        moveToMap("Route 117")                      --End
    elseif getMapName() == "Route 117" then
        moveToMap("Mauville City Stop House 2")     --End
    elseif getMapName() == "Mauville City Stop House 2" then
        moveToMap("Mauville City")                  --End     
    end
  end
end
